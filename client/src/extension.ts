import * as path from "path";
import * as vscode from "vscode";
import { ExtensionContext, workspace } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  TransportKind,
} from "vscode-languageclient/node";

const CREDENTIALS_KEY = 'looker.credentials';
const PROJECT_NAME_KEY = 'looker.projectName';



const getCredentials = () => {
  return vscode.workspace.getConfiguration().get(CREDENTIALS_KEY, { base_url: '', client_id: '', client_secret: '' });
}

const getProjectName = () => {
  return vscode.workspace.getConfiguration().get(PROJECT_NAME_KEY, '');
}

const setProjectName = (projectName: string) => {
  return vscode.workspace.getConfiguration().update(PROJECT_NAME_KEY, projectName, true);
}

const authLooker = async (reset?: boolean) => {
  try {
    // Prompt for credentials
    let { base_url, client_id, client_secret } = reset ? { base_url: '', client_id: '', client_secret: '' } : getCredentials();

    if (!base_url?.length) {
      base_url = await vscode.window.showInputBox({
        prompt: 'Enter Looker base URL (e.g., https://your-instance.looker.com)',
        placeHolder: 'https://your-instance.looker.com'
      });
      if (!base_url.startsWith('http')) {
        base_url = `https://${base_url}`;
      }
      if (base_url.endsWith('/')) {
        base_url = base_url.slice(0, -1);
      }
      await vscode.workspace.getConfiguration().update(
        CREDENTIALS_KEY,
        { base_url: base_url, client_id: client_id, client_secret: client_secret },
        true
      );
    }

    if (!client_id?.length) {
      client_id = await vscode.window.showInputBox({
        prompt: 'Enter Looker client ID',
        placeHolder: 'your_client_id'
      });
      await vscode.workspace.getConfiguration().update(
        CREDENTIALS_KEY,
        { base_url: base_url, client_id: client_id, client_secret: client_secret },
        true
      );
    }

    if (!client_secret?.length) {
      client_secret = await vscode.window.showInputBox({
        prompt: 'Enter Looker client secret',
        placeHolder: 'your_client_secret',
        password: true
      });
      await vscode.workspace.getConfiguration().update(
        CREDENTIALS_KEY,
        { base_url: base_url, client_id: client_id, client_secret: client_secret },
        true
      );
    }

    // Execute the server command
    if (!(base_url?.length && client_id?.length && client_secret?.length)) {
      vscode.window.showErrorMessage('Please enter all required credentials');
      return;
    }

    const result = await client.sendRequest<CommandResponse>('workspace/executeCommand', {
      command: 'looker.authenticate',
      arguments: [base_url, client_id, client_secret],
    });

    if (result.success) {
      vscode.window.showInformationMessage(result.message);
    } else {
      vscode.window.showErrorMessage(result.message);
    }
  } catch (error) {
    vscode.window.showErrorMessage(`Failed to authenticate: ${error instanceof Error ? error.message : String(error)}`);
  }
}

interface CommandResponse {
  success: boolean;
  message: string;
}

let client: LanguageClient;
const outputChannel = vscode.window.createOutputChannel("LookML");

