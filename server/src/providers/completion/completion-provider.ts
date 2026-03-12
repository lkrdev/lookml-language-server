import { TextDocument } from "vscode-languageserver-textdocument";
import {
  CompletionItem,
  CompletionItemKind,
  CompletionList,
  TextDocumentPositionParams,
} from "vscode-languageserver/node";
import * as z from "zod";
import { DashboardParser } from "../../models/dashboard-parser";
import { WorkspaceModel } from "../../models/workspace";
import { splitIntoLines } from "../../utils/document";
import { BlockCompletionProvider } from "./block-completions";
import { ContextDetector, LineContextDetector } from "./context-detector";
import { DocumentationProvider } from "./documentation-provider";
import { PropertyCompletionProvider } from "./property-completions";
import { getAllSnippets } from "./snippets";
import { SQLCompletionProvider } from "./sql-completions";

import {
  LookMLView,
  dimensionGroupSchema,
  dimensionSchema,
  exploreSchema,
  filterSchema,
  joinSchema,
  measureSchema,
  parameterSchema,
  setSchema,
} from "../../schemas/lookml";

export class CompletionProvider {
  private workspaceModel: WorkspaceModel;
  private contextDetector: ContextDetector;
  private lineContextDetector: LineContextDetector;
  private blockCompletions: BlockCompletionProvider;
  private propertyCompletions: PropertyCompletionProvider;
  private sqlCompletions: SQLCompletionProvider;
  private documentationProvider: DocumentationProvider;

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
    this.contextDetector = new ContextDetector(workspaceModel);
    this.lineContextDetector = new LineContextDetector();
    this.blockCompletions = new BlockCompletionProvider(workspaceModel);
    this.propertyCompletions = new PropertyCompletionProvider(workspaceModel);
    this.sqlCompletions = new SQLCompletionProvider(workspaceModel);
    this.documentationProvider = new DocumentationProvider(workspaceModel);
  }

  public isInJoinBlock(
    text: string,
    position: TextDocumentPositionParams,
  ): boolean {
    const lines = splitIntoLines(text);
    let depth = 0;
    for (let i = position.position.line; i >= 0; i--) {
      const line = lines[i].trim();

      if (line.endsWith("}")) depth++;
      if (line.endsWith("{")) depth--;

      if (line.startsWith("join:") && depth <= 0) return true;
      if (line.startsWith("explore:") && depth <= 0) break;
    }
    return false;
  }

  /**
   * Provide completion items for a given position in a document
   */
  public getCompletionItems(
    document: TextDocument,
    position: TextDocumentPositionParams,
  ): CompletionItem[] | CompletionList {
    try {
      // Dashboard files get their own completion logic
      if (DashboardParser.isDashboardFile(document.uri)) {
        return this.getDashboardCompletions(document, position);
      }

      // Detect context at current position
      const context = this.contextDetector.getContext(document, position);
      const lineContext = this.lineContextDetector.getLineContext(
        document,
        position,
      );

      let items: CompletionItem[] = [];

      // If we're completing a property, use the path to determine available properties
      if (lineContext.isPropertyCompletion) {
        // Get the schema based on the path
        const schema = this.getSchemaForPath(
          lineContext.path.map((p) => p.type),
        );
        if (schema) {
          // Get all property names from the schema, excluding internal parser fields
          const properties = Object.keys(schema._def.shape()).filter(
            (prop) => !prop.startsWith("$"),
          ); // Filter out internal fields like $name, $type, etc.

          // Get the current block's defined properties by traversing the path
          let definedProperties: string[] = [];

          /*
          ignore this for now until we know what properties can be repeated or not
          if (lineContext.path[0]?.type === 'view') {
            const viewName = lineContext.path[0].name;
            const viewInfo = this.workspaceModel.getView(viewName);
            if (viewInfo) {
              // Start with view properties
              definedProperties = Object.keys(viewInfo.view);
              
              // If we're in a field (dimension, measure, etc.), get its properties
              if (lineContext.path.length > 1) {
                const fieldType = lineContext.path[1].type;
                const fieldName = lineContext.path[1].name;
                let field: any;
                
                // Get the field based on its type
                switch (fieldType) {
                  case 'dimension':
                    field = viewInfo.view.dimension?.[fieldName];
                    break;
                  case 'measure':
                    field = viewInfo.view.measure?.[fieldName];
                    break;
                  case 'dimension_group':
                    field = viewInfo.view.dimension_group?.[fieldName];
                    break;
                }
                
                if (field) {
                  definedProperties = Object.keys(field);
                }
              }
            }
          }*/

          // Filter out properties that are already defined
          const availableProperties = properties.filter(
            (prop) => !definedProperties.includes(prop),
          );

          items = availableProperties.map((prop) => ({
            label: prop,
            kind: CompletionItemKind.Property,
            insertText: `${prop}: `,
            data: {
              type: "property",
              path: lineContext.path.map((p) => p.type),
            },
          }));
        }
      } else {
        // Get completions based on context
        switch (context.type) {
          case "block":
            items = this.blockCompletions.getCompletions(context);
            break;

          case "property":
          case "type":
          case "value":
            items = this.propertyCompletions.getCompletions(context);
            break;

          case "sql":
          case "sql_on":
            items = this.sqlCompletions.getCompletions(context);
            break;

          case "table_reference":
            items = this.sqlCompletions.getTableReferenceCompletions(context);
            break;

          case "dimension_reference":
            items =
              this.sqlCompletions.getDimensionReferenceCompletions(context);
            break;

          case "field_reference":
            items = this.sqlCompletions.getFieldReferenceCompletions(context);
            break;

          default:
            items = getAllSnippets();
            break;
        }
      }

      if (
        this.isInJoinBlock(document.getText(), position) &&
        context.linePrefix?.trim() === ""
      ) {
        items.push(
          ...[
            { label: "type", kind: CompletionItemKind.Property },
            { label: "sql_on", kind: CompletionItemKind.Property },
            { label: "relationship", kind: CompletionItemKind.Property },
          ],
        );
      }

      return {
        isIncomplete: false,
        items,
      };
    } catch (error) {
      console.error("Error providing completions:", error);
      return [];
    }
  }

  /**
   * Get the appropriate Zod schema based on the current path
   */
  private getSchemaForPath(path: string[]): z.ZodObject<any> | undefined {
    if (path.length === 0) return undefined;

    // Map path to schema
    const schemaMap: {
      [key: string]: z.ZodObject<any> | z.ZodEffects<z.ZodObject<any>>;
    } = {
      dimension_group: dimensionGroupSchema,
      dimension: dimensionSchema,
      explore: exploreSchema,
      filter: filterSchema,
      join: joinSchema,
      measure: measureSchema,
      parameter: parameterSchema,
      set: setSchema,
      view: LookMLView,
    };

    // Get the last block type in the path
    const lastBlockType = path[path.length - 1];
    const schema = schemaMap[lastBlockType];

    // Handle both ZodObject and ZodEffects
    if (schema instanceof z.ZodEffects) {
      return schema.innerType() as z.ZodObject<any>;
    }
    return schema as z.ZodObject<any>;
  }

  /**
   * Resolve additional information for a completion item
   */
  public resolveCompletionItem(item: CompletionItem): CompletionItem {
    return this.documentationProvider.enhanceCompletionItem(item);
  }

  /**
   * Check if we're at a word boundary (for snippets)
   */
  private isAtWordBoundary(text: string): boolean {
    return text.match(/\b\w+$/) !== null;
  }

  /**
   * Provide completions for dashboard files.
   * After `view_name.`, suggest fields from that view.
   * On field-reference lines, suggest `view_name.field_name`.
   */
  private getDashboardCompletions(
    document: TextDocument,
    position: TextDocumentPositionParams,
  ): CompletionList {
    const lines = splitIntoLines(document.getText());
    const line = lines[position.position.line] ?? "";
    const textBefore = line.substring(0, position.position.character);
    const items: CompletionItem[] = [];

    // After a dot: suggest fields for the view before the dot
    const dotMatch = textBefore.match(/\b([a-zA-Z_][a-zA-Z0-9_]*)\.([a-zA-Z_]?[a-zA-Z0-9_]*)$/);
    if (dotMatch) {
      const viewName = dotMatch[1];
      const partial = dotMatch[2];
      const viewDetails = this.workspaceModel.getView(viewName);
      if (viewDetails) {
        const fields = this.workspaceModel.getViewFields(viewDetails.view.$name!);
        const fieldTypes = [
          { type: "dimension", map: fields.dimension, kind: CompletionItemKind.Field },
          { type: "measure", map: fields.measure, kind: CompletionItemKind.Value },
          { type: "dimension_group", map: fields.dimension_group, kind: CompletionItemKind.Field },
        ];
        for (const { type, map, kind } of fieldTypes) {
          for (const [name, field] of Object.entries(map || {})) {
            if (partial && !name.startsWith(partial)) continue;
            items.push({
              label: name,
              kind,
              detail: `${type} in ${viewName}`,
              documentation: (field as any)?.description || (field as any)?.label || undefined,
              insertText: name,
            });
          }
        }
      }

      return { isIncomplete: false, items };
    }

    // If on a line that expects a field ref, offer view.field completions
    const trimmed = line.trim();
    const isFieldContext =
      trimmed.startsWith("- ") ||
      trimmed.startsWith("field:") ||
      this.isDashboardListenLine(lines, position.position.line);

    if (isFieldContext) {
      const views = this.workspaceModel.getViews();
      for (const [viewName, viewDetails] of views) {
        if (viewName.startsWith("+")) continue;
        const fields = this.workspaceModel.getViewFields(viewName);
        const fieldTypes = [
          { type: "dimension", map: fields.dimension, kind: CompletionItemKind.Field },
          { type: "measure", map: fields.measure, kind: CompletionItemKind.Value },
          { type: "dimension_group", map: fields.dimension_group, kind: CompletionItemKind.Field },
        ];
        for (const { type, map, kind } of fieldTypes) {
          for (const [fieldName, field] of Object.entries(map || {})) {
            items.push({
              label: `${viewName}.${fieldName}`,
              kind,
              detail: type,
              documentation: (field as any)?.description || (field as any)?.label || undefined,
            });
          }
        }
      }
    }

    // On `explore:` lines, suggest explores
    if (trimmed.startsWith("explore:") || trimmed === "explore:") {
      for (const [exploreName] of this.workspaceModel.getExplores()) {
        items.push({
          label: exploreName,
          kind: CompletionItemKind.Module,
          detail: "explore",
        });
      }
    }

    return { isIncomplete: false, items };
  }

  private isDashboardListenLine(lines: string[], lineIdx: number): boolean {
    const line = lines[lineIdx];
    const trimmed = line.trim();
    if (trimmed.startsWith("- ") || trimmed.startsWith("#")) return false;
    if (!trimmed.includes(":")) return false;

    const currentIndent = line.length - line.trimStart().length;
    for (let j = lineIdx - 1; j >= 0; j--) {
      const prevLine = lines[j];
      const prevTrimmed = prevLine.trim();
      if (prevTrimmed === "") continue;
      const prevIndent = prevLine.length - prevLine.trimStart().length;
      if (prevIndent < currentIndent) {
        return prevTrimmed.startsWith("listen:");
      }
    }
    return false;
  }
}
