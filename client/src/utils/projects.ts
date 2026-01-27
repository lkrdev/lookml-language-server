import * as lookmlParser from "lookml-parser";
import * as vscode from "vscode";

let cachedProjectName: string | undefined = undefined;

export const getProjectName = async (
  forceRefresh?: boolean,
): Promise<string> => {
  if (cachedProjectName !== undefined && !forceRefresh) {
    return cachedProjectName;
  }
  const folders = vscode.workspace.workspaceFolders;
  if (!folders || folders.length === 0) {
    cachedProjectName = "";
    return "";
  }
  const rootUri = folders[0].uri;

  // 1. Try .lkrconfig.json
  try {
    const configUri = vscode.Uri.joinPath(rootUri, ".lkrconfig.json");
    const content = await vscode.workspace.fs.readFile(configUri);
    const json = JSON.parse(Buffer.from(content).toString());
    if (json.project_name) {
      cachedProjectName = json.project_name;
      return cachedProjectName;
    }
  } catch (e) {
    // Ignore error if file doesn't exist or is invalid
  }

  // 2. Try manifest.lkml
  try {
    const manifestUri = vscode.Uri.joinPath(rootUri, "manifest.lkml");
    const content = await vscode.workspace.fs.readFile(manifestUri);
    const text = Buffer.from(content).toString();
    const parsed = lookmlParser.parse(text) as any;
    if (parsed && parsed.project_name) {
      cachedProjectName = parsed.project_name;
      return cachedProjectName;
    }
  } catch (e) {
    // Ignore
  }

  cachedProjectName = "";
  return "";
};

export const setProjectName = async (projectName: string) => {
  const folders = vscode.workspace.workspaceFolders;
  if (!folders || folders.length === 0) {
    return;
  }
  const rootUri = folders[0].uri;
  const manifestUri = vscode.Uri.joinPath(rootUri, "manifest.lkml");
  const configUri = vscode.Uri.joinPath(rootUri, ".lkrconfig.json");

  let manifestExists = false;
  try {
    await vscode.workspace.fs.stat(manifestUri);
    manifestExists = true;
  } catch (e) {
    manifestExists = false;
  }

  if (manifestExists) {
    try {
      const content = await vscode.workspace.fs.readFile(manifestUri);
      let text = Buffer.from(content).toString();
      const parsed = lookmlParser.parse(text) as any;
      const regex = /project_name:\s*["']([^"']+)["']/;

      if (parsed && parsed.project_name) {
        // If it exists in the parsed object, we try to replace it in the text
        if (text.match(regex)) {
          text = text.replace(regex, `project_name: "${projectName}"`);
        } else {
          // This case is unlikely if parsed.project_name exists, but as a fallback:
          text = `project_name: "${projectName}"\n` + text;
        }
      } else {
        // Doesn't exist, prepend it
        text = `project_name: "${projectName}"\n` + text;
      }
      await vscode.workspace.fs.writeFile(manifestUri, Buffer.from(text));
    } catch (e) {
      const message = `Failed to update manifest.lkml: ${e instanceof Error ? e.message : String(e)}`;
      console.error(message);
      vscode.window.showErrorMessage(message);
    }
  } else {
    let config: any = {};
    try {
      const content = await vscode.workspace.fs.readFile(configUri);
      config = JSON.parse(Buffer.from(content).toString());
    } catch (e) {
      // Ignore if file doesn't exist
    }
    config.project_name = projectName;
    await vscode.workspace.fs.writeFile(
      configUri,
      Buffer.from(JSON.stringify(config, null, 2)),
    );
  }
  cachedProjectName = projectName;
};

export const moveProjectNameFromConfigToManifest = async () => {
  const folders = vscode.workspace.workspaceFolders;
  if (!folders || folders.length === 0) {
    return;
  }
  const rootUri = folders[0].uri;
  const configUri = vscode.Uri.joinPath(rootUri, ".lkrconfig.json");
  const manifestUri = vscode.Uri.joinPath(rootUri, "manifest.lkml");

  try {
    // 1. Read from config
    const configContent = await vscode.workspace.fs.readFile(configUri);
    const config = JSON.parse(Buffer.from(configContent).toString());
    const projectName = config.project_name;

    if (!projectName) {
      throw new Error("No project_name found in .lkrconfig.json");
    }

    // 2. Write to manifest (the setProjectName logic with manifestExists=true)
    let manifestText = "";
    try {
      const content = await vscode.workspace.fs.readFile(manifestUri);
      manifestText = Buffer.from(content).toString();
    } catch (e) {
      // Manifest doesn't exist, will create it
    }

    const parsed = lookmlParser.parse(manifestText) as any;
    const regex = /project_name:\s*["']([^"']+)["']/;

    if (parsed && parsed.project_name && manifestText.match(regex)) {
      manifestText = manifestText.replace(
        regex,
        `project_name: "${projectName}"`,
      );
    } else {
      manifestText = `project_name: "${projectName}"\n` + manifestText;
    }
    await vscode.workspace.fs.writeFile(manifestUri, Buffer.from(manifestText));

    // 3. Update config
    delete config.project_name;
    if (Object.keys(config).length === 0) {
      await vscode.workspace.fs.delete(configUri);
    } else {
      await vscode.workspace.fs.writeFile(
        configUri,
        Buffer.from(JSON.stringify(config, null, 2)),
      );
    }

    cachedProjectName = projectName;
    vscode.window.showInformationMessage(
      `Moved project "${projectName}" to manifest.lkml`,
    );
  } catch (error) {
    vscode.window.showErrorMessage(`Failed to move project: ${error}`);
  }
};

export const invalidateProjectCache = () => {
  cachedProjectName = undefined;
};
