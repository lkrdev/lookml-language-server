import * as path from "path";
import * as vscode from "vscode";
import { ExtensionContext, QuickPickItem, workspace } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  TransportKind,
} from "vscode-languageclient/node";
import { addInstance } from "./addInstance";
import { registerConfigCodeLens } from "./providers/configCodeLens";
import {
  getProjectName,
  invalidateProjectCache,
  setProjectName,
} from "./utils/projects";

const promptForProject = async (
  currentProjectName?: string,
): Promise<string | undefined> => {
  try {
    const projectsResult = await vscode.window.withProgress(
      {
        location: vscode.ProgressLocation.Notification,
        title: "Fetching Looker projects...",
        cancellable: false,
      },
      async () => {
        return await client.sendRequest<{
          success: boolean;
          projects?: string[];
          message?: string;
        }>("workspace/executeCommand", {
          command: "looker.getAllProjects",
        });
      },
    );

    if (
      projectsResult.success &&
      projectsResult.projects &&
      projectsResult.projects.length > 0
    ) {
      const current = currentProjectName || (await getProjectName());
      const items: QuickPickItem[] = projectsResult.projects.map((p) => ({
        label: p,
        description: p === current ? "(current)" : undefined,
        alwaysShow: p === current,
      }));

      // Sort items so current is at the top if it exists
      items.sort((a, b) => {
        if (a.label === current) return -1;
        if (b.label === current) return 1;
        return a.label.localeCompare(b.label);
      });

      const manualItem: QuickPickItem = {
        label: "$(pencil) Enter manually...",
        description: "Type project name",
        alwaysShow: true,
      };

      const pick = await vscode.window.showQuickPick([...items, manualItem], {
        placeHolder: "Select a Looker project or enter manually",
        ignoreFocusOut: true,
      });

      if (!pick) {
        return undefined; // User cancelled
      }

      if (pick.label !== manualItem.label) {
        return pick.label;
      }
    }
  } catch (error) {
    console.error("Failed to fetch projects:", error);
    // Fallback to manual entry silently
  }

  // Fallback to InputBox
  return await vscode.window.showInputBox({
    prompt: "Enter Looker project name",
    placeHolder: "your-project-name",
    value: currentProjectName || (await getProjectName()),
    ignoreFocusOut: true,
  });
};

const validateProjectName = async (
  projectName: string | undefined,
): Promise<string | undefined> => {
  let currentProjectName = projectName;

  while (true) {
    if (!currentProjectName) {
      currentProjectName = await promptForProject();
      if (!currentProjectName) {
        return undefined; // User cancelled
      }
    }

    const response = await vscode.window.withProgress(
      {
        location: vscode.ProgressLocation.Notification,
        title: `Validating project "${currentProjectName}"...`,
        cancellable: false,
      },
      async () => {
        return await client.sendRequest<CommandResponse>(
          "workspace/executeCommand",
          {
            command: "looker.validateProject",
            arguments: [currentProjectName],
          },
        );
      },
    );

    if (response.success) {
      await setProjectName(currentProjectName);
      return currentProjectName;
    } else {
      const selection = await vscode.window.showErrorMessage(
        `Project "${currentProjectName}" not found on instance.`,
        "Try Again",
        "Cancel",
      );
      if (selection === "Try Again") {
        currentProjectName = undefined; // Trigger prompt again
      } else {
        return undefined; // User cancelled
      }
    }
  }
};

export interface CommandResponse<T = any> {
  success: boolean;
  message: string;
  data?: T;
}

let client: LanguageClient;
const outputChannel = vscode.window.createOutputChannel("LookML");

