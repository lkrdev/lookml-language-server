import { CompletionItem, CompletionItemKind, InsertTextFormat, MarkupKind } from "vscode-languageserver/node";
import { CompletionContext } from "./context-detector";
import { WorkspaceModel } from "../../models/workspace";

interface LookMLField {
  $name: string;
  type: string;
  label?: string;
  description?: string;
}

interface LookMLView {
  dimension?: { [key: string]: LookMLField };
  measure?: { [key: string]: LookMLField };
  dimension_group?: { [key: string]: LookMLField };
}

export class SQLCompletionProvider {
  private workspaceModel: WorkspaceModel;
  
  // Common SQL functions and keywords
  private readonly sqlFunctions = [
    "CONCAT", "CAST", "COALESCE", "LENGTH", "LOWER", "UPPER", 
    "TRIM", "RTRIM", "LTRIM", "SUBSTRING", "ROUND", "FLOOR", "CEIL"
  ];
  
  private readonly sqlKeywords = [
    "SELECT", "FROM", "WHERE", "GROUP BY", "ORDER BY",
    "HAVING", "CASE", "WHEN", "THEN", "ELSE", "END", "IS NULL",
    "IS NOT NULL", "LIKE", "IN", "NOT IN", "EXISTS", "NOT EXISTS"
  ];
  
  private readonly sqlOperators = [
    "=", "<>", "!=", ">", "<", ">=", "<=", "AND", "OR", "NOT", "BETWEEN", "IN"
  ];
  
  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

  // In SQLCompletionProvider class
public getTableReferenceCompletions(context: CompletionContext): CompletionItem[] {
  const items: CompletionItem[] = [];
  
  // Get all views from the workspace
  const views = this.workspaceModel.getViews();
  
  // Add each view as a completion item
  views.forEach((_, viewName) => {
    items.push({
      label: viewName,
      kind: CompletionItemKind.Class,
      detail: `View: ${viewName}`,
      data: { type: "view-ref", viewName }
    });
  });
  
  return items;
}

public getFieldReferenceCompletions(context: CompletionContext): CompletionItem[] {
  if (!context.viewName) {
    return [];
  }

  const items: CompletionItem[] = [{
    label: "TABLE",
    kind: CompletionItemKind.Module,
    detail: `table: ${context.viewName}`,
    insertText: `TABLE}`,
    data: { type: "field-ref", viewName: context.viewName, fieldName: "TABLE" }
  }];
  
  if (context.linePrefix?.slice(-1) === "{") {
    // Get all views from the workspace
    const allViews = this.workspaceModel.getViews();
    
    // Add all available views as completion items
    allViews.forEach((viewDetails, name) => {
      const view = viewDetails.view as LookMLView;
      if (view) {
        items.push({
          label: name,
          kind: CompletionItemKind.Module,
          detail: `view: ${name}`,
          data: { type: "field-ref", viewName: name, fieldName: name }
        });
      }
    });
  }

  // Get the specific view by name for its fields
  const viewDetails = this.workspaceModel.getView(context.viewName);
  const view = viewDetails?.view as LookMLView | undefined;

  if (!view) {
    return items;
  }

  const fields = [
    ...Object.values(view.measure || {}), 
    ...Object.values(view.dimension || {}), 
    ...Object.values(view.dimension_group || {})
  ] as LookMLField[];

  if (!fields.length) {
    return items;
  }

  // Check if we're in sql_on context and on the left side of =
  const isSqlOnLeftSide = context.linePrefix?.includes('sql_on:') && 
    !context.linePrefix?.includes('=');

  fields.forEach((field) => {
    items.push({
      label: field.$name,
      kind: CompletionItemKind.Field,
      detail: `${field.type} in ${context.viewName}`,
      insertText: `${field.$name}}${isSqlOnLeftSide ? '' : ' ;;'}`,
      data: { type: "field-ref", viewName: context.viewName, fieldName: field.$name }
    });
  });
  
  return items;
}
  
  /**
   * Get completions for SQL contexts
   */
  public getCompletions(context: CompletionContext): CompletionItem[] {
    if (context.type === 'sql') {
      return this.getSQLCompletions(context);
    }
    
    if (context.type === 'sql_on') {
      return this.getJoinSQLCompletions(context);
    }
    
    return [];
  }
  
