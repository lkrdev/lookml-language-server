import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";

export async function addInstance(client: LanguageClient) {
  let new_instance = await vscode.window.showInputBox({
    prompt: "Enter Looker base URL (e.g., https://your-instance.looker.com)",
    placeHolder: "https://your-instance.looker.com",
    ignoreFocusOut: true,
  });
  if (!new_instance) {
    return; // User cancelled
  }

  if (!new_instance.startsWith("http")) {
    new_instance = `https://${new_instance}`;
  }
  if (new_instance.endsWith("/")) {
    new_instance = new_instance.slice(0, -1);
  }
  const use_production = await vscode.window.showQuickPick(
    [
      { label: "Development", picked: true, value: 0 },
      { label: "Production", picked: false, value: 1 },
    ],
    {
      placeHolder:
        "Do you want this instance to be used for production or development mode?",
      ignoreFocusOut: true,
    },
  );

  if (!use_production) {
    return; // User cancelled
  }

  let instance_name = await vscode.window.showInputBox({
    prompt: "Enter Looker instance name",
    value:
      (use_production.value === 1 ? "prod-" : "dev-") +
      new_instance.substring(new_instance.lastIndexOf("/") + 1),
    ignoreFocusOut: true,
  });

  if (!instance_name) {
    return; // User cancelled
  }

  try {
    const add_instance = await vscode.window.withProgress(
      {
        location: vscode.ProgressLocation.Notification,
        title: `Authenticating with ${instance_name}...`,
        cancellable: false,
      },
      async () => {
        return await client.sendRequest<{
          success: boolean;
          message: string;
          data: { instance_name: string; base_url: string };
        }>("workspace/executeCommand", {
          command: "looker.addInstance",
          arguments: [instance_name, new_instance, use_production.value],
        });
      },
    );

    if (add_instance.success) {
      vscode.window.showInformationMessage(
        "Successfully authenticated with new instance",
      );
    } else {
      vscode.window.showErrorMessage(
        `Failed to add instance: ${add_instance.message}`,
      );
    }
    return add_instance;
  } catch (error) {
    vscode.window.showErrorMessage(`Failed to add instance: ${error}`);
    return {
      success: false,
      message: `Failed to add instance: ${error}`,
      data: {
        instance_name: instance_name,
        base_url: new_instance,
        use_production: use_production.value,
      },
    };
  }
}
