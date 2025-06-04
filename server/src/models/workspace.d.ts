import { Connection, Diagnostic, DocumentUri, Location, Position } from "vscode-languageserver/node";
import { TextDocument } from "vscode-languageserver-textdocument";
import { LookmlProject, LookmlViewWithFileInfo, LookmlExploreWithFileInfo, LookmlModelWithFileInfo, LookmlError } from "lookml-parser";
export declare class WorkspaceModel {
    connection: Connection;
    private lookmlParser;
    project?: LookmlProject;
    private errors;
    private views;
    private explores;
    private models;
    private viewsByFile;
    private includedViews;
    private exploresByFile;
    private modelsByFile;
    private loadedFiles;
    private documentVersions;
    constructor(args: {
        connection: Connection;
    });
    getView(name: string): LookmlViewWithFileInfo | undefined;
    getViews(): Map<string, LookmlViewWithFileInfo>;
    getViewsByFile(uri: string): string[];
    getErrorsByFileName(fileName: string): LookmlError[];
    getExplore(name: string): LookmlExploreWithFileInfo | undefined;
    getExplores(): Map<string, LookmlExploreWithFileInfo>;
    getExploresByFile(uri: string): string[];
    getModels(): Map<string, LookmlModelWithFileInfo>;
    getModelsByFile(uri: string): string[];
    /**
     * Get a specific model by name
     */
    getModel(name: string): LookmlModelWithFileInfo | undefined;
    isViewFile(document: TextDocument): boolean;
    isModelFile(document: TextDocument): boolean;
    getViewNameFromFile(document: TextDocument): string | undefined;
    /**
     * Initialize the workspace by finding and loading the model file
     */
    initialize(): Promise<void>;
    parseDocument(document: TextDocument): Promise<void>;
    parseFiles({ source, reset, }: {
        source?: string;
        reset?: boolean;
    }): Promise<void>;
    processProject(project: LookmlProject): Promise<void>;
    /**
     * Process a document and update the workspace model
     */
    updateDocument(document: TextDocument): Promise<void>;
    /**
     * Remove data for a document that's been closed/deleted
     */
    removeDocument(uri: DocumentUri): void;
    /**
     * Clear all data associated with a document
     */
    private clearDocumentData;
    /**
     * Get diagnostics for a document
     */
    getDiagnostics(document: TextDocument): Diagnostic[];
    /**
     * Find all references to a symbol in the workspace
     */
    findReferences(name: string): Location[];
    /**
     * Get the workspace folder containing a given document
     */
    getWorkspaceFolder(documentUri: string): string | null;
    /**
     * Get model name from URI
     */
    getModelNameFromUri(uri: string): string | null;
    /**
     * Get included views for a model
     */
    getIncludedViewsForModel(modelName: string): Set<string> | undefined;
    /**
     * Resolve include patterns to actual files
     */
    private resolveInclude;
    /**
     * Request matching files from client
     */
    getMatchingFiles(baseDir: string, pattern: string): Promise<string[]>;
    /**
     * Use lookml-parser to get completions
     */
    getCompletions(document: TextDocument, position: Position): any[];
    /**
     * Use lookml-parser to get hover information
     */
    getHoverInfo(document: TextDocument, position: Position): any | null;
    /**
     * Clean up resources when shutting down
     */
    cleanup(): Promise<void>;
    /**
     * Get fields for a specific table/view
     * Used for providing field completions in SQL contexts
     */
    getTableFields(tableName: string): {
        name: string;
        type: string;
    }[] | null;
}
