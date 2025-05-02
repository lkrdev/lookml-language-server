import { TextDocument } from "vscode-languageserver-textdocument";
import {
  Diagnostic,
  DiagnosticSeverity,
  Position,
  Range,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../models/workspace";
import { ensureMinRangeLength } from '../utils/range';

export enum DiagnosticCode {
  // Syntax validation (10000-19999)
  SYNTAX_UNBALANCED_CLOSING_BRACE = 10001,
  SYNTAX_UNCLOSED_BRACE = 10002,
  SYNTAX_INVALID_PROPERTY_NAME = 10003,
  SYNTAX_INVALID_INDENTATION = 10004,
  SYNTAX_MISSING_SQL_TERMINATOR = 10005,
  SYNTAX_MISSING_BLOCK_COLON = 10006,
  SYNTAX_INVALID_BLOCK_TYPE = 10007,

  // View Reference validation (20000-29999)
  VIEW_REF_FIELD_NOT_FOUND = 20001,
  VIEW_REF_VIEW_NOT_FOUND = 20002,
  VIEW_REF_VIEW_NOT_INCLUDED = 20003,
  VIEW_REF_FIELD_IN_SQL = 20004,

  // SQL Reference validation (30000-39999)
  SQL_REF_FIELD_NOT_FOUND = 30001,
  SQL_REF_VIEW_NOT_FOUND = 30002,
  SQL_REF_VIEW_NOT_INCLUDED = 30003,
  SQL_REF_VIEW_NOT_AVAILABLE = 30004,

  // Drill Fields validation (40000-49999)
  DRILL_FIELDS_INVALID_FORMAT = 40001,
  DRILL_FIELDS_MISSING_BRACKET = 40002,
  DRILL_FIELDS_MISSING_CLOSING = 40003,
  DRILL_FIELDS_EMPTY_FIELD = 40004,
  DRILL_FIELDS_VIEW_NOT_FOUND = 40005,
  DRILL_FIELDS_SET_NOT_FOUND = 40006,
  DRILL_FIELDS_FIELD_NOT_FOUND = 40007,

  // Property validation (50000-59999)
  PROP_INVALID_BLOCK_PARENT = 50001,
  PROP_INVALID_CHILD_BLOCK = 50002,
  PROP_INVALID_PROPERTY = 50003,
  PROP_INVALID_TYPE = 50004,
  PROP_INVALID_CONTEXT = 50005,
  PROP_INVALID_HIDDEN_VALUE = 50006,
  PROP_PRIMARY_KEY_INVALID_CONTEXT = 50007,
  PROP_RELATIONSHIP_INVALID_CONTEXT = 50008,

  // Join validation (60000-69999)
  JOIN_VIEW_NOT_FOUND = 60001,
  JOIN_FIELD_NOT_FOUND = 60002,
  JOIN_VIEW_NOT_INCLUDED = 60003,
  JOIN_INVALID_RELATIONSHIP = 60004,
  JOIN_VIEW_NOT_AVAILABLE = 60005,

  // Explore validation (70000-79999)
  EXPLORE_VIEW_NOT_FOUND = 70001,
  EXPLORE_FIELD_NOT_FOUND = 70002,
  EXPLORE_VIEW_NOT_INCLUDED = 70003,
  EXPLORE_INVALID_EXTENDS = 70004,
}

export class DiagnosticsProvider {
  private workspaceModel: WorkspaceModel;

  // Shared valid types between dimensions and measures
  private readonly sharedValidTypes = [
    "date",
    "number",
    "string",
    "yesno",
    "zipcode",
    "date_day_of_month",
    "date_day_of_week",
    "date_day_of_week_index",
    "date_day_of_year",
    "date_fiscal_month_num",
    "date_fiscal_quarter",
    "date_fiscal_quarter_of_year",
    "date_fiscal_year",
    "date_hour",
    "date_hour2",
    "date_hour3",
    "date_hour4",
    "date_hour6",
    "date_hour8",
    "date_hour12",
    "date_hour_of_day",
    "date_microsecond",
    "date_millisecond",
    "date_millisecond2",
    "date_millisecond4",
    "date_millisecond5",
    "date_millisecond8",
    "date_millisecond10",
    "date_millisecond20",
    "date_millisecond25",
    "date_millisecond40",
    "date_millisecond50",
    "date_millisecond100",
    "date_millisecond125",
    "date_millisecond200",
    "date_millisecond250",
    "date_millisecond500",
    "date_minute",
    "date_minute2",
    "date_minute3",
    "date_minute4",
    "date_minute5",
    "date_minute6",
    "date_minute10",
    "date_minute12",
    "date_minute15",
    "date_minute20",
    "date_minute30",
    "date_month",
    "date_month_name",
    "date_month_num",
    "date_quarter",
    "date_quarter_of_year",
    "date_raw",
    "date_second",
    "date_time",
    "date_time_of_day",
    "date_week",
    "date_week_of_year",
    "date_year"
  ];

  // Dimension-specific valid types (extends shared types)
  private readonly dimensionValidTypes = [
    ...this.sharedValidTypes,
    "bin",
    "distance",
    "location",
    "tier",
    "duration_day",
    "duration_hour",
    "duration_minute",
    "duration_month",
    "duration_quarter",
    "duration_second",
    "duration_week",
    "duration_year"
  ];

  // Measure-specific valid types (extends shared types)
  private readonly measureValidTypes = [
    ...this.sharedValidTypes,
    "average",
    "average_distinct",
    "count",
    "count_distinct",
    "int",
    "list",
    "max",
    "median",
    "median_distinct",
    "min",
    "percent_of_previous",
    "percent_of_total",
    "percentile",
    "percentile_distinct",
    "running_total",
    "sum",
    "sum_distinct",
    "date_date"
  ];

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

  /**
   * Validate a document and return diagnostics
   */
  public validateDocument(document: TextDocument): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const isView = this.workspaceModel.isViewFile(document);
    // Combine results from all validation checks
    diagnostics.push(...this.validateSyntax(document));
    isView ?
      diagnostics.push(...this.validateViewReferences(document)) :
      diagnostics.push(...this.validateReferences(document));
    diagnostics.push(...this.validateProperties(document));

    const fileName = document.uri.split("/").pop() ?? "";
    const errors = this.workspaceModel.getErrorsByFileName(fileName);
    
    for (const errorDetails of errors) {
      diagnostics.push({
        severity: DiagnosticSeverity.Error,
        message: errorDetails.error.exception.message,
        range: ensureMinRangeLength({
          start: { line: errorDetails.error.exception.location.start.line - 1 , character: errorDetails.error.exception.location.start.column - 1 },
          end: { line: errorDetails.error.exception.location.end.line - 1, character: errorDetails.error.exception.location.end.column - 1 },
        }),
      });
    }
    
    return diagnostics;
  }

  /**
   * Validate the basic syntax of the document (braces, colons, etc.)
   */
  private validateSyntax(document: TextDocument): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const text = document.getText();
    const lines = text.split("\n");

    // Check for unbalanced braces
    let openBraces = 0;
    let braceStack: { line: number; char: number }[] = [];

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i];

      for (let j = 0; j < line.length; j++) {
        if (line[j] === "{") {
          openBraces++;
          braceStack.push({ line: i, char: j });
        } else if (line[j] === "}") {
          openBraces--;

          if (openBraces < 0) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range: {
                start: { line: i, character: j },
                end: { line: i, character: j + 1 },
              },
              message: "Unbalanced closing brace",
              source: "lookml-lsp",
              code: DiagnosticCode.SYNTAX_UNBALANCED_CLOSING_BRACE
            });
            openBraces = 0;
            braceStack = [];
          } else {
            braceStack.pop();
          }
        }
      }
    }

    // Report unclosed braces
    if (openBraces > 0 && braceStack.length > 0) {
      // Report each unclosed brace
      for (const brace of braceStack) {
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range: {
            start: { line: brace.line, character: brace.char },
            end: { line: brace.line, character: brace.char + 1 },
          },
          message: "Unclosed brace",
          source: "lookml-lsp",
          code: DiagnosticCode.SYNTAX_UNCLOSED_BRACE
        });
      }
    }

    // Check for missing colons in block declarations
    const blockRegex = /^\s*([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_]+)\s*\{/;
    const validBlockTypes = [
      "access_grant",
      "datagroup",
      "derived_table",
      "dimension_group",
      "dimension",
      "explore",
      "filter",
      "join",
      "measure",
      "model",
      "parameter",
      "set",
      "view",
    ];

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

      // Check for invalid property declarations
      const propertyDeclMatch = line.match(/^\s*([^:]+):\s*([^{]*?)(?:;;|\s*$)/);
      if (propertyDeclMatch && !propertyDeclMatch[1].match(/^[a-zA-Z0-9_]+$/)) {
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range: {
            start: { line: i, character: lines[i].indexOf(propertyDeclMatch[1]) },
            end: { line: i, character: lines[i].indexOf(propertyDeclMatch[1]) + propertyDeclMatch[1].length },
          },
          message: `Invalid property name "${propertyDeclMatch[1]}". Property names must contain only letters, numbers, and underscores.`,
          source: "lookml-lsp",
          code: DiagnosticCode.SYNTAX_INVALID_PROPERTY_NAME
        });
      }

      // Check for incorrect indentation markers (dots, dashes, etc.)
      const incorrectIndentMatch = line.match(/^(\s*[.|-]+)([a-zA-Z0-9_]+)\s+/);
      if (incorrectIndentMatch) {
        const [_, indentMarker, propertyName] = incorrectIndentMatch;
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range: {
            start: { line: i, character: lines[i].indexOf(indentMarker) },
            end: { line: i, character: lines[i].indexOf(propertyName) + propertyName.length },
          },
          message: `Invalid indentation "${indentMarker.trim()}". Use spaces for indentation and a colon after the property name. Change to: "${propertyName}:"`,
          source: "lookml-lsp",
          code: DiagnosticCode.SYNTAX_INVALID_INDENTATION
        });
      }

      // Check for missing semicolons in SQL statements
      const sqlMatch = line.match(/^\s*sql:\s*(.*)$/);
      if (sqlMatch) {
        // Start scanning from the current line
        let foundTerminator = false;
        let j = i;
        while (j < lines.length) {
          const checkLine = lines[j].trim();
          if (checkLine === "" || checkLine.startsWith("#")) {
            j++;
            continue;
          }
          if (checkLine.endsWith(";;")) {
            foundTerminator = true;
            break;
          }
          // If we hit a new property or block end, stop
          if (/^[a-zA-Z0-9_]+:/.test(checkLine) && j !== i) break;
          if (checkLine === "}" && j !== i) break;
          j++;
        }
        if (!foundTerminator) {
          diagnostics.push({
            severity: DiagnosticSeverity.Error,
            range: {
              start: { line: i, character: 0 },
              end: { line: i, character: line.length },
            },
            message: "SQL statement missing terminating semicolons (;;)",
            source: "lookml-lsp",
            code: DiagnosticCode.SYNTAX_MISSING_SQL_TERMINATOR
          });
        }
      }

      // Check if a block declaration is missing a colon
      const incorrectBlockMatch = line.match(blockRegex);
      if (
        incorrectBlockMatch &&
        validBlockTypes.includes(incorrectBlockMatch[1])
      ) {
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range: {
            start: {
              line: i,
              character: lines[i].indexOf(incorrectBlockMatch[1]),
            },
            end: {
              line: i,
              character:
                lines[i].indexOf(incorrectBlockMatch[1]) +
                incorrectBlockMatch[1].length +
                incorrectBlockMatch[2].length +
                1,
            },
          },
          message: `Missing colon in block definition. Use "${incorrectBlockMatch[1]}: ${incorrectBlockMatch[2]}" instead`,
          source: "lookml-lsp",
          code: DiagnosticCode.SYNTAX_MISSING_BLOCK_COLON
        });
      }

      // Check for invalid block types
      const blockTypeMatch = line.match(/^\s*([a-zA-Z0-9_]+):\s*[a-zA-Z0-9_]+\s*\{/);
      if (blockTypeMatch && !validBlockTypes.includes(blockTypeMatch[1])) {
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range: {
            start: { line: i, character: lines[i].indexOf(blockTypeMatch[1]) },
            end: { line: i, character: lines[i].indexOf(blockTypeMatch[1]) + blockTypeMatch[1].length },
          },
          message: `Invalid block type "${blockTypeMatch[1]}". Valid block types are: ${validBlockTypes.join(", ")}.`,
          source: "lookml-lsp",
          code: DiagnosticCode.SYNTAX_INVALID_BLOCK_TYPE
        });
      }
    }

    return diagnostics;
  }

  /**
   * Validate references to views, fields, etc.
   */
  private validateReferences(document: TextDocument): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const text = document.getText();
    const lines = text.split("\n");
    // Get the model this document belongs to
    const modelName = this.workspaceModel.getModelNameFromUri(document.uri);

    // Get the set of views included by this model
    const includedViews = modelName
      ? this.workspaceModel.getIncludedViewsForModel(modelName)
      : new Set();

    // Track explores and their available views
    const exploreAvailableViews: Map<string, Set<string>> = new Map();

    // First pass: build context structure and available views
    let currentExplore: string | null = null;
    let currentContext: { type: string; name: string } | null = null;
    let indentLevel = 0;
    let contextStack: Array<{ type: string; name: string; level: number }> = [];

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

      // Track blocks and indentation
      const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/);
      if (blockMatch) {
        const blockType = blockMatch[1];
        const blockName = blockMatch[2];

        // Count leading spaces to determine indent level
        const indent = lines[i].length - lines[i].trimLeft().length;

        // Update context stack
        while (
          contextStack.length > 0 &&
          contextStack[contextStack.length - 1].level >= indent
        ) {
          contextStack.pop();
        }

        contextStack.push({ type: blockType, name: blockName, level: indent });
        currentContext = { type: blockType, name: blockName };

        // If this is an explore, initialize its available views
        if (blockType === "explore") {
          currentExplore = blockName;
          exploreAvailableViews.set(blockName, new Set([blockName])); // Start with the explore itself
        }
        // If this is a join within an explore, add it to available views
        else if (
          blockType === "join" &&
          contextStack.length >= 2 &&
          contextStack[contextStack.length - 2].type === "explore"
        ) {
          const exploreName = contextStack[contextStack.length - 2].name;
          const availableViews = exploreAvailableViews.get(exploreName);
          if (availableViews) {
            availableViews.add(blockName); // Add the join name to available views
          }
        }
      } else if (line === "}") {
        // Closing brace - pop from context stack if matching indent
        if (contextStack.length > 0) {
          const currentIndent = lines[i].length - lines[i].trimLeft().length;
          while (
            contextStack.length > 0 &&
            contextStack[contextStack.length - 1].level >= currentIndent
          ) {
            contextStack.pop();
          }

          currentContext =
            contextStack.length > 0
              ? {
                type: contextStack[contextStack.length - 1].type,
                name: contextStack[contextStack.length - 1].name,
              }
              : null;

          if (
            contextStack.length > 0 &&
            contextStack[contextStack.length - 1].type === "explore"
          ) {
            currentExplore = contextStack[contextStack.length - 1].name;
          } else {
            currentExplore = null;
          }
        }
      }

      // Add views specified by view_name or from
      const viewNameMatch = line.match(
        /^\s*(view_name|from):\s+([a-zA-Z0-9_]+)/
      );

      if (viewNameMatch && currentContext) {
        const propertyName = viewNameMatch[1];
        const viewName = viewNameMatch[2];
        const refStart = lines[i].indexOf(viewName);
        const range = {
          start: { line: i, character: refStart },
          end: { line: i, character: refStart + viewName.length },
        };

        // Check if view exists in workspace
        const viewDetails = this.workspaceModel.getView(viewName);
        const view = viewDetails?.view;
        if (!view) {
          diagnostics.push({
            severity: DiagnosticSeverity.Error,
            range,
            message: `Referenced view "${viewName}" not found in workspace`,
            source: "lookml-lsp",
            code: DiagnosticCode.VIEW_REF_VIEW_NOT_FOUND
          });
        } else if (!includedViews?.has(viewName) && modelName) {
          // Check if view is included in the model
          diagnostics.push({
            severity: DiagnosticSeverity.Error,
            range,
            message: `View "${viewName}" exists but is not included in this model`,
            source: "lookml-lsp",
            code: DiagnosticCode.VIEW_REF_VIEW_NOT_INCLUDED
          });
        }
      }
    }

    // Reset for second pass - actual validation
    currentContext = null;
    contextStack = [];
    currentExplore = null;

    // Second pass: check for reference errors
    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

      // Track context (same as first pass)
      const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/);
      if (blockMatch) {
        const blockType = blockMatch[1];
        const blockName = blockMatch[2];

        if (blockType === "explore") {
          currentExplore = blockName;
        }

        const indent = lines[i].length - lines[i].trimLeft().length;

        while (
          contextStack.length > 0 &&
          contextStack[contextStack.length - 1].level >= indent
        ) {
          contextStack.pop();
        }

        contextStack.push({ type: blockType, name: blockName, level: indent });
        currentContext = { type: blockType, name: blockName };

        // Your existing explore validation code...
      } else if (line === "}") {
        // Same closing brace handling as first pass
        if (contextStack.length > 0) {
          const currentIndent = lines[i].length - lines[i].trimLeft().length;
          while (
            contextStack.length > 0 &&
            contextStack[contextStack.length - 1].level >= currentIndent
          ) {
            contextStack.pop();
          }

          currentContext =
            contextStack.length > 0
              ? {
                type: contextStack[contextStack.length - 1].type,
                name: contextStack[contextStack.length - 1].name,
              }
              : null;

          if (
            contextStack.length > 0 &&
            contextStack[contextStack.length - 1].type === "explore"
          ) {
            currentExplore = contextStack[contextStack.length - 1].name;
          } else {
            currentExplore = null;
          }
        }
      }

      // Your existing extends, from, and view_name validation code...

      // Enhanced sql_on validation to check for explore context
      const sqlOnMatch = line.match(/^\s*sql_on:\s+(.+?)(?:;;|$)/);
      if (sqlOnMatch && currentContext?.type === "join" && currentExplore) {
        const sqlOnContent = sqlOnMatch[1];
        const fieldRefPattern = /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+)\}/g;
        let fieldMatch;

        // Get the set of available views for this explore
        const availableViews = exploreAvailableViews.get(currentExplore);

        while ((fieldMatch = fieldRefPattern.exec(sqlOnContent)) !== null) {
          const viewName = fieldMatch[1];
          const fieldName = fieldMatch[2];

          const refStart = lines[i].indexOf(fieldMatch[0]);
          const range = {
            start: { line: i, character: refStart },
            end: { line: i, character: refStart + fieldMatch[0].length },
          };

          // Check if view exists in workspace and model (your existing checks)
          const viewDetails = this.workspaceModel.getView(viewName);
          const view = viewDetails?.view;
          const viewIncluded = includedViews?.has(viewName) || false;

          if (!view) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Referenced view "${viewName}" not found in workspace`,
              source: "lookml-lsp",
              code: DiagnosticCode.SQL_REF_VIEW_NOT_FOUND
            });
          } else if (!viewIncluded && modelName) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `View "${viewName}" exists but is not included in this model`,
              source: "lookml-lsp",
              code: DiagnosticCode.SQL_REF_VIEW_NOT_INCLUDED
            });
          } else if (!view.measure?.[fieldName] && !view.dimension?.[fieldName] && !view.dimension_group?.[fieldName]) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Field "${fieldName}" not found in view "${viewName}"`,
              source: "lookml-lsp",
              code: DiagnosticCode.SQL_REF_FIELD_NOT_FOUND
            });
          }
          // NEW CHECK: Verify the view is available in this explore context
          else if (availableViews && !availableViews?.has(viewName)) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `View "${viewName}" is not available in this explore context. It must be joined before it can be referenced.`,
              source: "lookml-lsp",
              code: DiagnosticCode.SQL_REF_VIEW_NOT_AVAILABLE
            });
          }
        }
      }
    }

    return diagnostics;
  }

  private validateViewReferences(document: TextDocument): Diagnostic[] {
    const fileViewName = this.workspaceModel.getViewNameFromFile(document);

    if (!fileViewName) {
      return [];
    }

    const diagnostics: Diagnostic[] = [];
    const text = document.getText();
    const lines = text.split("\n");

    let currentContext: { type: string; name: string } | null = null;
    let contextStack: Array<{ type: string; name: string; level: number }> = [];


    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

      // Track context (same as first pass)
      const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/);
      if (blockMatch) {
        const blockType = blockMatch[1];
        const blockName = blockMatch[2];

        const indent = lines[i].length - lines[i].trimLeft().length;

        while (
          contextStack.length > 0 &&
          contextStack[contextStack.length - 1].level >= indent
        ) {
          contextStack.pop();
        }

        contextStack.push({ type: blockType, name: blockName, level: indent });
        currentContext = { type: blockType, name: blockName };

        // Your existing explore validation code...
      } else if (line === "}") {
        // Same closing brace handling as first pass
        if (contextStack.length > 0) {
          const currentIndent = lines[i].length - lines[i].trimLeft().length;
          while (
            contextStack.length > 0 &&
            contextStack[contextStack.length - 1].level >= currentIndent
          ) {
            contextStack.pop();
          }

          currentContext =
            contextStack.length > 0
              ? {
                type: contextStack[contextStack.length - 1].type,
                name: contextStack[contextStack.length - 1].name,
              }
              : null;
        }
      }
      // Add validation for SQL properties in dimensions and measures
      const dimensionOrMeasureSqlMatch = line.match(/^\s*sql:\s+(.+?)(?:;;|$)/);

      if (dimensionOrMeasureSqlMatch && ["dimension", "measure"].includes(currentContext?.type || "")) {
        const sqlContent = dimensionOrMeasureSqlMatch[1];
        // Match any ${...} pattern that contains a dot
        const fieldRefPattern = /\$\{([^}]+)\}/g;
        let fieldMatch;

        while ((fieldMatch = fieldRefPattern.exec(sqlContent)) !== null) {
          let viewName = fileViewName;
          let fieldName = fieldMatch[1];

          const refStart = lines[i].indexOf(fieldMatch[0]);
          const range = {
            start: { line: i, character: refStart },
            end: { line: i, character: refStart + fieldMatch[0].length },
          };

          if (fieldName === "TABLE") {
            fieldName = fieldMatch.input.split(".")[1].trim();
            range.start.character = range.start.character + 9;
            range.end.character = range.start.character + fieldName.length - 1;
          }

          if (fieldName.includes(".")) {
            const fieldNameSplit = fieldName.split(".");
            viewName = fieldNameSplit[0];
            fieldName = fieldNameSplit[1];
          }

          // Check if view exists in workspace and model
          const viewDetails = this.workspaceModel.getView(viewName);
          
          if (
              !viewDetails?.view?.dimension?.[fieldName] && 
              !viewDetails?.view?.measure?.[fieldName] && 
              !viewDetails?.view?.dimension_group?.[fieldName]
            ) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Field "${fieldName}" not found in view "${viewName}"`,
              source: "lookml-lsp",
              code: DiagnosticCode.VIEW_REF_FIELD_NOT_FOUND
            });
          } 
        }
      }
    }

    return diagnostics;
  }

  /**
   * Validate properties based on their context
   */
  protected validateProperties(document: TextDocument): Diagnostic[] {
    try {
      const viewName = this.workspaceModel.getViewNameFromFile(document);
      const fileViewDetails = viewName ? this.workspaceModel.getView(viewName) : null;
      
      const diagnostics: Diagnostic[] = [];
      const text = document.getText();
      const lines = text.split("\n");
      let contextStack: Array<{
        type: string;
        name: string;
        level: number;
        lineNumber: number;
        parent?: {
          type: string;
          name: string;
        }
      }> = [];

      // Define valid properties for different block types
      type LookmlBlockType = "explore" | "join" | "dimension" | "measure";

      const scalarProps: Record<LookmlBlockType, Set<string>> = {
        explore: new Set([
          "label", "description", "hidden", "from", "extends", "extension",
          "sql_always_where", "sql_always_having", "access_filter", "group_label", "tags"
        ]),
        join: new Set([
          "type", "relationship", "sql_on", "sql_where", "sql_having",
          "required_joins", "fields", "from", "view_name", "outer_only", "required_access_grants"
        ]),
        dimension: new Set([
          "type", "sql", "label", "group_label", "description", "hidden",
          "view_label", "primary_key", "suggestable", "suggestions", "suggest_persist_for",
          "tags", "required_fields", "drill_fields", "can_filter", "convert_tz", "datatype",
          "html", "link", "order_by_field", "sql_distinct_key", "value_format", "value_format_name",
          "bypass_suggest_restrictions", "full_suggestions", "alias", "map_layer_name"
        ]),
        measure: new Set([
          "type", "sql", "label", "group_label", "description", "hidden",
          "view_label", "filters", "drill_fields", "required_fields", "tags",
          "value_format", "value_format_name", "html", "approximate", "approximate_threshold",
          "can_filter", "convert_tz", "datatype", "direction", "link", "list_field",
          "percentile", "precision", "sql_distinct_key", "required_access_grants", "alias"
        ]),
      };

      const childBlocks: Record<LookmlBlockType, Set<string>> = {
        explore: new Set(["join", "set", "always_filter", "conditionally_filter"]),
        join: new Set([]),
        dimension: new Set([]),
        measure: new Set([]),
      };

      // Define valid parent blocks for each block type
      const validParentBlocks: Record<LookmlBlockType, Set<string>> = {
        explore: new Set(["model"]),  // explores must be in model files
        join: new Set(["explore"]),
        dimension: new Set(["view"]),
        measure: new Set(["view"])
      };

      for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        if (line === "" || line.startsWith("#")) continue;

        // Track context
        const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/);
        if (blockMatch) {
          const blockType = blockMatch[1] as LookmlBlockType;
          const blockName = blockMatch[2];
          const indent = lines[i].length - lines[i].trimLeft().length;

          while (
            contextStack.length > 0 &&
            contextStack[contextStack.length - 1].level >= indent
          ) {
            contextStack.pop();
          }

          const parent = contextStack.length > 0 ? { 
            type: contextStack[contextStack.length - 1].type, 
            name: contextStack[contextStack.length - 1].name 
          } : { type: "model", name: "" }; // If no parent, assume we're in a model file

          // Check if this block type is valid within its parent
          if (validParentBlocks[blockType]) {
            if (!validParentBlocks[blockType]?.has(parent.type)) {
              const validParents = Array.from(validParentBlocks[blockType]).join(", ");
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                range: this.getWordRange(lines[i], i, blockType),
                message: `"${blockType}" blocks can only be defined inside ${validParents} files.`,
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_BLOCK_PARENT
              });
            }
          }
          // Also check if parent allows this child
          else if (parent && childBlocks[parent.type as LookmlBlockType]) {
            if (!childBlocks[parent.type as LookmlBlockType]?.has(blockType)) {
              const validChildren = Array.from(childBlocks[parent.type as LookmlBlockType]).join(", ");
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                range: this.getWordRange(lines[i], i, blockType),
                message: `"${blockType}" blocks cannot be defined inside ${parent.type}s. Valid blocks include: ${validChildren}.`,
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_CHILD_BLOCK
              });
            }
          }

          contextStack.push({ 
            type: blockType, 
            name: blockName, 
            level: indent,
            lineNumber: i,
            parent 
          });
        } else if (line === "}") {
          if (contextStack.length > 0) {
            const currentIndent = lines[i].length - lines[i].trimLeft().length;
            while (
              contextStack.length > 0 &&
              contextStack[contextStack.length - 1].level >= currentIndent
            ) {
              contextStack.pop();
            }
          }
        }

        // Validate properties
        else if (contextStack.length > 0) {
          const currentContext = contextStack[contextStack.length - 1];
          const blockType = currentContext.type as LookmlBlockType;

          // Check for invalid properties in any block type that has defined scalar properties
          if (scalarProps[blockType]) {
            const propertyMatch = line.match(/^\s*([a-zA-Z0-9_]+):\s*(?:[^{]|$)/);
            if (propertyMatch) {
              const propertyName = propertyMatch[1];
              // Check if property is in the whitelist for this block type
              if (!scalarProps[blockType]?.has(propertyName) && !childBlocks[blockType]?.has(propertyName)) {
                diagnostics.push({
                  severity: DiagnosticSeverity.Error,
                  range: this.getWordRange(lines[i], i, propertyName),
                  message: `"${propertyName}" is not a valid property for ${blockType}s. Valid scalar properties include: ${Array.from(scalarProps[blockType]).join(", ")}. Valid block properties include: ${Array.from(childBlocks[blockType]).join(", ")}.`,
                  source: "lookml-lsp",
                  code: DiagnosticCode.PROP_INVALID_PROPERTY
                });
              }
            }
          }

          // Check for required properties
          if (
            currentContext.type === "dimension" ||
            currentContext.type === "measure"
          ) {
            // Dimensions and measures should have a type
            const typeMatch = line.match(/^\s*type:/);
            if (typeMatch) {
              const typeValueMatch = line.match(/^\s*type:\s+([a-zA-Z0-9_]+)/);
              if (typeValueMatch) {
                const typeValue = typeValueMatch[1];
                const validTypes = currentContext.type === "dimension"
                  ? this.dimensionValidTypes
                  : this.measureValidTypes;

                if (!validTypes.includes(typeValue)) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Warning,
                    range: this.getWordRange(lines[i], i, typeValue),
                    message: `"${typeValue}" is not a valid type for ${currentContext.type}s. Valid types include: ${validTypes.join(
                      ", "
                    )}`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.PROP_INVALID_TYPE
                  });
                }
              }
            }
          }

          // Check for invalid properties based on context
          const propertyMatch = line.match(/^\s*([a-zA-Z0-9_]+):/);
          if (propertyMatch) {
            const propertyName = propertyMatch[1];

            switch (propertyName) {
              case "drill_fields": {
                // First check if the line has proper array syntax
                const lineContent = lines[i].trim();
                const drillFieldsMatch = lineContent.match(/^\s*drill_fields:\s*(.+)$/);
                
                if (!drillFieldsMatch) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: i, character: line.indexOf("drill_fields:") },
                      end: { line: i, character: line.length },
                    },
                    message: 'drill_fields must be a list. Use format: drill_fields: [field1, field2] or multi-line array format',
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_INVALID_FORMAT
                  });
                  break;
                }

                const content = drillFieldsMatch[1].trim();
                
                // Check for single line format
                if (!content.startsWith('[')) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: i, character: line.indexOf("drill_fields:") },
                      end: { line: i, character: line.length },
                    },
                    message: 'drill_fields must start with [',
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_MISSING_BRACKET
                  });
                  break;
                }

                // Handle multi-line format
                if (!content.includes(']')) {
                  // Look ahead for closing bracket
                  let foundClosingBracket = false;
                  let currentLine = i + 1;
                  
                  while (currentLine < lines.length) {
                    const nextLine = lines[currentLine].trim();
                    if (nextLine === ']' || nextLine.endsWith(']')) {
                      foundClosingBracket = true;
                      break;
                    }
                    // Stop if we hit another property or block end
                    if (nextLine.match(/^[a-zA-Z0-9_]+:/) || nextLine === '}') {
                      break;
                    }
                    currentLine++;
                  }

                  if (!foundClosingBracket) {
                    diagnostics.push({
                      severity: DiagnosticSeverity.Error,
                      range: {
                        start: { line: i, character: line.indexOf("drill_fields:") },
                        end: { line: i, character: line.length },
                      },
                      message: 'drill_fields array must end with ]',
                      source: "lookml-lsp",
                      code: DiagnosticCode.DRILL_FIELDS_MISSING_CLOSING
                    });
                    break;
                  }
                }

                // For single line format, check for proper comma separation
                if (content.includes(']')) {
                  const fields = content.substring(1, content.indexOf(']')).split(',');
                  if (fields.length > 1) {
                    const hasEmptyFields = fields.some(field => field.trim() === '');
                    if (hasEmptyFields) {
                      diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range: {
                          start: { line: i, character: line.indexOf("drill_fields:") },
                          end: { line: i, character: line.length },
                        },
                        message: 'Fields in drill_fields must be separated by commas',
                        source: "lookml-lsp",
                        code: DiagnosticCode.DRILL_FIELDS_EMPTY_FIELD
                      });
                      break;
                    }
                  }
                }

                const parseResult = this.parseMultiLineProperty(lines, i, "drill_fields");
                
                if (parseResult.content.length === 0) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: i, character: line.indexOf("drill_fields:") },
                      end: { line: i, character: line.length },
                    },
                    message: 'drill_fields must be a list. Use format: drill_fields: [field1, field2] or multi-line array format',
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_INVALID_FORMAT
                  });
                } else {
                  for (let field of parseResult.content) {
                    let viewName = this.workspaceModel.getViewNameFromFile(document);
                    let originalField = field;

                    let targetViewDetails = fileViewDetails;
                    
                    if (field.includes(".")) {
                      const fieldSplit = field.split(".");
                      viewName = fieldSplit[0];
                      field = fieldSplit[1];
                      targetViewDetails = this.workspaceModel.getView(viewName);

                      if (!targetViewDetails) {
                        const fieldPosition = this.findFieldPosition(
                          lines,
                          parseResult.startLineNumber,
                          parseResult.endLineNumber,
                          originalField
                        );

                        if (fieldPosition) {
                          diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range: {
                              start: { line: fieldPosition.line, character: fieldPosition.character },
                              end: { line: fieldPosition.line, character: fieldPosition.character + originalField.length },
                            },
                            message: `Referenced view "${viewName}" not found in workspace "${viewName}"`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.SQL_REF_VIEW_NOT_FOUND
                          });
                        }
                      }
                    } 

                    if (field.includes("*")) {
                      const fieldWithoutAsterisk = field.replace("*", "");

                      if (!targetViewDetails?.view?.set?.[fieldWithoutAsterisk]) {
                        const fieldPosition = this.findFieldPosition(
                          lines,
                          parseResult.startLineNumber,
                          parseResult.endLineNumber,
                          originalField
                        );

                        if (fieldPosition) {
                          diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range: {
                              start: { line: fieldPosition.line, character: fieldPosition.character },
                              end: { line: fieldPosition.line, character: fieldPosition.character + originalField.length },
                            },
                            message: `Set "${fieldWithoutAsterisk}" not found in view "${viewName}"`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.DRILL_FIELDS_SET_NOT_FOUND
                          });
                        }
                      }
                      continue;
                    }

                    if (!targetViewDetails?.view?.dimension?.[field] && !targetViewDetails?.view?.measure?.[field] && !targetViewDetails?.view?.dimension_group?.[field]) {
                      const fieldPosition = this.findFieldPosition(
                        lines,
                        parseResult.startLineNumber,
                        parseResult.endLineNumber,
                        originalField
                      );

                      if (fieldPosition) {
                        diagnostics.push({
                          severity: DiagnosticSeverity.Error,
                          range: {
                            start: { line: fieldPosition.line, character: fieldPosition.character },
                            end: { line: fieldPosition.line, character: fieldPosition.character + originalField.length },
                          },
                          message: `Field "${originalField}" not found in view "${viewName}"`,
                          source: "lookml-lsp",
                          code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
                        });
                      }
                    }
                  }
                }
                break;
              }

              case "primary_key": {
                if (currentContext.type !== "dimension") {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Warning,
                    range: this.getWordRange(lines[i], i, propertyName),
                    message: `"primary_key" is only valid within dimension blocks`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.PROP_PRIMARY_KEY_INVALID_CONTEXT
                  });
                }
                break;
              }

              case "relationship": {
                if (currentContext.type !== "join") {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Warning,
                    range: this.getWordRange(lines[i], i, propertyName),
                    message: `"relationship" is only valid within join blocks`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.PROP_RELATIONSHIP_INVALID_CONTEXT
                  });
                }
                break;
              }

              case "hidden": {
                const valueMatch = line.match(/^\s*hidden:\s+(true|false)/i);
                if (valueMatch) {
                  const invalidValue = valueMatch[1];
                  const correctValue = invalidValue.toLowerCase() === "true" ? "yes" : "no";
                  diagnostics.push({
                    severity: DiagnosticSeverity.Warning,
                    range: this.getWordRange(lines[i], i, invalidValue),
                    message: `The "hidden" property should use "yes" or "no" instead of "${invalidValue}". Use "${correctValue}" instead.`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.PROP_INVALID_HIDDEN_VALUE
                  });
                }
                break;
              }
            }
          }
        }
      }

      return diagnostics;
    } catch (error) {
      console.error("ERROR in validateProperties", error);
      return [];
    }
  }

  /**
   * Helper method to get a range for a specific word in a line
   */
  private getWordRange(lines: string, lineNumber: number, word: string): Range {
    const start = lines.indexOf(word);
    if (start === -1) {
      // Fallback if we can't find the word
      return Range.create(
        Position.create(lineNumber, 0),
        Position.create(lineNumber, lines.length)
      );
    }

    return Range.create(
      Position.create(lineNumber, start),
      Position.create(lineNumber, start + word.length)
    );
  }

  /**
   * Utility function to parse multi-line property values that use array or block syntax
   * @param lines All lines of the document
   * @param startLine The line number where the property starts
   * @param propertyName The name of the property being parsed
   * @param openChar Opening character ('[' for arrays, '{' for blocks)
   * @param closeChar Closing character (']' for arrays, '}' for blocks)
   * @returns Object containing the parsed content and line information
   */
  private parseMultiLineProperty(
    lines: string[],
    startLine: number,
    propertyName: string,
    openChar: string = '[',
    closeChar: string = ']'
  ): {
    content: string[];
    startLineNumber: number;
    endLineNumber: number;
    isMultiLine: boolean;
  } {
    const firstLine = lines[startLine].trim();
    const propertyMatch = firstLine.match(new RegExp(`^\\s*${propertyName}:\\s*\\${openChar}(.*)$`));
    
    if (!propertyMatch) {
      return {
        content: [],
        startLineNumber: startLine,
        endLineNumber: startLine,
        isMultiLine: false
      };
    }

    let arrayContent = propertyMatch[1];
    let foundClosingChar = arrayContent.includes(closeChar);
    let currentLine = startLine;
    let content: string[] = [];

    // If it's a single line property
    if (foundClosingChar) {
      arrayContent = arrayContent.substring(0, arrayContent.indexOf(closeChar));
      content = arrayContent.split(",").map(f => f.trim()).filter(f => f);
      return {
        content,
        startLineNumber: startLine,
        endLineNumber: startLine,
        isMultiLine: false
      };
    }

    // Handle multi-line property
    while (currentLine < lines.length && !foundClosingChar) {
      if (currentLine > startLine) {
        const nextLine = lines[currentLine].trim();
        if (nextLine.includes(closeChar)) {
          arrayContent = nextLine.substring(0, nextLine.indexOf(closeChar));
          foundClosingChar = true;
        } else {
          arrayContent = nextLine;
        }
      }
      
      if (arrayContent) {
        const lineContent = arrayContent.split(",").map(f => f.trim()).filter(f => f);
        content.push(...lineContent);
      }
      
      currentLine++;
    }

    return {
      content,
      startLineNumber: startLine,
      endLineNumber: currentLine - 1,
      isMultiLine: true
    };
  }

  /**
   * Find the line and character position of a field in a range of lines
   */
  private findFieldPosition(
    lines: string[],
    startLine: number,
    endLine: number,
    field: string
  ): { line: number; character: number } | null {
    for (let searchLine = startLine; searchLine <= endLine; searchLine++) {
      const lineContent = lines[searchLine];
      const fieldPos = lineContent.indexOf(field);
      if (fieldPos !== -1) {
        return { line: searchLine, character: fieldPos };
      }
    }
    return null;
  }
}
