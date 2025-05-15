import {
  Connection,
  Diagnostic,
  DiagnosticSeverity,
  DocumentUri,
  Location,
  Position,
  Range,
} from "vscode-languageserver/node";
import { TextDocument } from "vscode-languageserver-textdocument";
import * as path from "path";
import { URI } from "vscode-uri";
import {
  LookMLParser,
} from "./lookml-parser";
import { parseFiles, LookmlProject, LookmlViewWithFileInfo, LookmlExploreWithFileInfo, transformations, LookmlModelWithFileInfo, LookmlError, LookmlExplore, LookmlView, LookmlModel, LookmlFile, } from "lookml-parser";

export class WorkspaceModel {
  public connection: Connection;
  private lookmlParser: LookMLParser;
  public project?: LookmlProject;

  // Document tracking
  private errors: Map<string, LookmlError[]> = new Map();
  private views: Map<string, LookmlViewWithFileInfo> = new Map();
  private explores: Map<string, LookmlExploreWithFileInfo> = new Map();
  private models: Map<string, LookmlModelWithFileInfo> = new Map();
  private viewsByFile: Map<DocumentUri, string[]> = new Map();
  private includedViews: Map<string, Set<string>> = new Map();
  private exploresByFile: Map<DocumentUri, string[]> = new Map();
  private modelsByFile: Map<DocumentUri, string[]> = new Map();
  private loadedFiles: Set<string> = new Set();

  // Version tracking for incremental updates
  private documentVersions: Map<DocumentUri, number> = new Map();

  constructor(args: { connection: Connection }) {
    this.connection = args.connection;
    this.lookmlParser = new LookMLParser();
  }


  public getView(name: string): LookmlViewWithFileInfo | undefined {
    return this.views.get(name);
  }

  public getViews(): Map<string, LookmlViewWithFileInfo> {
    return this.views;
  }

  public getViewsByFile(uri: string): string[] {
    return this.viewsByFile.get(uri) ?? [];
  }

  public getErrorsByFileName(fileName: string): LookmlError[] {
    return this.errors.get(fileName) ?? [];
  }


  public getExplore(name: string): LookmlExploreWithFileInfo | undefined {
    return this.explores.get(name);
  }

  public getExplores(): Map<string, LookmlExploreWithFileInfo> {
    return this.explores;
  }

  public getExploresByFile(uri: string): string[] {
    return this.exploresByFile.get(uri) ?? [];
  }

  public getModels(): Map<string, LookmlModelWithFileInfo> {
    return this.models;
  }

  public getModelsByFile(uri: string): string[] {
    return this.modelsByFile.get(uri) ?? [];
  }

  /**
   * Get a specific model by name
   */
  public getModel(name: string): LookmlModelWithFileInfo | undefined {
    return this.models.get(name);
  }

  public isViewFile(document: TextDocument): boolean {
    return document.uri.includes(".view") && document.getText().includes("view:");
  }

  public isModelFile(document: TextDocument): boolean {
    return document.uri.includes(".model");
  }