export function activate(context: ExtensionContext) {
  // The server is implemented in node
  const serverModule = context.asAbsolutePath(
    path.join("server", "out", "server.js")
  );

  // Server options
  const serverOptions: ServerOptions = {
    run: { module: serverModule, transport: TransportKind.ipc },
    debug: {
      module: serverModule,
      transport: TransportKind.ipc,
      options: { execArgv: ["--nolazy", "--inspect=6009"] },
    },
  };

  // Client options
  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "lookml" }],
    synchronize: {
      fileEvents: workspace.createFileSystemWatcher(
        "**/*.{lkml,lookml,model.lkml,view.lkml,explore.lkml}"
      ),
    },
    outputChannel,
  };

  // Create the client
  client = new LanguageClient(
    "lookmlLanguageServer",
    "LookML Language Server",
    serverOptions,
    clientOptions
  );

  client.onRequest("lookml/findMatchingFiles", async (params: any) => {
    const { baseDir, pattern } = params;

    const patternWithExtension = `${pattern}.{lkml,lookml,model.lkml,view.lkml,explore.lkml}`;

    try {
      // Convert the pattern to a glob that VS Code can understand
      const glob = new vscode.RelativePattern(
        vscode.Uri.file(baseDir),
        patternWithExtension
      );

      // Use VS Code's API to find files
      const files = await vscode.workspace.findFiles(glob);

      // Log what we found
      outputChannel.appendLine(`Found ${files.length} matching files`);

      // Return absolute file paths
      return files.map((file) => file.fsPath);
    } catch (error) {
      outputChannel.appendLine(`Error finding files: ${error}`);
      return [];
    }
  });

  client.onRequest("lookml/getFileContent", async (params: any) => {
    const { uri } = params;

    try {
      outputChannel.appendLine(`Reading file content: ${uri}`);

      // Convert string URI to VS Code URI
      const fileUri = vscode.Uri.parse(uri);

      // Read file content
      const content = await vscode.workspace.fs.readFile(fileUri);

      // Convert Buffer to string
      return {
        uri: uri,
        content: Buffer.from(content).toString("utf-8"),
      };
    } catch (error) {
      outputChannel.appendLine(`Error reading file ${uri}: ${error}`);
      return null;
    }
  });

  // Register commands
  context.subscriptions.push(
    vscode.commands.registerCommand('looker.showOutput', () => {
      outputChannel.show();
    })
  );

  context.subscriptions.push(
    vscode.commands.registerCommand('looker.reauthenticate', () => {
      authLooker(true);
    })
  );
  
  context.subscriptions.push(
    vscode.commands.registerCommand('looker.selectProject', async () => {
      const projectName = await vscode.window.showInputBox({
        prompt: 'Enter Looker project name',
        placeHolder: 'your_project_name'
      });
      setProjectName(projectName);
    })
  );

  context.subscriptions.push(
    vscode.commands.registerCommand('looker.syncBranches', async () => {
      let projectName = getProjectName();
      if (!projectName) {
        projectName = await vscode.window.showInputBox({
          prompt: 'Enter Looker project name',
          placeHolder: 'your-project-name'
        });
        setProjectName(projectName);
      }

      const dev_branch = await client.sendRequest<{success: boolean, branch_name: string}>('workspace/executeCommand', {
        command: 'looker.getDevBranch',
        arguments: [projectName],
      });

      const current_branch = await client.sendRequest<{success: boolean, branch_name: string}>('workspace/executeCommand', {
        command: 'looker.getCurrentBranch',
      });
      if (dev_branch.branch_name !== current_branch.branch_name) {
        const switch_to_branch_and_pull = await client.sendRequest<CommandResponse>('workspace/executeCommand', {
          command: 'looker.switchToBranchAndPull',
          arguments: [dev_branch.branch_name],
        })
      }
    })
  )

  context.subscriptions.push(
    vscode.commands.registerCommand('looker.resetToRemote', async () => {
      let projectName = getProjectName();
      if (!projectName?.length) {
        projectName = await vscode.window.showInputBox({
          prompt: 'Enter Looker project name',
          placeHolder: 'your-project-name'
        });
        await setProjectName(projectName);
      }
      
      const result = await client.sendRequest<CommandResponse>('workspace/executeCommand', {
        command: 'looker.remoteReset',
        arguments: [projectName],
      });
      if (result.success) {
        vscode.window.showInformationMessage(result.message);
      } else {
        vscode.window.showErrorMessage(result.message);
      }
    })
  )
  

  client.start();
  // Start the client AFTER registering handlers
  context.subscriptions.push(client);

  const { base_url, client_id, client_secret } = getCredentials();
  if (base_url?.length && client_id?.length && client_secret?.length) {
    authLooker(false);
  }

  // Log activation
  outputChannel.appendLine("LookML Language Server extension activated");
}

export function deactivate(): Thenable<void> | undefined {
  // Log deactivation
  if (outputChannel) {
    outputChannel.appendLine("LookML Language Server extension deactivated");
  }

  if (!client) {
    return undefined;
  }
  return client.stop();
}