export function activate(context: ExtensionContext) {
  // Clear cache and reload project name on activation
  getProjectName(true);

  // Watch for changes to manifest.lkml and .lkrconfig.json to invalidate cache
  const configWatcher = vscode.workspace.createFileSystemWatcher(
    "**/{manifest.lkml,.lkrconfig.json}",
  );
  context.subscriptions.push(configWatcher);

  const invalidateCache = () => {
    invalidateProjectCache();
    getProjectName(); // Trigger reload
  };

  context.subscriptions.push(configWatcher.onDidChange(invalidateCache));
  context.subscriptions.push(configWatcher.onDidCreate(invalidateCache));
  context.subscriptions.push(configWatcher.onDidDelete(invalidateCache));

  registerConfigCodeLens(context);

  // The server is implemented in node
  const serverModule = context.asAbsolutePath(
    path.join("server", "out", "server.js"),
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
        "**/*.{lkml,lookml,model.lkml,view.lkml,explore.lkml}",
      ),
    },
    outputChannel,
  };

  // Create the client
  client = new LanguageClient(
    "lookmlLanguageServer",
    "LookML Language Server",
    serverOptions,
    clientOptions,
  );

  client.onRequest("lookml/findMatchingFiles", async (params: any) => {
    const { baseDir } = params;
    let { pattern } = params;

    try {
      // Validate base directory
      if (!baseDir) {
        throw new Error("Base directory is required");
      }

      // Ensure pattern ends with appropriate extension
      if (
        !/(\.lkml|\.lookml|\.model\.lkml|\.view\.lkml|\.explore\.lkml)$/i.test(
          pattern,
        )
      ) {
        pattern = `${pattern}.{lkml,lookml,model.lkml,view.lkml,explore.lkml}`;
      }

      // Remove leading slash if present
      if (pattern.startsWith("/")) {
        pattern = pattern.slice(1);
      }

      // 🔥 This was missing:
      const files = await vscode.workspace.findFiles(pattern);

      const filePaths = files.map((file) => file.fsPath);

      return filePaths;
    } catch (error) {
      outputChannel.appendLine(`Error finding files: ${error}`);
      throw error; // Re-throw to ensure the client knows about the error
    }
  });

  client.onRequest("lookml/getFileContent", async (params: any) => {
    const { uri } = params;

    try {
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
    vscode.commands.registerCommand("looker.showOutput", () => {
      outputChannel.show();
    }),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand("looker.selectProject", async () => {
      const current = await getProjectName();
      const selected = await promptForProject(current);
      if (selected) {
        await validateProjectName(selected);
      }
    }),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand("looker.syncBranches", async () => {
      let projectName = await getProjectName();
      projectName = await validateProjectName(projectName);
      if (!projectName) return;

      const dev_branch = await client.sendRequest<{
        success: boolean;
        branch_name: string;
        message?: string;
      }>("workspace/executeCommand", {
        command: "looker.getDevBranch",
        arguments: [projectName],
      });

      if (!dev_branch.success) {
        vscode.window.showErrorMessage(
          dev_branch.message || "Failed to get dev branch",
        );
        return;
      }

      if (!dev_branch.branch_name) {
        vscode.window.showErrorMessage("Dev branch name is empty or null.");
        return;
      }

      const current_branch = await client.sendRequest<{
        success: boolean;
        branch_name: string;
        message?: string;
      }>("workspace/executeCommand", {
        command: "looker.getCurrentBranch",
      });

      if (!current_branch.success) {
        vscode.window.showErrorMessage(
          current_branch.message || "Failed to get current branch",
        );
        return;
      }

      if (dev_branch.branch_name !== current_branch.branch_name) {
        const switch_to_branch_and_pull =
          await client.sendRequest<CommandResponse>(
            "workspace/executeCommand",
            {
              command: "looker.switchToBranchAndPull",
              arguments: [dev_branch.branch_name],
            },
          );

        if (switch_to_branch_and_pull.success) {
          vscode.window.showInformationMessage(
            `Switched to branch ${dev_branch.branch_name} and pulled changes.`,
          );
        } else {
          vscode.window.showErrorMessage(
            switch_to_branch_and_pull.message ||
              "Failed to switch to branch and pull.",
          );
        }
      } else {
        vscode.window.showInformationMessage("Already on the dev branch.");
      }
    }),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand("looker.resetToRemote", async () => {
      let projectName = await getProjectName();
      projectName = await validateProjectName(projectName);
      if (!projectName) return;

      const result = await vscode.window.withProgress(
        {
          location: vscode.ProgressLocation.Notification,
          title: `Resetting project "${projectName}" to remote...`,
          cancellable: false,
        },
        async () => {
          return await client.sendRequest<CommandResponse>(
            "workspace/executeCommand",
            {
              command: "looker.remoteReset",
              arguments: [projectName],
            },
          );
        },
      );
      if (result.success) {
        vscode.window.showInformationMessage(result.message);
      } else {
        vscode.window.showErrorMessage(result.message);
      }
    }),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand("looker.login", async () => {
      const new_login_label = "+ Login to a new instance";
      const instances = await client.sendRequest<
        CommandResponse<
          {
            instance_name: string;
            base_url: string;
            current_instance: number;
          }[]
        >
      >("workspace/executeCommand", {
        command: "looker.listInstances",
      });
      const currentInstances: QuickPickItem[] =
        instances.data?.map((instance) => ({
          label: instance.instance_name,
          description:
            (instance.current_instance === 1 ? "current - " : "") +
            instance.base_url,
          alwaysShow: instance.current_instance === 1,
        })) || [];
      const newInstance: QuickPickItem = {
        label: new_login_label,
        picked: false,
      };
      const instanceItems = [...currentInstances, newInstance];
      let selectedInstance = await vscode.window.showQuickPick(instanceItems, {
        placeHolder: "Select an instance",
      });
      if (selectedInstance) {
        if (selectedInstance.label === new_login_label) {
          try {
            await addInstance(client);
          } catch (error) {
            vscode.window.showErrorMessage(`Failed to add instance: ${error}`);
          }
        } else {
          const response = await client.sendRequest<CommandResponse>(
            "workspace/executeCommand",
            {
              command: "looker.switchInstance",
              arguments: [selectedInstance.label],
            },
          );
          if (response.success) {
            vscode.window.showInformationMessage(response.message, {
              modal: true,
            });
          } else {
            vscode.window.showErrorMessage(
              `Failed to switch instance: ${response.message}`,
            );
          }
        }
      } else {
        vscode.window.showErrorMessage("No instance selected");
      }
    }),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "looker.saveAllStageAllCommitAndSync",
      async () => {
        let projectName = await getProjectName();
        projectName = await validateProjectName(projectName);
        if (!projectName) return;
        try {
          // 1. Save all files
          await vscode.commands.executeCommand(
            "workbench.action.files.saveAll",
          );
          // sleep for 1 second
          await new Promise((resolve) => setTimeout(resolve, 500));
          // 2. Stage all changes
          await vscode.commands.executeCommand("git.stageAll");

          // 3. Generate commit message (using Cursor's command if available)
          let commitMessage = "Auto-commit";
          try {
            commitMessage = await vscode.commands.executeCommand<string>(
              "cursor.generateGitCommitMessage",
            );
          } catch (e) {
            // Fallback if Cursor extension is not available
            commitMessage =
              (await vscode.window.showInputBox({
                prompt: "Enter a commit message",
                value: commitMessage,
              })) || commitMessage;
          }

          // 4. Commit all staged changes
          await vscode.commands.executeCommand("git.commitAll", {
            message: commitMessage,
          });

          // 5. Push to remote
          await vscode.commands.executeCommand("git.push");
          // sleep for 1 second
          await new Promise((resolve) => setTimeout(resolve, 500));

          // 6. Run Looker resetToRemote
          await vscode.commands.executeCommand("looker.resetToRemote");

          vscode.window.showInformationMessage(
            "All changes saved, committed, pushed, and Looker reset to remote.",
          );
        } catch (err: any) {
          vscode.window.showErrorMessage(
            `Error in saveAllStageAllCommitAndSync: ${err.message || err}`,
          );
        }
      },
    ),
  );

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
