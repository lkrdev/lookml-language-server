import * as path from "path";
import * as vscode from "vscode";
import { workspace, ExtensionContext } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  TransportKind,
} from "vscode-languageclient/node";

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

  client.start();
  // Start the client AFTER registering handlers
  context.subscriptions.push(client);

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