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
          });
        } else if (!includedViews?.has(viewName) && modelName) {
          // Check if view is included in the model
          diagnostics.push({
            severity: DiagnosticSeverity.Error,
            range,
            message: `View "${viewName}" exists but is not included in this model`,
            source: "lookml-lsp",
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
            });
          } else if (!viewIncluded && modelName) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `View "${viewName}" exists but is not included in this model`,
              source: "lookml-lsp",
            });
          } else if (!view.measure?.[fieldName] && !view.dimension?.[fieldName] && !view.dimension_group?.[fieldName]) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range,
              message: `Field "${fieldName}" not found in view "${viewName}"`,
              source: "lookml-lsp",
            });
          }
          // NEW CHECK: Verify the view is available in this explore context
          else if (availableViews && !availableViews?.has(viewName)) {
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
          const view = this.workspaceModel.getView(viewName);
          
          if (
              !view?.view?.dimension?.[fieldName] && 
              !view?.view?.measure?.[fieldName] && 
              !view?.view?.dimension_group?.[fieldName]
            ) {
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
    try {
      const viewName = this.workspaceModel.getViewNameFromFile(document);
      const viewDetails = viewName ? this.workspaceModel.getView(viewName) : null;
      console.log("validateProperties viewDetails", viewDetails);
      
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
                // Check for correct list syntax and validate field references
                const drillFieldsMatch = line.match(/^\s*drill_fields:\s*\[(.*)\]/);
                if (!drillFieldsMatch) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: i, character: line.indexOf("drill_fields:") },
                      end: { line: i, character: line.length },
                    },
                    message: 'drill_fields must be a list. Use format: drill_fields: [field1, field2]',
                    source: "lookml-lsp",
                  });
                } else {
                  const fields = drillFieldsMatch[1].split(",").map(f => f.trim()).filter(f => f);
                  
                  // Get the position of the opening bracket
                  const openBracketPos = line.indexOf("[");
                  let currentPos = openBracketPos + 1;
                  
                  for (let field of fields) {
                    let viewName = this.workspaceModel.getViewNameFromFile(document);
                    let originalField = field;
                    
                    if (field.includes(".")) {
                      const fieldSplit = field.split(".");
                      viewName = fieldSplit[0];
                      field = fieldSplit[1];
                    } 

                    if (field.includes("*") && viewDetails?.view?.set) {
                      const fieldWithoutAsterisk = field.replace("*", "");

                      if (!viewDetails?.view?.set?.[fieldWithoutAsterisk]) {
                        const fieldPos = line.indexOf(originalField, currentPos);

                        diagnostics.push({
                          severity: DiagnosticSeverity.Error,
                          range: {
                            start: { line: i, character: fieldPos },
                            end: { line: i, character: fieldPos + originalField.length },
                          },
                          message: `Set "${fieldWithoutAsterisk}" not found in view "${viewName}"`,
                          source: "lookml-lsp",
                        });
                      }

                      continue;
                    }

                    if (!viewDetails?.view?.dimension?.[field] && !viewDetails?.view?.measure?.[field] && !viewDetails?.view?.dimension_group?.[field]) {
                      // Find the exact position of this field in the list
                      const fieldPos = line.indexOf(originalField, currentPos);
                      diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range: {
                          start: { line: i, character: fieldPos },
                          end: { line: i, character: fieldPos + originalField.length },
                        },
                        message: `Field "${originalField}" not found in view "${viewName}"`,
                        source: "lookml-lsp",
                      });
                    }
                    // Move current position past this field and its comma
                    currentPos = line.indexOf(originalField, currentPos) + originalField.length + 1;
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
