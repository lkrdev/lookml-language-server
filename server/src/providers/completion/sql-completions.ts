import { CompletionItem, CompletionItemKind, InsertTextFormat } from "vscode-languageserver/node";
import { CompletionContext } from "./context-detector";
import { WorkspaceModel } from "../../models/workspace";

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
  views.forEach((view, viewName) => {
    items.push({
      label: viewName,
      kind: CompletionItemKind.Class,
      insertText: viewName, 
      detail: `View: ${viewName}`,
      data: { type: "view-ref", viewName }
    });
  });
  
  return items;
}

public getFieldReferenceCompletions(viewName: string): CompletionItem[] {
  const items: CompletionItem[] = [];
  
  // Get the view by name
  const view = this.workspaceModel.getView(viewName);
  
  if (view && view.fields) {
    // Add each field as a completion item
    view.fields.forEach((field, fieldName) => {
      items.push({
        label: fieldName,
        kind: CompletionItemKind.Field,
        detail: `${field.type} in ${viewName}`,
        data: { type: "field-ref", viewName, fieldName }
      });
    });
  }
  
  return items;
}
  
  /**
   * Get completions for SQL contexts
   */
  public getCompletions(context: CompletionContext): CompletionItem[] {
    if (context.type === 'sql') {
      return this.getSQLCompletions(context);
    } else if (context.type === 'sql_on') {
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
  
  /**
   * Get completions specific to JOIN.sql_on conditions
   */
  private getJoinSQLCompletions(context: CompletionContext): CompletionItem[] {
    const items: CompletionItem[] = [];
    
    // Add base and join view field references
    if (context.exploreName) {
      const explore = this.workspaceModel.getExplore(context.exploreName);
      if (explore && explore.viewName) {
        // Add fields from base view
        this.addFieldReferences(items, explore.viewName);
        
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
    const view = this.workspaceModel.getView(viewName);
    if (view) {
      view.fields.forEach((field, fieldName) => {
        items.push({
          label: `\${${viewName}.${fieldName}}`,
          kind: CompletionItemKind.Reference,
          data: { type: "field-ref", viewName, fieldName }
        });
      });
    }
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