import * as vscode from "vscode";
import { commands } from "vscode";

export async function addInstance() {
  let new_instance = await vscode.window.showInputBox({
    prompt: "Enter Looker base URL (e.g., https://your-instance.looker.com)",
    placeHolder: "https://your-instance.looker.com",
  });
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
    }
  );

  let instance_name = await vscode.window.showInputBox({
    prompt: "Enter Looker instance name",
    value:
      (use_production.value === 1 ? "prod-" : "dev-") +
      new_instance.substring(new_instance.lastIndexOf("/") + 1),
  });
  if (!(instance_name && instance_name.length)) {
    vscode.window.showErrorMessage("Instance name is required");
    return {
      success: false,
      message: "Instance name is required",
      data: {
        instance_name: instance_name,
        base_url: new_instance,
        use_production: use_production.value,
      },
    };
  }
  try {
    const add_instance = await commands.executeCommand(
      "looker.addInstance",
      instance_name,
      new_instance,
      use_production.value
    );
    vscode.window.showInformationMessage(
      "Successfully authenticated with new instance"
    );
    return add_instance as {
      success: boolean;
      message: string;
      data: { instance_name: string; base_url: string };
    };
  } catch (error) {
    vscode.window.showErrorMessage(`Failed to add instance: ${error}`);
    return {
      success: false,
      message: `Failed to add instance: ${error}`,
      data: {
        instance_name: instance_name,
        base_url: new_instance,
        use_production: use_production,
      },
    };
  }
}
