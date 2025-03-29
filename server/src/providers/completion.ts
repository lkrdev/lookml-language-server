import { TextDocument } from "vscode-languageserver-textdocument";
import {
  CompletionItem,
  CompletionItemKind,
  InsertTextFormat,
  TextDocumentPositionParams,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../models/workspace";

// Constants and data for completions
const lookmlKeywords = [
  "view",
  "explore",
  "model",
  "measure",
  "dimension",
  "parameter",
  "filter",
  "join",
  "sql_table_name",
  "sql",
  "sql_on",
  "from",
  "extends",
  "group_label",
  "label",
  "description",
  "type",
  "link",
  "html",
  "datagroup",
  "access_grant",
];

const lookmlTypes = [
  "string",
  "number",
  "date",
  "time",
  "datetime",
  "yesno",
  "tier",
  "zipcode",
  "count",
  "count_distinct",
  "sum",
  "average",
  "max",
  "min",
];

// Common property patterns for different block types
const commonProperties: { [key: string]: string[] } = {
  view: ["sql_table_name", "extends", "derived_table"],
  dimension: ["type", "sql", "label", "group_label", "description", "hidden"],
  measure: ["type", "sql", "label", "group_label", "description", "hidden"],
  explore: ["view_name", "from", "join", "label", "description", "hidden"],
};

// Snippets for common LookML patterns
const snippets: {
  [key: string]: { prefix: string; body: string; description: string };
} = {
  dimension: {
    prefix: "dimension",
    body: "dimension: ${1:name} {\n  type: ${2:string}\n  sql: ${3:\\${TABLE}.field} ;;\n}",
    description: "Create a new dimension",
  },
  measure: {
    prefix: "measure",
    body: "measure: ${1:name} {\n  type: ${2:count}\n  drill_fields: [${3:id}]\n}",
    description: "Create a new measure",
  },
  view: {
    prefix: "view",
    body: "view: ${1:name} {\n  sql_table_name: ${2:schema.table_name} ;;\n\n  ${0}\n}",
    description: "Create a new view",
  },
};

export class CompletionProvider {
  private workspaceModel: WorkspaceModel;

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

  /**
   * Provide completion items for a given position in a document
   */
  public getCompletionItems(
    document: TextDocument,
    position: TextDocumentPositionParams
  ): CompletionItem[] {
    const text = document.getText();
    const lines = text.split("\n");
    const line = lines[position.position.line];
    const linePrefix = line.substring(0, position.position.character);

    // Check if we're starting a new block declaration
    const blockStart = linePrefix.match(/^\s*([a-zA-Z0-9_]+):\s*$/);
    if (blockStart) {
      const blockType = blockStart[1];

      // Suggest view names for 'extends'
      if (blockType === "extends") {
        return this.getViewNameCompletions();
      }

      // For other types, return general keywords
      return this.getKeywordCompletions();
    }

    // Check if we're inside a block and providing properties
    const propertyMatch = linePrefix.match(/^\s+([a-zA-Z0-9_]+):\s*$/);
    if (propertyMatch) {
      const blockType = this.getCurrentBlockType(document, position);
      return this.getPropertyCompletions(blockType);
    }

    // Check if we're in SQL context
    if (linePrefix.match(/.*sql:\s*$/)) {
      return this.getSQLCompletions(document, position);
    }

    // Check if typing a snippet prefix
    for (const [key, snippet] of Object.entries(snippets)) {
      if (
        linePrefix.endsWith(snippet.prefix) ||
        linePrefix.match(new RegExp(`\\b${snippet.prefix}$`))
      ) {
        return [this.createSnippet(key)];
      }
    }

    // Default: suggest general keywords and types
    return this.getKeywordCompletions();
  }

  /**
   * Resolve additional information for a completion item
   */
  public resolveCompletionItem(item: CompletionItem): CompletionItem {
    // Add detailed documentation or examples based on the item type
    if (item.data) {
      const data = item.data as any;

      if (data.type === "keyword") {
        // Add documentation for keywords
        item.documentation = {
          kind: "markdown",
          value: this.getKeywordDocumentation(item.label as string),
        };
      } else if (data.type === "type") {
        // Add documentation for types
        item.documentation = {
          kind: "markdown",
          value: this.getTypeDocumentation(item.label as string),
        };
      } else if (data.type === "property") {
        // Add documentation for properties
        item.documentation = {
          kind: "markdown",
          value:
            `Property for ${data.blockType} blocks\n\n` +
            `Commonly used in ${data.blockType} definitions.`,
        };
      } else if (data.type === "view-ref") {
        // Add documentation for view references
        const viewInfo = this.workspaceModel.getView(item.label as string);
        if (viewInfo) {
          item.documentation = {
            kind: "markdown",
            value:
              `**View: ${item.label}**\n\n` +
              `Contains ${viewInfo.fields.size} fields\n\n` +
              `Defined in ${this.getRelativePath(viewInfo.location.uri)}`,
          };
        }
      }
    }

    return item;
  }

  /**
   * Get completions for view names (used in extends, from, etc.)
   */
  private getViewNameCompletions(): CompletionItem[] {
    return Array.from(
      this.workspaceModel.getViews().entries() as Iterable<[string, any]>
    ).map(([viewName]) => ({
      label: viewName,
      kind: CompletionItemKind.Reference,
      data: { type: "view-ref" },
    }));
  }

  /**
   * Get completions for general keywords and types
   */
  private getKeywordCompletions(): CompletionItem[] {
    const keywordItems = lookmlKeywords.map((keyword) => ({
      label: keyword,
      kind: CompletionItemKind.Keyword,
      data: { type: "keyword" },
    }));

    const typeItems = lookmlTypes.map((type) => ({
      label: type,
      kind: CompletionItemKind.TypeParameter,
      data: { type: "type" },
    }));

    // Add snippet completions
    const snippetItems = Object.entries(snippets).map(([key, snippet]) =>
      this.createSnippet(key)
    );

    return [...keywordItems, ...typeItems, ...snippetItems];
  }

  /**
   * Create a snippet completion item
   */
  private createSnippet(key: string): CompletionItem {
    const snippet = snippets[key];
    return {
      label: snippet.prefix,
      kind: CompletionItemKind.Snippet,
      insertText: snippet.body,
      insertTextFormat: InsertTextFormat.Snippet,
      documentation: snippet.description,
      data: { type: "snippet", name: key },
    };
  }

  /**
   * Get property completions based on the current block type
   */
  private getPropertyCompletions(blockType: string | null): CompletionItem[] {
    if (blockType && commonProperties[blockType]) {
      return commonProperties[blockType].map((prop) => ({
        label: prop,
        kind: CompletionItemKind.Property,
        data: { type: "property", blockType },
      }));
    }

    // Default properties
    return [
      {
        label: "label",
        kind: CompletionItemKind.Property,
        data: { type: "property" },
      },
      {
        label: "group_label",
        kind: CompletionItemKind.Property,
        data: { type: "property" },
      },
      {
        label: "description",
        kind: CompletionItemKind.Property,
        data: { type: "property" },
      },
      {
        label: "hidden",
        kind: CompletionItemKind.Property,
        data: { type: "property" },
      },
    ];
  }

  /**
   * Get SQL-specific completions
   */
  private getSQLCompletions(
    document: TextDocument,
    position: TextDocumentPositionParams
  ): CompletionItem[] {
    // Here you could provide table names, column suggestions, etc.
    return [
      {
        label: "${TABLE}",
        kind: CompletionItemKind.Constant,
        data: { type: "sql" },
      },
      {
        label: "CONCAT",
        kind: CompletionItemKind.Function,
        data: { type: "sql" },
      },
      {
        label: "CAST",
        kind: CompletionItemKind.Function,
        data: { type: "sql" },
      },
      {
        label: "COALESCE",
        kind: CompletionItemKind.Function,
        data: { type: "sql" },
      },
    ];
  }

  /**
   * Determine the current block type by scanning backwards from the current position
   */
  private getCurrentBlockType(
    document: TextDocument,
    position: TextDocumentPositionParams
  ): string | null {
    const text = document.getText();
    const lines = text.split("\n");

    // Scan backwards from current line to find the block type
    for (let i = position.position.line - 1; i >= 0; i--) {
      const line = lines[i].trim();
      const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+[a-zA-Z0-9_]+\s*\{/);
      if (blockMatch) {
        return blockMatch[1];
      }
      // Exit if we hit a block end
      if (line === "}") break;
    }

    return null;
  }

  /**
   * Get documentation for a LookML keyword
   */
  private getKeywordDocumentation(keyword: string): string {
    const docs: { [key: string]: string } = {
      view: "A view in LookML represents a database table or derived table.",
      explore:
        "An explore specifies which views to use and how they join together.",
      model:
        "A model defines a collection of explores that should be grouped together.",
      dimension: "A field that can be selected and filtered in queries.",
      measure: "A field that aggregates multiple rows (e.g., sum, count).",
      // Add more documentation entries here
    };

    return docs[keyword] || `LookML keyword: ${keyword}`;
  }

  /**
   * Get documentation for a LookML type
   */
  private getTypeDocumentation(type: string): string {
    const docs: { [key: string]: string } = {
      string: "Text data type that can store characters.",
      number: "Numeric data type that can be used in calculations.",
      date: "A calendar date without time information.",
      yesno: "Boolean data type with yes/no values.",
      // Add more type documentation here
    };

    return docs[type] || `LookML type: ${type}`;
  }

  /**
   * Get a relative path from a URI
   */
  private getRelativePath(uri: string): string {
    try {
      // Strip file:// and get just the path portion
      return (
        uri
          .replace(/^file:\/\//, "")
          .split("/")
          .pop() || uri
      );
    } catch (e) {
      return uri;
    }
  }
}
