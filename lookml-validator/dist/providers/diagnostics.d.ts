import { LookmlExploreWithFileInfo, LookmlModelWithFileInfo, LookmlViewWithFileInfo } from "lookml-parser";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver-types";
import { WorkspaceModel } from "../models/workspace";
export declare enum DiagnosticCode {
    SYNTAX_UNBALANCED_CLOSING_BRACE = 10001,
    SYNTAX_UNCLOSED_BRACE = 10002,
    SYNTAX_INVALID_PROPERTY_NAME = 10003,
    SYNTAX_INVALID_INDENTATION = 10004,
    SYNTAX_MISSING_SQL_TERMINATOR = 10005,
    SYNTAX_MISSING_BLOCK_COLON = 10006,
    SYNTAX_INVALID_BLOCK_TYPE = 10007,
    VIEW_REF_FIELD_NOT_FOUND = 20001,
    VIEW_REF_VIEW_NOT_FOUND = 20002,
    VIEW_REF_VIEW_NOT_INCLUDED = 20003,
    VIEW_REF_FIELD_IN_SQL = 20004,
    SQL_REF_FIELD_NOT_FOUND = 30001,
    SQL_REF_VIEW_NOT_FOUND = 30002,
    SQL_REF_VIEW_NOT_INCLUDED = 30003,
    SQL_REF_VIEW_NOT_AVAILABLE = 30004,
    DRILL_FIELDS_INVALID_FORMAT = 40001,
    DRILL_FIELDS_MISSING_BRACKET = 40002,
    DRILL_FIELDS_MISSING_CLOSING = 40003,
    DRILL_FIELDS_EMPTY_FIELD = 40004,
    DRILL_FIELDS_VIEW_NOT_FOUND = 40005,
    DRILL_FIELDS_SET_NOT_FOUND = 40006,
    DRILL_FIELDS_FIELD_NOT_FOUND = 40007,
    PROP_INVALID_BLOCK_PARENT = 50001,
    PROP_INVALID_CHILD_BLOCK = 50002,
    PROP_INVALID_PROPERTY = 50003,
    PROP_INVALID_TYPE = 50004,
    PROP_INVALID_CONTEXT = 50005,
    PROP_INVALID_HIDDEN_VALUE = 50006,
    PROP_PRIMARY_KEY_INVALID_CONTEXT = 50007,
    PROP_RELATIONSHIP_INVALID_CONTEXT = 50008,
    JOIN_VIEW_NOT_FOUND = 60001,
    JOIN_FIELD_NOT_FOUND = 60002,
    JOIN_VIEW_NOT_INCLUDED = 60003,
    JOIN_INVALID_RELATIONSHIP = 60004,
    JOIN_VIEW_NOT_AVAILABLE = 60005,
    EXPLORE_VIEW_NOT_FOUND = 70001,
    EXPLORE_FIELD_NOT_FOUND = 70002,
    EXPLORE_VIEW_NOT_INCLUDED = 70003,
    EXPLORE_INVALID_EXTENDS = 70004
}
export declare class DiagnosticsProvider {
    private workspaceModel;
    constructor(workspaceModel: WorkspaceModel);
    /**
     * Validate a document and return diagnostics
     */
    validateDocument(document: TextDocument): Diagnostic[];
    private validateSqlReferences;
    private validateViewReferences;
    private validateDrillFields;
    protected validateProperties(document: TextDocument): Diagnostic[];
    getFileStructure(document: TextDocument): {
        views: LookmlViewWithFileInfo[];
        explores: LookmlExploreWithFileInfo[];
        models: LookmlModelWithFileInfo[];
    };
    private validateModel;
    private validateModelReferences;
    private getRangeFromPositions;
}