  public getViewNameFromFile(document: TextDocument): string | undefined {
    const lines = document.getText().split("\n");

    // Scan first 10 lines for view declaration
    for (let i = 0; i < Math.min(10, lines.length); i++) {
      const line = lines[i].trim();

      // Skip empty lines and comments
      if (line === "" || line.startsWith("#")) continue;

      const viewMatch = line.match(/^view:\s+([a-zA-Z0-9_]+)\s*\{/);
      if (viewMatch) {
        return viewMatch[1];
      }
    }

    return undefined;
  }

  /**
   * Initialize the workspace by finding and loading the model file
   */
  public async initialize(): Promise<void> {
    await this.parseFiles({
      reset: true,
    });
  }

  public async parseFiles({
    source,
    reset = false,
  }: {
    source?: string;
    reset?: boolean;
  }): Promise<void> {
    source = source ?? "**/*.{view,model,explore}.lkml";

    const project = await parseFiles({
      source,
      fileOutput: 'by-name',
      readFileOptions: { encoding: "utf-8" },
      readFileConcurrency: 4,
    });

    transformations.addPositions(project)

    if (reset) {
      this.errors = new Map<string, LookmlError[]>();
      this.views = new Map<string, LookmlViewWithFileInfo>();
      this.explores = new Map<string, LookmlExploreWithFileInfo>();
      this.models = new Map<string, LookmlModelWithFileInfo>();
    }

    if (!reset) {
      // TODO: remove this once we have a better way to handle updates
    }

    if (project.errors) {
      for (const error of project.errors) {
        const fileName = error.$file_path.split("/").pop() ?? "";
        const existingErrors = this.errors.get(fileName) ?? [];
        existingErrors.push(error);
        this.errors.set(fileName, existingErrors);
      }
    }

    const initialEntries: {
      view: Array<LookmlFile["view"]>,
      explore: Array<LookmlFile["explore"]>,
    } = {
      view: [],
      explore: [],
    }

    const entities = Object.values(project.file).reduce((acc, value) => {
      const { explore, view } = value;
      const file = {
        name: value.$file_name,
        path: value.$file_path,
        rel: value.$file_rel,
        tyoe: value.$file_type,
      }

      if (explore) {
        Object.values(explore).forEach((explore) => {
          acc.explore.push({
            file,
            explore
          });
        });
      } 
      
      if (view) {
        Object.values(view).forEach((view) => {
          acc.view.push({
            file,
            view
          });
        });
      }
      return acc;
    }, initialEntries)

    
    for (const { file, view } of entities.view) {
      const viewName = view.$name;
      const filePath = file.path;

      const uri = `${process.cwd()}/${filePath}`;
      const viewsByFile = this.viewsByFile.get(uri) || [];

      const filePositions = project.positions.file[filePath.replace(".lkml", "")];

      this.views.set(viewName, {
        file,
        uri,
        view,
        positions: filePositions?.view?.[viewName],
      });

      
      if (viewsByFile.includes(viewName)) {
        return;
      }

      viewsByFile.push(viewName);
      this.viewsByFile.set(uri, viewsByFile);
    }

    for (const { file, explore } of entities.explore) {
      const exploreName = explore.$name;
      const filePath = file.path;

      const uri = `${process.cwd()}/${filePath}`;
      const filePositions = project.positions.file[filePath.replace(".lkml", "")];

      this.explores.set(exploreName, {
        explore,
        file,
        uri,
        positions: filePositions.explore?.[exploreName],
      });

      const fileExploreNames = this.exploresByFile.get(uri) || [];
      fileExploreNames.push(exploreName);
      this.exploresByFile.set(uri, fileExploreNames);
    }

    for (const [key, value] of Object.entries(project.file)) {
      switch (value.$file_type) {
        case "model": {
          const model = value as LookmlModel;
          const filePath = model.$file_path;
          const fileRel = model.$file_rel;
          const fileName = value.$file_name;

          this.includedViews.set(fileName, new Set<string>)

          const uri = `${process.cwd()}/${filePath}`;
          const filePositions = project.positions.file[`${fileRel}.model`];

          this.models.set(fileName, {
            model,
            uri,
            positions: filePositions,
          });

          const modelFileNames = this.modelsByFile.get(uri) || [];

          if (model.view) {
            Object.keys(model.view).forEach((viewName) => {
              const includedViews = this.includedViews.get(fileName) || new Set<string>();
              includedViews.add(viewName);
              this.includedViews.set(fileName, includedViews);
            });
          }

          if (!modelFileNames.includes(fileName)) {
            modelFileNames.push(fileName);
            this.modelsByFile.set(uri, modelFileNames);
          }

          const includes = typeof model.include === 'string' ? [model.include] : model.include;
          if (!includes) {
            continue;
          }

          for (const include of includes) {
            await this.resolveInclude(uri, include, fileName);
          }
        }
      }
    }
  }

  /**
   * Process a document and update the workspace model
   */
  public async updateDocument(document: TextDocument): Promise<void> {
    const { uri, version = 0 } = document;

    // Skip if we've already processed this version
    if (version && this.documentVersions.get(uri) === version) {
      console.log("SKIPPING UPDATE DOCUMENT", uri, version);
      return;
    }
    this.documentVersions.set(uri, version);

    // Remove existing data for this file
    this.clearDocumentData(uri);
    
    const cleanUri = uri.replace(`file://${process.cwd()}/`, "");
    try {
      await this.parseFiles({
        source: cleanUri,
      });
    } catch (error) {
      console.error("updateDocument parse error", error);
    }
  }

  /**
   * Remove data for a document that's been closed/deleted
   */
  public removeDocument(uri: DocumentUri): void {
    this.clearDocumentData(uri);
    this.documentVersions.delete(uri);
    this.loadedFiles.delete(uri);
  }

  /**
   * Clear all data associated with a document
   */
  private clearDocumentData(uri: DocumentUri): void {
    // Remove views defined in this file
    const viewNames = this.viewsByFile.get(uri) || [];
    for (const viewName of viewNames) {
      this.views.delete(viewName);
    }
    this.viewsByFile.delete(uri);

    // Remove explores defined in this file
    const exploreNames = this.exploresByFile.get(uri) || [];
    for (const exploreName of exploreNames) {
      this.explores.delete(exploreName);
    }
    this.exploresByFile.delete(uri);

    // Remove models defined in this file
    const modelNames = this.modelsByFile.get(uri) || [];
    for (const modelName of modelNames) {
      this.models.delete(modelName);
    }
    this.modelsByFile.delete(uri);
  }

  /**
   * Get diagnostics for a document
   */
  public getDiagnostics(document: TextDocument): Diagnostic[] {
    // Use lookml-parser to get advanced diagnostics
    const parserDiagnostics = this.lookmlParser.getDiagnostics(document);

    // Convert to LSP diagnostics format if needed
    const diagnostics: Diagnostic[] = parserDiagnostics.map((diag: any) => {
      return {
        severity: DiagnosticSeverity.Error,
        range:
          diag.range ||
          Range.create(Position.create(0, 0), Position.create(0, 1)),
        message: diag.message || "Unknown error",
        source: "lookml-lsp",
      };
    });

    return diagnostics;
  }

  /**
   * Find all references to a symbol in the workspace
   */
  public findReferences(name: string): Location[] {
    const references: Location[] = [];

    // Check if it's a view
    if (this.views.has(name)) {
      const view = this.views.get(name)!;
      console.log("findReferences view", view);
    }
    return references;
  }

  /**
   * Get the workspace folder containing a given document
   */
  public getWorkspaceFolder(documentUri: string): string | null {
    try {
      const parsedUri = URI.parse(documentUri);
      return path.dirname(parsedUri.fsPath);
    } catch (e) {
      return null;
    }
  }

  /**
   * Get model name from URI
   */
  public getModelNameFromUri(uri: string): string | null {
    const fileNameMatch = uri.match(/([^\/]+)\.model\.lkml$/);
    return fileNameMatch ? fileNameMatch[1] : null;
  }

  /**
   * Get included views for a model
   */
  public getIncludedViewsForModel(
    modelName: string
  ): Set<string> | undefined {
    return this.includedViews.get(modelName);
  }

  /**
   * Resolve include patterns to actual files
   */
  private async resolveInclude(
    baseUri: string,
    includePattern: string,
    modelName: string
  ): Promise<void> {
    try {
      // Clean up the pattern (remove quotes)
      const cleanPattern = includePattern
        .replace(/\s*#.*$/, "")   // 1. remove comments (everything after #)
        .replace(/^["']|["']$/g, ""); // 2. remove surrounding quotes

      // Get the base directory
      const baseDir = this.getWorkspaceFolder(baseUri);

      if (!baseDir) {
        console.log(`Could not determine base directory for ${baseUri}`);
        return;
      }
      // Send a custom request to the client to find matching files
      const matchedFiles = await this.getMatchingFiles(
        baseDir,
        cleanPattern
      );


      for (const filePath of matchedFiles) {
        if (this.loadedFiles.has(filePath)) continue;
        try {
          // Request file content via LSP
          const viewsFromThisFile =
            this.viewsByFile.get(filePath) || [];
      
          const modelIncludes = this.includedViews.get(modelName) || new Set();

          viewsFromThisFile.forEach((view) => modelIncludes.add(view));
          this.includedViews.set(modelName, modelIncludes);

        } catch (fileError) {
          console.error(`Failed to load file ${filePath}:`, fileError);
        }
      }
    } catch (e) {
      console.error(`Error resolving include ${includePattern}:`, e);
    }
  }

  /**
   * Request matching files from client
   */
  public async getMatchingFiles(
    baseDir: string,
    pattern: string
  ): Promise<string[]> {
    try {
      // Send a custom request to the client
      const response = await this.connection.sendRequest(
        "lookml/findMatchingFiles",
        {
          baseDir,
          pattern,
        }
      );

      // The response should be an array of file paths
      if (Array.isArray(response)) {
        return response;
      } else {
        console.error(`Invalid response format from client:`, response);
        return [];
      }
    } catch (error) {
      console.error(`Error requesting matching files from client:`, error);
      if (error instanceof Error) {
        console.error(`Error details:`, {
          message: error.message,
          stack: error.stack,
        });
      }
      return [];
    }
  }

  /**
   * Use lookml-parser to get completions
   */
  public getCompletions(document: TextDocument, position: Position): any[] {
    return this.lookmlParser.getCompletions(document, position);
  }

  /**
   * Use lookml-parser to get hover information
   */
  public getHoverInfo(
    document: TextDocument,
    position: Position
  ): any | null {
    return this.lookmlParser.getHoverInfo(document, position);
  }

  /**
   * Clean up resources when shutting down
   */
  public async cleanup(): Promise<void> {
    await this.lookmlParser.cleanup();
  }

  /**
   * Get fields for a specific table/view
   * Used for providing field completions in SQL contexts
   */
  public getTableFields(
    tableName: string
  ): { name: string; type: string }[] | null {
    // Look up the view in our workspace
    const viewDetails = this.getView(tableName);
    const view = viewDetails?.view;

    if (!view || !view.measure || !view.dimension) {
      return null;
    }

    // Convert the Map to an array of field objects
    const measureFields = view.measure ? Object.entries(view.measure).map(([fieldName, field]) => ({
      name: fieldName,
      type: field.type,
    })) : [];

    const dimensionFields = view.dimension ? Object.entries(view.dimension).map(([fieldName, field]) => ({
      name: fieldName,
      type: field.type,
    })) : [];

    const dimensionGroupFields = view.dimension_group ? Object.entries(view.dimension_group).map(([fieldName, field]) => ({
      name: fieldName,
      type: field.type,
    })) : [];

    return [...measureFields, ...dimensionFields, ...dimensionGroupFields];
  }
}