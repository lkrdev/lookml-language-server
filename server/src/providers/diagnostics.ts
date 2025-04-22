import { TextDocument } from "vscode-languageserver-textdocument";
import {
  Diagnostic,
  DiagnosticSeverity,
  Position,
  Range,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../models/workspace";

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
        });
      }
    }

    // Check for missing colons in block declarations
    const blockRegex = /^\s*([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_]+)\s*\{/;
    const validBlockTypes = [
      "view",
      "explore",
      "model",
      "measure",
      "dimension",
      "parameter",
      "filter",
      "join",
      "derived_table",
      "datagroup",
      "access_grant",
    ];

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

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
        });
      }

      // Check for missing semicolons in SQL statements
      const sqlMatch = line.match(/^\s*sql:\s+(.+)$/);
      if (sqlMatch && !line.endsWith(";;")) {
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range: {
            start: { line: i, character: 0 },
            end: { line: i, character: line.length },
          },
          message: "SQL statement missing terminating semicolons (;;)",
          source: "lookml-lsp",
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
        const viewName = viewNameMatch[2];

        if (currentContext.type === "explore") {
          // Update the explore's base view
          const availableViews = exploreAvailableViews.get(currentContext.name);
          if (availableViews) {
            availableViews.delete(currentContext.name); // Remove the explore name
            availableViews.add(viewName); // Add the actual view name
          }
        } else if (currentContext.type === "join" && currentExplore) {
          // Add this join's real view name
          const availableViews = exploreAvailableViews.get(currentExplore);
          if (availableViews) {
            availableViews.add(viewName);
          }
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

        const indent = lines[i].length - lines[i].trimLeft().length;

        while (
          contextStack.length > 0 &&
          contextStack[contextStack.length - 1].level >= indent
        ) {
          contextStack.pop();
        }

        contextStack.push({ type: blockType, name: blockName, level: indent });
        currentContext = { type: blockType, name: blockName };

        if (blockType === "explore") {
          currentExplore = blockName;
        }

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
          const view = this.workspaceModel.getView(viewName);
          const viewIncluded = includedViews?.has(viewName) || false;

          if (!view) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Referenced view "${viewName}" not found in workspace`,
              source: "lookml-lsp",
            });
          } else if (!viewIncluded && modelName) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `View "${viewName}" exists but is not included in this model`,
              source: "lookml-lsp",
            });
          } else if (!view.fields.has(fieldName)) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Field "${fieldName}" not found in view "${viewName}"`,
              source: "lookml-lsp",
            });
          }
          // NEW CHECK: Verify the view is available in this explore context
          else if (availableViews && !availableViews.has(viewName)) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `View "${viewName}" is not available in this explore context. It must be joined before it can be referenced.`,
              source: "lookml-lsp",
            });
          }
        }
      }
    }

    return diagnostics;
  }

  private validateViewReferences(document: TextDocument): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const text = document.getText();
    const lines = text.split("\n");
    const viewName = this.workspaceModel.getViewNameFromFile(document);

    if (!viewName) {
      return diagnostics;
    }

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

          // Check if view exists in workspace and model
          const view = this.workspaceModel.getView(viewName);

          if (!view?.fields.has(fieldName)) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Field "${fieldName}" not found in view "${viewName}"`,
              source: "lookml-lsp",
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
  private validateProperties(document: TextDocument): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const text = document.getText();
    const lines = text.split("\n");

    // Track the current context stack for nested blocks
    const contextStack: { type: string; name: string }[] = [];

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line === "" || line.startsWith("#")) continue;

      // Track context starts
      const blockMatch = line.match(
        /^\s*([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/
      );
      if (blockMatch) {
        contextStack.push({ type: blockMatch[1], name: blockMatch[2] });
      }
      // Track context ends
      else if (line === "}" && contextStack.length > 0) {
        contextStack.pop();
      }
      // Validate properties
      else if (contextStack.length > 0) {
        const currentContext = contextStack[contextStack.length - 1];

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
                });
              }
            }
          }
        }

        // Check for invalid properties based on context
        const propertyMatch = line.match(/^\s*([a-zA-Z0-9_]+):/);
        if (propertyMatch) {
          const propertyName = propertyMatch[1];

          // Example: primary_key property is only valid in dimensions
          if (
            propertyName === "primary_key" &&
            currentContext.type !== "dimension"
          ) {
            diagnostics.push({
              severity: DiagnosticSeverity.Warning,
              range: this.getWordRange(lines[i], i, propertyName),
              message: `"primary_key" is only valid within dimension blocks`,
              source: "lookml-lsp",
            });
          }

          // Example: relationship property is only valid in joins
          if (
            propertyName === "relationship" &&
            currentContext.type !== "join"
          ) {
            diagnostics.push({
              severity: DiagnosticSeverity.Warning,
              range: this.getWordRange(lines[i], i, propertyName),
              message: `"relationship" is only valid within join blocks`,
              source: "lookml-lsp",
            });
          }
          // Validate hidden property uses yes/no instead of true/false
          if (propertyName === "hidden") {
            const valueMatch = line.match(/^\s*hidden:\s+(true|false)/i);
            if (valueMatch) {
              const invalidValue = valueMatch[1];
              const correctValue = invalidValue.toLowerCase() === "true" ? "yes" : "no";
              diagnostics.push({
                severity: DiagnosticSeverity.Warning,
                range: this.getWordRange(lines[i], i, invalidValue),
                message: `The "hidden" property should use "yes" or "no" instead of "${invalidValue}". Use "${correctValue}" instead.`,
                source: "lookml-lsp",
              });
            }
          }
        }
      }
    }

    return diagnostics;
  }

  /**
   * Helper method to get a range for a specific word in a line
   */
  private getWordRange(line: string, lineNumber: number, word: string): Range {
    const start = line.indexOf(word);
    if (start === -1) {
      // Fallback if we can't find the word
      return Range.create(
        Position.create(lineNumber, 0),
        Position.create(lineNumber, line.length)
      );
    }

    return Range.create(
      Position.create(lineNumber, start),
      Position.create(lineNumber, start + word.length)
    );
  }
}
