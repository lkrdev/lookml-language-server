import { TextDocument } from "vscode-languageserver-textdocument";
import {
  CompletionItem,
  TextDocumentPositionParams,
  CompletionList,
  Connection
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { ContextDetector } from "./context-detector";
import { BlockCompletionProvider } from "./block-completions";
import { PropertyCompletionProvider } from "./property-completions";
import { SQLCompletionProvider } from "./sql-completions";
import { DocumentationProvider } from "./documentation-provider";
import { getAllSnippets } from "./snippets";

export class CompletionProvider {
  private workspaceModel: WorkspaceModel;
  private contextDetector: ContextDetector;
  private blockCompletions: BlockCompletionProvider;
  private propertyCompletions: PropertyCompletionProvider;
  private sqlCompletions: SQLCompletionProvider;
  private documentationProvider: DocumentationProvider;

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
    this.contextDetector = new ContextDetector();
    this.blockCompletions = new BlockCompletionProvider(workspaceModel);
    this.propertyCompletions = new PropertyCompletionProvider(workspaceModel);
    this.sqlCompletions = new SQLCompletionProvider(workspaceModel);
    this.documentationProvider = new DocumentationProvider(workspaceModel);
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
      
      let items: CompletionItem[] = [];
      
      console.log("context.type", context.type);
      // Get completions based on context
      switch (context.type) {
        case 'empty':
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
          // When user types ${ to reference a table
          items = this.sqlCompletions.getTableReferenceCompletions(context);
          break;
          
        case 'field_reference':
          // When user types ${table_name. to reference fields
          if (context.viewName) {
            items = this.sqlCompletions.getFieldReferenceCompletions(context.viewName);
          }
          break;
          
        default:
          // Add snippets as fallback
          items = getAllSnippets();
          break;
      }
      
      // If we're potentially in a snippet context, add all snippets
      const line = document.getText({
        start: { line: position.position.line, character: 0 },
        end: position.position
      });
      
      if (line.trim() === '' || this.isAtWordBoundary(line)) {
        items = [...items, ...getAllSnippets()];
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