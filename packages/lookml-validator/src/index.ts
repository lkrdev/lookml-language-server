import * as fs from "fs/promises";
import {
  Diagnostic,
  DiagnosticsProvider,
  TextDocument,
  WorkspaceModel,
} from "lookml-language-server";
import * as path from "path";

const dummyConnection = {
  sendRequest: async () => [],
  // Add other no-op methods if needed
} as any;

/**
 * Validate all LookML files in a workspace folder and return [diagnostics](https://github.com/AArnott/vscode-languageserver-protocol/blob/master/README.md#diagnostic).
 * @param folderPath Path to the workspace folder (defaults to process.cwd())
 */
async function validate(folderPath?: string) {
  const workspacePath = folderPath ? path.resolve(folderPath) : process.cwd();
  const lookmlGlob = "**/*.lkml";

  // Find all LookML files
  async function findLookmlFiles(dir: string): Promise<string[]> {
    const entries = await fs.readdir(dir, { withFileTypes: true });
    const files: string[] = [];
    for (const entry of entries) {
      const fullPath = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        files.push(...(await findLookmlFiles(fullPath)));
      } else if (/\.(model|view|explore)\.lkml$/.test(entry.name)) {
        files.push(fullPath);
      }
    }
    return files;
  }

  const files = await findLookmlFiles(workspacePath);
  const workspaceModel = new WorkspaceModel({ connection: dummyConnection });
  await workspaceModel.parseFiles({
    source: path.join(workspacePath, lookmlGlob),
    reset: true,
  });
  const diagnosticsProvider = new DiagnosticsProvider(workspaceModel);

  const diagnosticsList: { file: string; diagnostics: Diagnostic[] }[] = [];
  for (const file of files) {
    const content = await fs.readFile(file, "utf8");
    const document = TextDocument.create(
      `file://${file}`,
      "lookml",
      1,
      content
    );
    const diagnostics = diagnosticsProvider.validateDocument(document);
    diagnosticsList.push({ file, diagnostics });
  }
  return diagnosticsList;
}

export default validate;
export type { Diagnostic };
