import * as vscode from "vscode";
import { moveProjectNameFromConfigToManifest } from "../utils/projects";

export class ProjectConfigCodeLensProvider implements vscode.CodeLensProvider {
  public provideCodeLenses(
    document: vscode.TextDocument,
    token: vscode.CancellationToken,
  ): vscode.CodeLens[] | Thenable<vscode.CodeLens[]> {
    const lenses: vscode.CodeLens[] = [];
    if (!document.fileName.endsWith(".lkrconfig.json")) {
      return lenses;
    }

    for (let i = 0; i < document.lineCount; i++) {
      const line = document.lineAt(i);
      if (line.text.includes('"project_name":')) {
        const range = new vscode.Range(i, 0, i, line.text.length);
        const lens = new vscode.CodeLens(range, {
          title: "$(arrow-right) Move to manifest.lkml",
          tooltip: "Move project_name to manifest.lkml and clean up config",
          command: "looker.moveProjectToManifest",
        });
        lenses.push(lens);
      }
    }

    return lenses;
  }
}

export function registerConfigCodeLens(context: vscode.ExtensionContext) {
  const provider = new ProjectConfigCodeLensProvider();
  context.subscriptions.push(
    vscode.languages.registerCodeLensProvider(
      { pattern: "**/.lkrconfig.json" },
      provider,
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "looker.moveProjectToManifest",
      async () => {
        await moveProjectNameFromConfigToManifest();
      },
    ),
  );
}
