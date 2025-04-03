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
    ViewInfo,
    ExploreInfo,
    ModelInfo,
    FieldInfo,
  } from "./lookml-parser";

  export class WorkspaceModel {
    public connection: Connection;
    private lookmlParser: LookMLParser;

    // Document tracking
    private views: Map<string, ViewInfo> = new Map();
    private explores: Map<string, ExploreInfo> = new Map();
    private models: Map<string, ModelInfo> = new Map();
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
    public getViews(): Map<string, ViewInfo> {
      return this.views;
    }

    /**
     * Get a specific view by name
     */
    public getView(name: string): ViewInfo | undefined {
      return this.views.get(name);
    }

    /**
     * Get all explores in the workspace
     */
    public getExplores(): Map<string, ExploreInfo> {
      return this.explores;
    }

    /**
     * Get a specific explore by name
     */
    public getExplore(name: string): ExploreInfo | undefined {
      return this.explores.get(name);
    }

    /**
     * Get all models in the workspace
     */
    public getModels(): Map<string, ModelInfo> {
      return this.models;
    }

    /**
     * Get a specific model by name
     */
    public getModel(name: string): ModelInfo | undefined {
      return this.models.get(name);
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
      const parseResult = await this.lookmlParser.parseDocument(document);

      // Update our model with the parse results
      this.views = new Map([...this.views, ...parseResult.views]);
      this.explores = new Map([...this.explores, ...parseResult.explores]);
      this.models = new Map([...this.models, ...parseResult.models]);

      // Update file tracking
      this.viewsByFile.set(uri, parseResult.viewNames);
      this.exploresByFile.set(uri, parseResult.exploreNames);
      this.modelsByFile.set(uri, parseResult.modelNames);

      // Process includes for model files
      if (parseResult.isModelFile && parseResult.modelName) {
        const modelInfo = this.models.get(parseResult.modelName);
        if (modelInfo && modelInfo.includes.length > 0) {
          const modelName = parseResult.modelName;

          // Clear existing included views for this model
          this.includedViews.delete(modelName);

          // Process each include
          modelInfo.includes.forEach((include) =>
            this.resolveInclude(uri, include, modelName)
          );
        }
      }

      // Mark this file as loaded
      this.loadedFiles.add(uri);
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

        // Add the definition location
        references.push(view.location);

        // Find references in explores (viewName, from)
        for (const [_, explore] of this.explores.entries()) {
          if (explore.viewName === name) {
            // Add the view_name/from property location
            for (const [propName, prop] of explore.properties.entries()) {
              if (
                (propName === "view_name" || propName === "from") &&
                prop.value === name
              ) {
                references.push(prop.location);
              }
            }
          }

          // Check join references
          for (const [_, join] of explore.joins.entries()) {
            if (join.viewName === name) {
              // Add the view_name/from property location
              for (const [propName, prop] of join.properties.entries()) {
                if (
                  (propName === "view_name" || propName === "from") &&
                  prop.value === name
                ) {
                  references.push(prop.location);
                }
              }
            }
          }
        }

        // Find references in extends properties
        for (const [_, otherView] of this.views.entries()) {
          if (otherView.extends === name) {
            // Add the extends property location
            for (const [propName, prop] of otherView.properties.entries()) {
              if (propName === "extends" && prop.value === name) {
                references.push(prop.location);
              }
            }
          }
        }
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

        // Send a custom request to the client to find matching files
        const matchedFiles = await this.requestMatchingFilesFromClient(
          baseDir,
          cleanPattern
        );

        for (const filePath of matchedFiles) {
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

      if (!view || !view.fields) {
        return null;
      }

      // Convert the Map to an array of field objects
      const fields: { name: string; type: string }[] = [];

      view.fields.forEach((field, fieldName) => {
        // Get the field type from properties if available
        let fieldType = field.type;
        if (field.properties.has("type")) {
          fieldType = field.properties.get("type")!.value as FieldInfo["type"];
        }

        fields.push({
          name: fieldName,
          type: fieldType,
        });
      });

      return fields;
    }
  }