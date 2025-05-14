import { CompletionItem, CompletionItemKind, InsertTextFormat, MarkupKind } from "vscode-languageserver/node";

type SnippetWhere = 'root' | 'view' | 'dimension' | 'measure' | 'dimension_group' | 'explore' | 'join' | 'filter' | 'parameter';

/**
 * Snippets for common LookML patterns
 */
export const SNIPPETS: {
  [key: string]: { prefix: string; body: string; description: string, where: SnippetWhere[] };
} = {
  dimension: {
    prefix: "dimension",
    body: "dimension: ${1:name} {\n  type: ${2:string}\n  sql: ${3:\\${field\}} ;;\n}",
    description: "Create a new dimension",
    where: ['view']
  },
  measure: {
    prefix: "measure",
    body: "measure: ${1:name} {\n  type: ${2:count}\n  drill_fields: [${3:id}]\n}",
    description: "Create a new measure",
    where: ["view"]
  },
  view: {
    prefix: "view",
    body: "view: ${1:name} {\n  sql_table_name: ${2:schema.table_name} ;;\n\n  ${0}\n}",
    description: "Create a new view",
    where: ["root"]
  },
  dimension_group: {
    prefix: "dimension_group",
    body: "dimension_group: ${1:created} {\n  type: time\n  timeframes: [raw, time, date, week, month, quarter, year]\n  sql: ${2:\\${TABLE}.created_at} ;;\n}",
    description: "Create a time-based dimension group",
    where: ["view"]
  },
  explore: {
    prefix: "explore",
    body: "explore: ${1:name} {\n  view_name: ${2:view_name}\n  \n  ${0}\n}",
    description: "Create a new explore",
    where: ["root"]
  },
  join: {
    prefix: "join",
    body: "join: ${1:view_name} {\n  type: left_outer\n  sql_on: ${2:\\${view_name.field} = \\${other_view.field}} ;;\n  relationship: ${3:many_to_one}\n}",
    description: "Create a join between views",
    where: ["explore"]
  },
  filter: {
    prefix: "filter",
    body: "filter: ${1:name} {\n  type: ${2:string}\n  sql: {% condition ${1:name} %} ${3:\\${field\}} {% endcondition %} ;;\n}",
    description: "Create a filter",
    where: ["view"]
  },
  parameter: {
    prefix: "parameter",
    body: "parameter: ${1:name} {\n  type: ${2:string}\n  allowed_value: {\n    value: \"foo\"\n    label: \"Foo\"\n  }\n}",
    description: "Create a parameter",
    where: ["view"]
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

export function getSnippetsForContext(context: SnippetWhere): CompletionItem[] {
  return Object.keys(SNIPPETS).filter(key => SNIPPETS[key].where.includes(context)).map(key => createSnippet(key));
}