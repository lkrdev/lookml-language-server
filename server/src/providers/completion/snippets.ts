import { CompletionItem, CompletionItemKind, InsertTextFormat, MarkupKind } from "vscode-languageserver/node";

/**
 * Snippets for common LookML patterns
 */
export const SNIPPETS: {
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
  dimension_group: {
    prefix: "dimension_group",
    body: "dimension_group: ${1:created} {\n  type: time\n  timeframes: [raw, time, date, week, month, quarter, year]\n  sql: ${2:\\${TABLE}.created_at} ;;\n}",
    description: "Create a time-based dimension group",
  },
  explore: {
    prefix: "explore",
    body: "explore: ${1:name} {\n  view_name: ${2:view_name}\n  \n  ${0}\n}",
    description: "Create a new explore",
  },
  join: {
    prefix: "join",
    body: "join: ${1:view_name} {\n  type: left_outer\n  relationship: many_to_one\n  sql_on: ${2:\\${view_name.field} = \\${other_view.field}} ;;\n}",
    description: "Create a join between views",
  },
  filter: {
    prefix: "filter",
    body: "filter: ${1:name} {\n  type: ${2:string}\n  sql: ${3:\\${TABLE}.field} ;;\n}",
    description: "Create a filter",
  },
};

/**
 * Create a completion item for a snippet
 */
export function createSnippet(key: string): CompletionItem {
  const snippet = SNIPPETS[key];
  return {
    label: snippet.prefix,
    kind: CompletionItemKind.Snippet,
    insertText: snippet.body,
    insertTextFormat: InsertTextFormat.Snippet,
    documentation: {
      kind: MarkupKind.Markdown,
      value: `**${snippet.prefix}**\n\n${snippet.description}`
    },
    data: { type: "snippet", name: key },
  };
}

/**
 * Get all snippet completion items
 */
export function getAllSnippets(): CompletionItem[] {
  return Object.keys(SNIPPETS).map(key => createSnippet(key));
}