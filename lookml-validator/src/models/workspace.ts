import {
  Diagnostic,
  DiagnosticSeverity,
  DocumentUri,
  Location,
  Position,
  Range,
} from "vscode-languageserver-types";
import { TextDocument } from "vscode-languageserver-textdocument";
import * as path from "path";

// Define a minimal Connection interface to avoid full vscode-languageserver/node dependency
interface MinimalConnection {
  sendRequest: (method: string, params?: any) => Promise<any>;
  sendNotification: (method: string, params?: any) => void;
  // Add other methods if used by WorkspaceModel, e.g., onNotification, dispose
}
import { URI } from "vscode-uri";
import {
  LookMLParser,
} from "./lookml-parser";
import { parseFiles, parse, LookmlProject, LookmlViewWithFileInfo, LookmlExploreWithFileInfo, transformations, LookmlModelWithFileInfo, LookmlError, LookmlExplore, LookmlView, LookmlModel, LookmlFile, } from "lookml-parser";

export class WorkspaceModel {
  public connection: MinimalConnection; // Use the minimal interface
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

  constructor(args: { connection: MinimalConnection }) { // Use the minimal interface
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

  public async parseDocument(document: TextDocument): Promise<void> {
    const response = parse(document.getText());
    const isModel = document.uri.includes(".model");
    const cwd = process.cwd();

    const filePath = document.uri.replace(`file://${cwd}/`, "")
    const fullFileName = filePath.split("/").pop() ?? "";
    const fileRel = filePath.split(".")[0];

    const project: LookmlProject = {
      file: {
        [filePath.replace(".lkml", "")]: {
          ...response,
          $file_name: fullFileName.split(".")[0],
          $file_path: filePath,
          $file_rel: fileRel,
          $file_type: isModel ? "model" : "view",
        },
      },
    }
    transformations.addPositions(project as any);

    // parseDocument makes file paths relative to process.cwd(), so pass that as projectRoot
    await this.processProject(project, process.cwd());
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
      this.explores = new Map<string, LookmlExploreWithFileInfo>();
      this.models = new Map<string, LookmlModelWithFileInfo>();
      this.views = new Map<string, LookmlViewWithFileInfo>();
      this.viewsByFile = new Map<DocumentUri, string[]>();
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

    // Determine projectRoot based on the source pattern
    let projectRoot = process.cwd();
    if (source && source.includes("/**/")) {
      projectRoot = source.substring(0, source.indexOf("/**/"));
    } else if (source && !source.startsWith("**")) {
      // If source is a specific path without globstars for directory traversal, resolve it
      projectRoot = path.resolve(source.substring(0, source.lastIndexOf('/') > -1 ? source.lastIndexOf('/') : source.length));
    }
    await this.processProject(project, projectRoot);
  }

  public async processProject(project: LookmlProject, projectRoot: string): Promise<void> {
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
        $file_name: value.$file_name,
        $file_path: value.$file_path,
        $file_rel: value.$file_rel,
        $file_type: value.$file_type,
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
      const filePath = file.$file_path;
      const fileName = file.$file_name;

      const absoluteFilePath = path.resolve(projectRoot, filePath);
      const uri = URI.file(absoluteFilePath).toString();
      const viewsByFile = this.viewsByFile.get(uri) || [];

      const filePositions = project?.positions?.file[filePath.replace(".lkml", "")];

      if (!filePositions) {
        throw new Error(`filePositions not found for ${filePath}`);
      }

      this.views.set(viewName, {
        file,
        uri,
        view,
        positions: filePositions?.view?.[viewName],
      });


      if (viewsByFile.includes(viewName)) {
        continue;
      }

      viewsByFile.push(viewName);
      this.viewsByFile.set(uri, viewsByFile);
    }

    for (const { file, explore } of entities.explore) {
      const exploreName = explore.$name;
      const filePath = file.$file_path;
      const fileName = file.$file_name;

      const absoluteFilePath = path.resolve(projectRoot, filePath);
      const uri = URI.file(absoluteFilePath).toString();
      const filePositions = project?.positions?.file[filePath.replace(".lkml", "")];

      if (!filePositions) {
        throw new Error(`filePositions not found for ${filePath}`);
      }

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

          const absoluteFilePath = path.resolve(projectRoot, filePath);
          const uri = URI.file(absoluteFilePath).toString();
          const filePositions = project?.positions?.file[`${fileRel}.model`];

          if (!filePositions) {
            throw new Error(`filePositions not found for ${filePath}`);
          }

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

    // Determine projectRoot for parseDocument, typically CWD or a specific project context if available
    // For simplicity here, we assume parseDocument is called for files already processed by parseFiles
    // or it should establish its own projectRoot if called independently.
    // The filePath in parseDocument is derived from document.uri which should be absolute.
    // const cleanUri = uri.replace(`file://${process.cwd()}/`, ""); // This might be too simplistic

    // filePath in parseDocument is derived from an absolute URI, so it should be absolute.
    // The main challenge is ensuring consistency if parseDocument can be called for files
    // not rooted in the same way as parseFiles.
    // For now, parseDocument's internal logic for filePath seems to aim for relative paths to CWD.
    // This might need further refinement if parseDocument is used more broadly.
    try {
      // parseDocument needs to be consistent with how projectRoot is handled if it relies on relative paths
      // For now, its internal logic for filePath is: document.uri.replace(`file://${process.cwd()}/`, "")
      // This assumes document.uri is always relative to current CWD if made relative.
      // This is okay if process.cwd() is the actual project root during tests that use process.chdir().
      await this.parseDocument(document);
    } catch (error) {
      const cleanUri = uri.startsWith('file://') ? new URL(uri).pathname : uri;
      const fileName = path.basename(cleanUri);
      const dirPath = path.dirname(cleanUri);
      // fileRel might need to be relative to a project root, not just the parent dir.
      // This logic for fileRel and fileType might be too simple if dirPath is not a direct model/view container.
      const fileRel = path.basename(dirPath);
      const fileType = fileName.includes(".model.") ? "model" : (fileName.includes(".view.") ? "view" : "explore");

      const lookmlError: LookmlError = {
        error: error as LookmlError["error"], // Ensure this cast is safe or add type check
        $file_name: fileName,
        $file_path: cleanUri, // Use the cleaned, absolute path
        $file_rel: fileRel,   // This relative path might need to be more robust
        $file_type: fileType,
      };

      // Check if error.exception and error.exception.location exist before accessing them
      if ((error as any)?.error?.exception?.location) {
        const existingErrors = this.errors.get(fileName) ?? [];
        existingErrors.push(lookmlError);
        this.errors.set(fileName, existingErrors);
      } else {
        // Handle cases where the error structure is different or location is missing
        // For example, log a generic error or create a diagnostic at line 0
        const genericError: LookmlError = {
           error: { name: "UnknownParseError", exception: { message: (error as Error).message, location: { start: {line:0, column:0, offset: 0}, end:{line:0,column:0, offset: 0}}}, context:"", stack:"" },
           $file_name: fileName,
           $file_path: cleanUri,
           $file_rel: fileRel,
           $file_type: fileType,
        };
        const existingErrors = this.errors.get(fileName) ?? [];
        existingErrors.push(genericError);
        this.errors.set(fileName, existingErrors);
      }
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

    const fileName = uri.split("/").pop() ?? "";

    const errorsByFile = this.errors.get(fileName) ?? [];
    errorsByFile.forEach((error) => {
      this.errors.delete(fileName);
    });
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