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
  import { parseFiles, parse, LookmlObject, LookmlViewFile, LookmlModelFile, LookmlExploreFile, LookmlModel } from "lookml-parser";

  export class WorkspaceModel {
    public connection: Connection;
    private lookmlParser: LookMLParser;
    public project?: LookmlObject;

    // Document tracking
    private views: Map<string, LookmlViewFile> = new Map();
    private explores: Map<string, LookmlExploreFile> = new Map();
    private models: Map<string, LookmlModelFile> = new Map();
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

    /**
     * Get all views in the workspace
     */
    public getViews(): Map<string, LookmlViewFile> {
      return this.views;
    }

    public getExploresByFile(uri: DocumentUri): string[] | undefined {
      return this.exploresByFile.get(uri);
    }

    /**
     * Get a specific view by name
     */
    public getView(name: string): LookmlViewFile | undefined {
      return this.views.get(name);
    }

    /**
     * Get all explores in the workspace
     */
    public getExplores(): Map<string, LookmlExploreFile> {
      return this.explores;
    }

    /**
     * Get a specific explore by name
     */
    public getExplore(name: string): LookmlExploreFile | undefined {
      return this.explores.get(name);
    }

    /**
     * Get all models in the workspace
     */
    public getModels(): Map<string, LookmlModelFile> {
      return this.models;
    }

    /**
     * Get a specific model by name
     */
    public getModel(name: string): LookmlModel | undefined {
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
      const project = await parseFiles({
        source:  "*.{view,model,explore}.lkml",
        fileOutput: "by-name", // or "array" or "by-name". "by-name" is recommended. 
        readFileOptions: {encoding:"utf-8"},
        readFileConcurrency: 4,
      });

      this.project = this.parseProject(project);
    }

    parseProject(project: LookmlObject): any {
        this.views = this.views ?? new Map<string, LookmlViewFile>();
        this.explores = this.explores ?? new Map<string, LookmlExploreFile>();
        this.models = this.models ?? new Map<string, LookmlModelFile>();

        if (!project?.file) {
          return;
        }

        Object.values(project.file).forEach((file) => {
          switch(file.$file_type) {
            case "view": 
              const viewName = file.$file_name;
              
              const view = file.view[viewName];
            
              if (view) {
                this.views.set(viewName, view);
                const uri = URI.file(file.$file_path).toString();
                const viewNames = this.viewsByFile.get(uri) || [];
                viewNames.push(viewName);
                this.viewsByFile.set(uri, viewNames);
              }
              break;
            
            case "explore": 
              const exploreName = file.$file_name;
              const explore = file.explore[exploreName];
              if (explore) {
                this.explores.set(exploreName, explore);
                const uri = URI.file(file.$file_path).toString();
                const exploreNames = this.exploresByFile.get(uri) || [];
                exploreNames.push(exploreName);
                this.exploresByFile.set(uri, exploreNames);
              }
              break;
            
            case "model": 
              const modelName = file.$file_name;
              const model = file.model[modelName];

              if (model) {
                this.models.set(modelName, model);
                const uri = URI.file(file.$file_path).toString();
                const modelNames = this.modelsByFile.get(uri) || [];
                modelNames.push(modelName);
                this.modelsByFile.set(uri, modelNames);

                const includes = typeof model.include === 'string' ? [model.include] : model.include;
                for (const include of includes) {
                  console.log("resolve include",include);
                  this.resolveInclude(uri, include, modelName);
                }
              }
              break;
            
          }
        });
    }
    

    /**
     * Process a document and update the workspace model
     */
    public async updateDocument(document: TextDocument): Promise<void> {
      const { uri, version = 0 } = document;

      // Skip if we've already processed this version
      if (version && this.documentVersions.get(uri) === version) {
        return;
      }
      this.documentVersions.set(uri, version);

      // Remove existing data for this file
      this.clearDocumentData(uri);

      // Parse the document using our parser
      this.parseProject(parse(document.getText()));
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
        console.log("view", view);
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
        const cleanPattern = includePattern.replace(/^["']|["']$/g, "");

        // Get the base directory
        const baseDir = this.getWorkspaceFolder(baseUri);

        if (!baseDir) {
          console.log(`Could not determine base directory for ${baseUri}`);
          return;
        }

        console.log("getMatchedFiles");
        // Send a custom request to the client to find matching files
        const matchedFiles = await this.requestMatchingFilesFromClient(
          baseDir,
          cleanPattern
        );

        console.log("matchedFiles",matchedFiles);

        for (const filePath of matchedFiles) {
          console.log("filePath",filePath);
          console.log("this.loadedFiles",this.loadedFiles);
          // Skip already loaded files
          if (this.loadedFiles.has(filePath)) continue;

          try {
            // Request file content via LSP
            const documentUri = URI.file(filePath).toString();
            const file: {
              content: string;
              uri: string;
            } = await this.connection.sendRequest("lookml/getFileContent", {
              uri: documentUri,
            });

            const textDocument = TextDocument.create(
              file.uri,
              "lookml",
              0,
              file.content
            );

            // Update our model with the document
            if (textDocument) {
              await this.updateDocument(textDocument);
            } else {
              console.log(`No content returned for ${filePath}`);
            }

            const viewsFromThisFile =
              this.viewsByFile.get(URI.file(filePath).toString()) || [];

            // Add these views to the includedViews map for this model
            if (modelName) {
              let modelIncludes =
                this.includedViews.get(modelName) || new Set();
              viewsFromThisFile.forEach((view) => modelIncludes.add(view));
              this.includedViews.set(modelName, modelIncludes);
            }
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
    private async requestMatchingFilesFromClient(
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

        console.log("response",response);

        // The response should be an array of file paths
        if (Array.isArray(response)) {
          return response;
        } else {
          console.error(`Invalid response format from client:`, response);
          return [];
        }
      } catch (error) {
        console.error(`Error requesting matching files from client:`, error);
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
      const view = this.getView(tableName);

      if (!view || !view.measure || !view.dimension) {
        return null;
      }

      // Convert the Map to an array of field objects
      const measureFields = Object.entries(view.measure).map(([fieldName, field]) => ({
        name: fieldName,
        type: field.type,
      }));

      const dimensionFields = Object.entries(view.dimension).map(([fieldName, field]) => ({
        name: fieldName,
        type: field.type,
      }));

      const dimensionGroupFields = Object.entries(view.dimension_group).map(([fieldName, field]) => ({
        name: fieldName,
        type: field.type,
      }));

      return [...measureFields, ...dimensionFields, ...dimensionGroupFields];
    }
  }