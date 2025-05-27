import { Position, TextDocument } from "vscode-languageserver-textdocument";
import {
  CompletionItem,
  TextDocumentPositionParams,
  CompletionList,
  Connection,
  CompletionItemKind
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { ContextDetector } from "./context-detector";
import { LineContextDetector } from "./context-detector";
import { BlockCompletionProvider } from "./block-completions";
import { PropertyCompletionProvider } from "./property-completions";
import { SQLCompletionProvider } from "./sql-completions";
import { DocumentationProvider } from "./documentation-provider";
import { getAllSnippets } from "./snippets";
import * as z from "zod";

import { 
  LookMLView, 
  dimensionSchema, 
  measureSchema, 
  parameterSchema, 
  filterSchema,
  joinSchema,
  exploreSchema,
  dimensionGroupSchema,
  setSchema
} from '../../schemas/lookml';

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

  public isInJoinBlock(text: string, position: TextDocumentPositionParams): boolean {
    const lines = text.split("\n");
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
    position: TextDocumentPositionParams
  ): CompletionItem[] | CompletionList {
    try {
      // Detect context at current position
      const context = this.contextDetector.getContext(document, position);
      const lineContext = this.lineContextDetector.getLineContext(document, position);
      
      let items: CompletionItem[] = [];
      
      // If we're completing a property, use the path to determine available properties
      if (lineContext.isPropertyCompletion) {
        // Get the schema based on the path
        const schema = this.getSchemaForPath(lineContext.path.map(p => p.type));
        if (schema) {
          // Get all property names from the schema, excluding internal parser fields
          const properties = Object.keys(schema._def.shape())
            .filter(prop => !prop.startsWith('$')); // Filter out internal fields like $name, $type, etc.

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
          const availableProperties = properties.filter(prop => !definedProperties.includes(prop));

          items = availableProperties.map(prop => ({
            label: prop,
            kind: CompletionItemKind.Property,
            insertText: `${prop}: `,
            data: { type: "property", path: lineContext.path.map(p => p.type) }
          }));
        }
      } else {
        // Get completions based on context
        switch (context.type) {
          case 'block':
            items = this.blockCompletions.getCompletions(context);
            break;
            
          case 'property':
          case 'type':
          case 'value':
            items = this.propertyCompletions.getCompletions(context);
            break;
            
          case 'sql':
          case 'sql_on':
            items = this.sqlCompletions.getCompletions(context);
            break;

          case 'table_reference':
            items = this.sqlCompletions.getTableReferenceCompletions(context);
            break;

          case 'dimension_reference':
            items = this.sqlCompletions.getDimensionReferenceCompletions(context);
            break;
            
          case 'field_reference':
            items = this.sqlCompletions.getFieldReferenceCompletions(context);
            break;
            
          default:
            items = getAllSnippets();
            break;
        }
      }

      if (this.isInJoinBlock(document.getText(), position) && context.linePrefix?.trim() === "") {
        items.push(...[
          { label: "type", kind: CompletionItemKind.Property },
          { label: "sql_on", kind: CompletionItemKind.Property },
          { label: "relationship", kind: CompletionItemKind.Property },
        ]);
      }
      
      return {
        isIncomplete: false,
        items
      };
      
    } catch (error) {
      console.error('Error providing completions:', error);
      return [];
    }
  }

  /**
   * Get the appropriate Zod schema based on the current path
   */
  private getSchemaForPath(path: string[]): z.ZodObject<any> | undefined {
    if (path.length === 0) return undefined;

    // Map path to schema
    const schemaMap: { [key: string]: z.ZodObject<any> | z.ZodEffects<z.ZodObject<any>> } = {
      'dimension_group': dimensionGroupSchema,
      'dimension': dimensionSchema,
      'explore': exploreSchema,
      'filter': filterSchema,
      'join': joinSchema,
      'measure': measureSchema,
      'parameter': parameterSchema,
      'set': setSchema,
      'view': LookMLView,
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
}