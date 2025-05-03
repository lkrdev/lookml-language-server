import { TextDocument } from "vscode-languageserver-textdocument";
import {
  Diagnostic,
  DiagnosticSeverity,
  Range,
  Position,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../models/workspace";
import { ensureMinRangeLength } from '../utils/range';
import {
  DimensionPosition,
  LookmlDimension,
  LookmlExploreWithFileInfo,
  LookmlModelWithFileInfo,
  LookmlViewWithFileInfo,
  Position as LookmlPosition,
  MeasurePosition,
  LookmlMeasure,
  LookMlViewPositions,
  LookmlExplore
} from "lookml-parser";
import { z, ZodError } from 'zod';

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
    "time",
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

  private readonly dimensionGroupValidTypes = [
    ...this.sharedValidTypes,
    "time",
    "duration"
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
          start: { line: errorDetails.error.exception.location.start.line - 1, character: errorDetails.error.exception.location.start.column - 1 },
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
    const viewFileName = this.workspaceModel.getViewNameFromFile(document);

    let currentViewName: string | undefined = viewFileName;
    let currentContext: { type: string; name: string } | null = null;

    let contextStack: Array<{ type: string; name: string; level: number }> = [];

    const diagnostics: Diagnostic[] = [];
    const text = document.getText();
    const lines = text.split("\n");

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

      // Track context (same as first pass)
      const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/);
      if (blockMatch) {
        if (blockMatch[1] === "view") {
          currentViewName = blockMatch[2];
        }

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
        // Match any ${...} pattern
        const fieldRefPattern = /\$\{([^}]+)\}/g;
        let fieldMatch;

        while ((fieldMatch = fieldRefPattern.exec(sqlContent)) !== null) {
          const refStart = lines[i].indexOf(fieldMatch[0]);
          const range = {
            start: { line: i, character: refStart },
            end: { line: i, character: refStart + fieldMatch[0].length },
          };

          // Just verify the ${} syntax is present
          if (!fieldMatch[0].startsWith("${") || !fieldMatch[0].endsWith("}")) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: "Invalid field reference syntax. Use ${view_name.field_name} format",
              source: "lookml-lsp",
              code: DiagnosticCode.VIEW_REF_FIELD_IN_SQL
            });
          }
        }
      }
    }

    return diagnostics;
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


  // Base schemas for common properties
  private recursiveStringArray: z.ZodType<unknown> = z.lazy(() =>
    z.union([z.string(), z.array(this.recursiveStringArray)])
  );

  private baseProperties = z.object({
    $name: z.string(),
    $type: z.string(),
    $strings: this.recursiveStringArray,
    label: z.string().optional(),
    description: z.string().optional(),
    hidden: z.enum(['yes', 'no']).optional(),
    view_label: z.string().optional(),
    tags: z.array(z.string()).optional(),
    value_format_name: z.string().optional(),
  });

  // Dimension schema
  private dimensionSchema = this.baseProperties.extend({
    map_layer_name: z.string().optional(),
    primary_key: z.boolean().optional(),
    sql_end: z.string().optional(),
    sql_start: z.string().optional(),
    sql: z.string().optional(),
    type: z.enum(this.dimensionValidTypes as [string, ...string[]]),
    value_format: z.string().optional(),
    // ... other dimension properties
  }).strict();

  // Dimension group schema
  private dimensionGroupSchema = this.baseProperties.extend({
    convert_tz: z.boolean().optional(),
    datatype: z.enum(['date', 'datetime', 'unixtime']).optional(),
    sql_end: z.string().optional(),
    sql_start: z.string().optional(),
    sql: z.string(),

    timeframes: z.array(
      z.enum(['raw', 'time', 'date', 'week', 'month', 'quarter', 'year'])
    ),
    type: z.literal('time'),
  }).strict();

  // Measure schema
  private measureFiltersSchema = z.union([
    z.object({
      field: z.string(),
      value: z.string(),
    }),
    z.record(z.string(), z.string())
  ]);
  
  private measureSchema = this.baseProperties.extend({
    drill_fields: z.array(z.string()).optional(),
    sql: z.string().optional(),
    type: z.enum(this.measureValidTypes as [string, ...string[]]),
    value_format: z.string().optional(),
    filters: this.measureFiltersSchema.optional(),
  }).strict();

  // Set schema
  private setSchema = this.baseProperties.extend({
    fields: z.array(z.string())
  }).strict();

  private joinSchema = this.baseProperties.extend({
    type: z.enum(['left_outer', 'inner', 'full_outer', 'cross']).optional(),
    relationship: z.enum(['one_to_one', 'one_to_many', 'many_to_one', 'many_to_many']).optional(),
    sql_on: z.string().optional(),
    sql_where: z.string().optional(),
    sql_having: z.string().optional(),
    from: z.string().optional(),
    fields: z.array(z.string()).optional(),
    required_joins: z.array(z.string()).optional(),
    foreign_key: z.string().optional(),
    view_label: z.string().optional(),
    outer_only: z.boolean().optional(),
  }).strict();

  // Explore schema
  private exploreSchema = this.baseProperties.extend({
    view_name: z.string().optional(),
    from: z.string().optional(),
    extends: z.string().optional(),
    join: z.record(z.string(), this.joinSchema).optional(),
  }).strict();

  // Property block schemas
  private linkSchema = z.object({
    label: z.string(),
    icon_url: z.string().optional(),
    url: z.string(),
  }).strict();

  private suggestionsSchema = z.array(
    z.object({
      label: z.string(),
      value: z.string(),
    })
  );

  private validateSet({ viewDetails, sets }: {
    viewDetails: LookmlViewWithFileInfo,
    sets: { [key: string]: { fields: string[] } }
  }): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const positions = viewDetails.positions;

    Object.entries(sets).forEach(([setName, set]) => {
      try {
        this.setSchema.parse(set);

        for (const [index, field] of set.fields.entries()) {
          let fieldName = field;
          let targetedViewName: string | undefined = viewDetails.view.$name;
          let targetedViewDetails: LookmlViewWithFileInfo | undefined = viewDetails;

          const setFieldPosition = positions.set?.[setName]?.fields?.[index];
          if (!setFieldPosition) {
            throw new Error(`No position found for set field ${field}`);
          }

          if (field.includes(".")) {
            const fieldParts = field.split(".");
            targetedViewName = fieldParts[0];
            fieldName = fieldParts[1];
            targetedViewDetails = this.workspaceModel.getView(targetedViewName);
          }

          const fieldLength = fieldName.length;

          if (!targetedViewDetails) {
            const startCharacter = setFieldPosition.$p[1];
            const endCharacter = targetedViewName ? startCharacter + targetedViewName.length : setFieldPosition.$p[3];

            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              message: `View ${targetedViewName} not found`,
              range: {
                start: { line: setFieldPosition.$p[0] - 1, character: startCharacter },
                end: { line: setFieldPosition.$p[2] - 1, character: endCharacter }
              },
              source: "lookml-lsp",
              code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
            });
            continue;
          }
          const viewDimensions = targetedViewDetails.view.dimension;
          const viewMeasures = targetedViewDetails.view.measure;
          const viewDimensionGroups = targetedViewDetails.view.dimension_group;

          if (!viewDimensions?.[fieldName] && !viewMeasures?.[fieldName] && !viewDimensionGroups?.[fieldName]) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              message: `Field ${fieldName} not found in view ${targetedViewName}`,
              range: {
                start: { line: setFieldPosition.$p[0] - 1, character: setFieldPosition.$p[1] },
                end: { line: setFieldPosition.$p[2] - 1, character: setFieldPosition.$p[1] + fieldLength }
              },
              source: "lookml-lsp",
              code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
            });
            continue;
          }
        }
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const path = issue.path as string[];
            const setPositions = positions.set?.[setName] as DimensionPosition | undefined;

            let currentPosition: any = setPositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for set ${setName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              message: issue.message,
              range: {
                start: { line: startLine, character: startCharacter },
                end: { line: endLine, character: endCharacter }
              },
              source: "lookml-lsp",
              code: DiagnosticCode.PROP_INVALID_PROPERTY
            });
            return;
          }

          throw error;
        }
      }
    });

    return diagnostics;
  }

  private validateDimension(dimensions: { [key: string]: LookmlDimension }, positions: LookMlViewPositions): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];

    Object.values(dimensions).forEach((dimension) => {
      try {
        this.dimensionSchema.parse(dimension);
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const dimensionName = dimension.$name;
            const path = issue.path[0] as string;
            const fieldPositions = positions.dimension as Record<string, DimensionPosition> | undefined;
            const dimensionPositions = fieldPositions?.[dimensionName] as DimensionPosition | undefined;
            const position = dimensionPositions?.[path as keyof DimensionPosition] as LookmlPosition | undefined ?? dimensionPositions as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for dimension ${dimensionName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push(
              {
                severity: DiagnosticSeverity.Error,
                message: issue.message,
                range: {
                  start: { line: startLine, character: startCharacter },
                  end: { line: endLine, character: endCharacter }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_PROPERTY
              }
            );
            return
          }

          throw error;
        }
      }
    });

    return diagnostics;
  }

  private validateMeasure({ viewDetails, measures }: {
    viewDetails: LookmlViewWithFileInfo,
    measures: { [key: string]: LookmlMeasure },
  }): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const positions = viewDetails.positions;

    Object.values(measures).forEach((measure) => {
      try {
        this.measureSchema.parse(measure);

        if (measure.drill_fields) {
          for (const [index, drillField] of measure.drill_fields.entries()) {
            let fieldName = drillField;
            let targetedViewName: string | undefined = viewDetails.view.$name;
            let targetedViewDetails: LookmlViewWithFileInfo | undefined = viewDetails;

            const drillFieldPosition = positions.measure?.[measure.$name]?.drill_fields?.[index];
            if (!drillFieldPosition) {
              throw new Error(`No position found for drill field ${drillField}`);
            }

            if (drillField.includes("*")) {
              const fieldWithoutAsterisk = drillField.replace("*", "");

              if (!targetedViewDetails?.view?.set?.[fieldWithoutAsterisk]) {
                const startCharater = drillFieldPosition.$p[1];
                const endCharater = targetedViewName ? startCharater + fieldWithoutAsterisk.length : drillFieldPosition.$p[3];
                diagnostics.push({
                  severity: DiagnosticSeverity.Error,
                  range: {
                    start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                    end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
                  },
                  message: `Set "${fieldWithoutAsterisk}" not found in view "${targetedViewName}"`,
                  source: "lookml-lsp",
                  code: DiagnosticCode.DRILL_FIELDS_SET_NOT_FOUND
                });

              }
              continue;
            }

            if (drillField.includes(".")) {
              const drillFieldParts = drillField.split(".");
              targetedViewName = drillFieldParts[0];
              fieldName = drillFieldParts[1];
              targetedViewDetails = this.workspaceModel.getView(targetedViewName);
            }

            const fieldLength = fieldName.length;

            if (!targetedViewDetails) {
              const startCharater = drillFieldPosition.$p[1];
              const endCharater = targetedViewName ? startCharater + targetedViewName.length : drillFieldPosition.$p[3];

              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: `View ${targetedViewName} not found`,
                range: {
                  start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                  end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
              });
              continue;
            }

            const viewDimensions = targetedViewDetails.view.dimension;
            const viewMeasures = targetedViewDetails.view.measure;
            const viewDimensionGroups = targetedViewDetails.view.dimension_group;

            if (!viewDimensions?.[fieldName] && !viewMeasures?.[fieldName] && !viewDimensionGroups?.[fieldName]) {
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: `Field ${fieldName} not found in view ${viewDetails.view.$name}`,
                range: {
                  start: { line: drillFieldPosition.$p[0] - 1, character: drillFieldPosition.$p[1] },
                  end: { line: drillFieldPosition.$p[2] - 1, character: drillFieldPosition.$p[1] + fieldLength }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
              });
              continue;
            }
          }
        }
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const measureName = measure.$name;
            const path = issue.path as string[];
            const fieldPositions = positions.measure as Record<string, DimensionPosition> | undefined;
            const measurePositions = fieldPositions?.[measureName] as DimensionPosition | undefined;

            let currentPosition: any = measurePositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for measure ${measureName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push(
              {
                severity: DiagnosticSeverity.Error,
                message: issue.message,
                range: {
                  start: { line: startLine, character: startCharacter },
                  end: { line: endLine, character: endCharacter }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_PROPERTY
              }
            );
            return
          }

          throw error;
        }
      }
    });
    return diagnostics;
  }

  private validateDimensionGroup(dimensionGroups: { [key: string]: LookmlDimension }, positions: LookMlViewPositions): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];

    Object.values(dimensionGroups).forEach((dimensionGroup) => {
      try {
        this.dimensionGroupSchema.parse(dimensionGroup);
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const dimensionGroupName = dimensionGroup.$name;
            const path = issue.path as string[];
            const fieldPositions = positions.dimension_group as Record<string, DimensionPosition> | undefined;
            const dimensionGroupPositions = fieldPositions?.[dimensionGroupName] as DimensionPosition | undefined;

            let currentPosition: any = dimensionGroupPositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for dimension group ${dimensionGroupName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push(
              {
                severity: DiagnosticSeverity.Error,
                message: issue.message,
                range: {
                  start: { line: startLine, character: startCharacter },
                  end: { line: endLine, character: endCharacter }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_PROPERTY
              }
            );
            return
          }

          throw error;
        }
      }
    });

    return diagnostics;
  }

  private validateModel(modelDetails: LookmlModelWithFileInfo): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];

    Object.entries(modelDetails.model).forEach(([key, value]) => {
      switch (key) {
        case "explore":
          const positions = modelDetails.positions;

          const models: {
            [key: string]: LookmlExplore
          } = value;

          Object.values(models).forEach((explore) => {
            try {
              this.exploreSchema.parse(explore);
            } catch (error: ZodError | unknown) {
              if (error instanceof ZodError) {
                for (const issue of error.issues) {
                  const exploreName = explore.$name;
                  const path = issue.path as string[];
                  const fieldPositions = positions.explore as Record<string, DimensionPosition> | undefined;
                  const explorePositions = fieldPositions?.[exploreName] as DimensionPosition | undefined;

                  // Traverse the path to get the position
                  let currentPosition: any = explorePositions;
                  for (const pathPart of path) {
                    if (!currentPosition) break;
                    currentPosition = currentPosition[pathPart];
                  }
                  const position = currentPosition as LookmlPosition | undefined;

                  if (!position) {
                    throw new Error(`No position found for explore ${exploreName}`);
                  }

                  const startLine = position.$p[0] - 1;
                  const startCharacter = position.$p[1];
                  const endLine = position.$p[2] - 1;
                  const endCharacter = position.$p[3];

                  diagnostics.push(
                    {
                      severity: DiagnosticSeverity.Error,
                      message: issue.message,
                      range: {
                        start: { line: startLine, character: startCharacter },
                        end: { line: endLine, character: endCharacter }
                      },
                      source: "lookml-lsp",
                      code: DiagnosticCode.PROP_INVALID_PROPERTY
                    }
                  );
                  return
                }

                throw error;
              }
            }
          });
      }
    });

    return diagnostics;
  }

  // Then in the validation method:
  protected validateProperties(document: TextDocument): Diagnostic[] {
    let diagnostics: Diagnostic[] = [];

    // Parse the document into a structure
    const parsedStructure = this.getFileStructure(document);

    if (parsedStructure.views.length) {
      for (const viewDetails of parsedStructure.views) {
        const positions = viewDetails.positions;

        Object.entries(viewDetails.view).forEach(([key, value]) => {
          switch (key) {
            case "dimension":
              const dimensionDiagnostics = this.validateDimension(value, positions);
              diagnostics = [...diagnostics, ...dimensionDiagnostics];
              break;
            case "dimension_group":
              const dimensionGroupDiagnostics = this.validateDimensionGroup(value, positions);
              diagnostics = [...diagnostics, ...dimensionGroupDiagnostics];
              break;
            case "measure":
              const measureDiagnostics = this.validateMeasure({
                measures: value,
                viewDetails
              });
              diagnostics = [...diagnostics, ...measureDiagnostics];
              break;
            case "set":
              const setDiagnostics = this.validateSet({
                sets: value,
                viewDetails
              });
              diagnostics = [...diagnostics, ...setDiagnostics];
              break;
          }
        });
      }
    }

    if (parsedStructure.models.length) {
      for (const modelDetails of parsedStructure.models) {
        const modelDiagnostics = this.validateModel(modelDetails);
        diagnostics = [...diagnostics, ...modelDiagnostics];
      }
    }

    return diagnostics;
  }

  public getFileStructure(document: TextDocument): {
    views: LookmlViewWithFileInfo[];
    explores: LookmlExploreWithFileInfo[];
    models: LookmlModelWithFileInfo[];
  } {
    const uri = document.uri.replace("file://", "");
    const views = (this.workspaceModel.getViewsByFile(uri) || [])
      .map(viewName => this.workspaceModel.getView(viewName))
      .filter((v): v is LookmlViewWithFileInfo => v !== undefined);

    const explores = (this.workspaceModel.getExploresByFile(uri) || [])
      .map(exploreName => this.workspaceModel.getExplore(exploreName))
      .filter((e): e is LookmlExploreWithFileInfo => e !== undefined);

    const models = (this.workspaceModel.getModelsByFile(uri) || [])
      .map(modelName => this.workspaceModel.getModel(modelName))
      .filter((m): m is LookmlModelWithFileInfo => m !== undefined);

    return { views, explores, models };
  }
}