  /**
   * Get SQL-specific completions
   */
  private getSQLCompletions(context: CompletionContext): CompletionItem[] {
    const items: CompletionItem[] = [];
    
    const tableFieldMatch = context.linePrefix?.match(/\$\{([a-zA-Z0-9_]+)\.\s*$/);
  
    if (tableFieldMatch) {
      // We've matched a pattern like ${tablename. - extract the table name
      const tableName = tableFieldMatch[1];
      
      // Add field completions for that specific table
      this.addTableFieldCompletions(items, tableName);
      
      // Return early since we're in a specific context
      return items;
    }

    // Add TABLE reference
    items.push({
      label: "${TABLE}",
      kind: CompletionItemKind.Constant,
      data: { type: "sql" },
      documentation: "References the table associated with this view"
    });
    
    // Add SQL functions
    this.sqlFunctions.forEach(func => {
      items.push({
        label: func,
        kind: CompletionItemKind.Function,
        data: { type: "sql" },
        insertText: this.getSQLFunctionSnippet(func),
        insertTextFormat: InsertTextFormat.Snippet
      });
    });
    
    // Add SQL keywords
    this.sqlKeywords.forEach(keyword => {
      items.push({
        label: keyword,
        kind: CompletionItemKind.Keyword,
        data: { type: "sql" }
      });
    });
    
    // Add field references from the current view
    if (context.viewName) {
      this.addFieldReferences(items, context.viewName);
    }
    
    return items;
  }

  public getDimensionReferenceCompletions(context: CompletionContext): CompletionItem[] {
    const completions: CompletionItem[] = [];
    
    // Only provide completions in view files
    if (!context.viewName) return completions;

    // Get the current view
    const viewDetails = this.workspaceModel.getView(context.viewName);
    const view = viewDetails?.view as LookMLView | undefined;
    if (!view) return completions;

    // Add all dimensions from the current view
    for (const [dimensionName, dimension] of Object.entries(view?.dimension || {})) {
      completions.push({
        label: dimensionName,
        kind: CompletionItemKind.Field,
        detail: `Dimension from ${context.viewName}`,
        documentation: {
          kind: MarkupKind.Markdown,
          value: dimension.description || `Dimension: ${dimensionName}`,
        },
        insertText: dimensionName,
      });
    }

    return completions;
  }
  
  /**
   * Get completions specific to JOIN.sql_on conditions
   */
  private getJoinSQLCompletions(context: CompletionContext): CompletionItem[] {
    const items: CompletionItem[] = [];
    
    // Add base and join view field references
    if (context.exploreName) {
      const exploreFile = this.workspaceModel.getExplore(context.exploreName);
      const fromView = exploreFile?.explore?.from;
      if (fromView) {
        // Add fields from base view
        this.addFieldReferences(items, fromView);
        
        // Add fields from join view if available
        if (context.joinName) {
          this.addFieldReferences(items, context.joinName);
        }
      }
    }
    
    // Add SQL operators
    this.sqlOperators.forEach(op => {
      items.push({
        label: op,
        kind: CompletionItemKind.Operator,
        data: { type: "sql_operator" }
      });
    });
    
    return items;
  }
  
  /**
   * Add field references from a view to the completion items
   */
  private addFieldReferences(items: CompletionItem[], viewName: string): void {
    const viewDetails = this.workspaceModel.getView(viewName);
    const view = viewDetails?.view as LookMLView | undefined;
    if (!view) {
      return;
    }
   
    const fields = [
      ...Object.values(view.measure || {}), 
      ...Object.values(view.dimension || {}), 
      ...Object.values(view.dimension_group || {})
    ] as LookMLField[];

    fields.forEach((field) => {
      items.push({
        label: `\${${viewName}.${field.$name}}`,
        kind: CompletionItemKind.Reference,
        data: { type: "field-ref", viewName, fieldName: field.$name }
      });
    });
   
  }
  
  /**
   * Get snippet for a SQL function
   */
  private getSQLFunctionSnippet(func: string): string {
    switch (func) {
      case "CONCAT":
        return "CONCAT(${1:expr1}, ${2:expr2})";
      case "CAST":
        return "CAST(${1:expr} AS ${2:type})";
      case "COALESCE":
        return "COALESCE(${1:expr1}, ${2:expr2})";
      case "SUBSTRING":
        return "SUBSTRING(${1:expr}, ${2:start}, ${3:length})";
      case "ROUND":
        return "ROUND(${1:expr}, ${2:decimals})";
      case "CASE":
        return "CASE\n  WHEN ${1:condition} THEN ${2:result}\n  ELSE ${3:default}\nEND";
      default:
        return `${func}($1)`;
    }
  }

  private addTableFieldCompletions(items: CompletionItem[], tableName: string): void {
    // Get table schema information from your workspace model
    const tableFields = this.workspaceModel.getTableFields(tableName);
    
    if (tableFields) {
      tableFields.forEach(field => {
        items.push({
          label: field.name,
          kind: CompletionItemKind.Field,
          detail: `${field.type} - ${tableName}`,
          data: { type: "table-field", tableName, fieldName: field.name }
        });
      });
    }
  }
}