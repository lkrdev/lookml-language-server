import { LookMLParser } from './models/lookml-parser';
// Types from the lookml-parser library (via src/types/lookml-parser.d.ts):
import { LookmlProject, LookmlError, LookmlModelWithFileInfo, LookmlViewWithFileInfo, LookmlExploreWithFileInfo } from 'lookml-parser';
import { WorkspaceModel } from './models/workspace';
import { DiagnosticsProvider } from './providers/diagnostics';
import { TextDocument } from 'vscode-languageserver-textdocument';
import { Diagnostic } from 'vscode-languageserver-types';
import * as fs from 'fs';
import * as path from 'path';

// Minimal Connection object for WorkspaceModel
const connection = {
  sendRequest: async () => { return []; }, // Return empty array for findMatchingFiles
  sendNotification: () => { /* no-op */ },
  onNotification: () => { /* no-op */ },
  dispose: () => { /* no-op */ }
} as any;


export class LookMLValidator {
  private workspaceModel: WorkspaceModel;
  private diagnosticsProvider: DiagnosticsProvider;

  constructor() {
    this.workspaceModel = new WorkspaceModel({ connection });
    this.diagnosticsProvider = new DiagnosticsProvider(this.workspaceModel);
  }

  public async validate(folderPath?: string): Promise<Diagnostic[]> {
    if (folderPath) {
      // Ensure the path is absolute
      const absoluteFolderPath = path.resolve(folderPath);
      // Use a glob pattern relative to the provided folder path
      await this.workspaceModel.parseFiles({ source: `${absoluteFolderPath}/**/*.{view,model,explore}.lkml`, reset: true });
    } else {
      // Default behavior: scan from the current working directory or a predefined root
      await this.workspaceModel.parseFiles({ reset: true });
    }

    let allDiagnostics: Diagnostic[] = [];
    const files = new Set<string>();

    // Collect all unique file URIs from models, views, and explores
    this.workspaceModel.getModels().forEach(model => files.add(model.uri));
    this.workspaceModel.getViews().forEach(view => files.add(view.uri));
    this.workspaceModel.getExplores().forEach(explore => files.add(explore.uri));

    for (const fileUri of files) {
      try {
        const filePath = fileUri.startsWith('file://') ? new URL(fileUri).pathname : fileUri;
        // Check if file exists and is accessible before reading
        if (!fs.existsSync(filePath)) {
          console.warn(`File not found or inaccessible: ${filePath}, skipping.`);
          // Optionally, add a diagnostic for missing files if that's desired behavior
          // allDiagnostics.push({
          //   message: `File not found: ${filePath}`,
          //   range: { start: { line: 0, character: 0 }, end: { line: 0, character: 0 } },
          //   severity: DiagnosticSeverity.Warning, // Or Error, depending on requirements
          //   source: 'lookml-validator'
          // });
          continue;
        }
        const content = fs.readFileSync(filePath, 'utf-8');
        const document = TextDocument.create(fileUri, 'lookml', 0, content);
        // It's important to update the document in the workspace model as well,
        // especially if parseFiles doesn't store the content or if there are incremental updates.
        await this.workspaceModel.updateDocument(document);
        const diagnostics = this.diagnosticsProvider.validateDocument(document);
        allDiagnostics = allDiagnostics.concat(diagnostics);
      } catch (error) {
        console.error(`Error processing file ${fileUri}:`, error);
        // Optionally, add a diagnostic for files that cause errors during processing
        // allDiagnostics.push({
        //   message: `Error processing file ${fileUri}: ${(error as Error).message}`,
        //   range: { start: { line: 0, character: 0 }, end: { line: 0, character: 0 } },
        //   severity: DiagnosticSeverity.Error,
        //   source: 'lookml-validator'
        // });
      }
    }
    return allDiagnostics;
  }
}

// Export a single Validate function
export async function Validate(folderPath?: string): Promise<Diagnostic[]> {
  const validator = new LookMLValidator();
  return validator.validate(folderPath);
}
