import { Location, Position } from "vscode-languageserver/node";
import { TextDocument } from "vscode-languageserver-textdocument";
import { LookmlProject } from "lookml-parser";
export interface ViewInfo {
    name: string;
    location: Location;
    fields: Map<string, FieldInfo>;
    extends?: string;
    properties: Map<string, PropertyInfo>;
}
export interface FieldInfo {
    name: string;
    type: "dimension" | "measure" | "parameter" | "filter";
    location: Location;
    properties: Map<string, PropertyInfo>;
}
export interface PropertyInfo {
    name: string;
    value: string;
    location: Location;
}
export interface ExploreInfo {
    name: string;
    location: Location;
    viewName?: string;
    joins: Map<string, JoinInfo>;
    properties: Map<string, PropertyInfo>;
}
export interface JoinInfo {
    name: string;
    location: Location;
    viewName?: string;
    sqlOn?: string;
    relationship?: string;
    properties: Map<string, PropertyInfo>;
}
export interface ModelInfo {
    name: string;
    location: Location;
    connection?: string;
    includes: string[];
    explores: string[];
    properties: Map<string, PropertyInfo>;
}
export interface ParseResult {
    views: Map<string, ViewInfo>;
    explores: Map<string, ExploreInfo>;
    models: Map<string, ModelInfo>;
    viewNames: string[];
    exploreNames: string[];
    modelNames: string[];
    isModelFile: boolean;
    modelName?: string;
}
export declare class LookMLParser {
    private lookmlProject;
    private tempFilesDir;
    constructor();
    /**
     * Initialize temp directory for lookml-parser file operations
     */
    private initTempDir;
    /**
     * Get the lookml-parser Project object
     */
    getLookMLProject(): LookmlProject | null;
    /**
     * Perform custom parsing to extract locations and basic structure
     */
    private customParseDocument;
    /**
     * Enhance the parse result with lookml-parser information
     */
    private enhanceWithLookMLParser;
    /**
     * Generate diagnostics for a document using lookml-parser
     */
    getDiagnostics(document: TextDocument): any[];
    /**
     * Get completions for a position using lookml-parser knowledge
     */
    getCompletions(document: TextDocument, position: Position): any[];
    /**
     * Get hover info for a position using lookml-parser knowledge
     */
    getHoverInfo(document: TextDocument, position: Position): any | null;
    /**
     * Clean up temporary files
     */
    cleanup(): Promise<void>;
}
