import { CompletionItem, MarkupKind } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import * as path from "path";
import { URI } from "vscode-uri";

/**
 * Documentation for LookML keywords and types
 */
export class DocumentationProvider {
  private workspaceModel: WorkspaceModel;

  // Documentation for common LookML keywords
  private readonly keywordDocs: { [key: string]: string } = {
    view: "A view in LookML represents a database table or derived table. Views contain dimensions, dimension groups, measures, parameters, and filters.",
    explore: "An explore specifies which views to use and how they join together. Explores define the entry points for creating queries in Looker.",
    model: "A model defines a collection of explores that should be grouped together. Models also define database connections and include files.",
    dimension: "A field that can be selected and filtered in queries. Dimensions represent non-aggregated data, like customer name or product ID.",
    dimension_group: "A special type of dimension that creates multiple time-based dimensions from a single datetime field.",
    measure: "A field that aggregates multiple rows (e.g., sum, count). Measures perform calculations across all rows for a particular column.",
    parameter: "A field that accepts user input. Parameters can be used to create dynamic queries or filters.",
    filter: "A dimension that can be used to filter query results but doesn't appear as a column in the results.",
    join: "A connection between two views in an explore. Joins specify how to link tables together.",
    sql_table_name: "Specifies the database table that a view refers to.",
    extends: "Allows a view to inherit fields from another view.",
    sql: "Defines the SQL expression for a field.",
    sql_on: "Defines the join condition between two views.",
    type: "Specifies the data type of a field.",
  };

  // Documentation for common LookML types
  private readonly typeDocs: { [key: string]: string } = {
    string: "Text data type that can store characters, words, and sentences.",
    number: "Numeric data type that can be used in calculations.",
    date: "A calendar date without time information.",
    time: "A time of day without date information.",
    datetime: "A combined date and time value.",
    yesno: "Boolean data type with yes/no values.",
    tier: "Groups numeric values into buckets or ranges.",
    zipcode: "A specialized type for handling postal codes.",
    count: "Counts the number of rows in a table.",
    count_distinct: "Counts the number of unique values in a column.",
    sum: "Adds up all values in a column.",
    average: "Calculates the mean of values in a column.",
    max: "Finds the maximum value in a column.",
    min: "Finds the minimum value in a column.",
  };

  // Documentation for common properties
  private readonly propertyDocs: { [key: string]: string } = {
    label: "Human-readable name for this element.",
    description: "Detailed description that appears in the Looker UI.",
    hidden: "When set to 'yes', hides this element from users in the Looker UI.",
    primary_key: "Identifies this dimension as containing unique row identifiers.",
    group_label: "Groups this field with others under a common heading.",
    value_format: "Specifies how values should be formatted when displayed.",
    drill_fields: "Fields that appear when a user drills into this field.",
  };

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

  /**
   * Enhance a completion item with documentation
   */
  public enhanceCompletionItem(item: CompletionItem): CompletionItem {
    if (!item.data) return item;

    const data = item.data as any;
    
    switch (data.type) {
      case "keyword":
        item.documentation = {
          kind: MarkupKind.Markdown,
          value: this.getKeywordDocumentation(item.label as string),
        };
        break;
        
      case "type":
        item.documentation = {
          kind: MarkupKind.Markdown,
          value: this.getTypeDocumentation(item.label as string),
        };
        break;
        
      case "property":
        item.documentation = {
          kind: MarkupKind.Markdown,
          value: this.getPropertyDocumentation(item.label as string, data.blockType),
        };
        break;
        
      case "view-ref":
        item.documentation = {
          kind: MarkupKind.Markdown,
          value: this.getViewDocumentation(item.label as string),
        };
        break;
        
      case "field-ref":
        item.documentation = {
          kind: MarkupKind.Markdown,
          value: this.getFieldDocumentation(data.viewName, item.label as string),
        };
        break;
    }
    
    return item;
  }

  /**
   * Get documentation for a LookML keyword
   */
  public getKeywordDocumentation(keyword: string): string {
    return this.keywordDocs[keyword] || `LookML keyword: ${keyword}`;
  }

  /**
   * Get documentation for a LookML type
   */
  public getTypeDocumentation(type: string): string {
    return this.typeDocs[type] || `LookML type: ${type}`;
  }

  /**
   * Get documentation for a property
   */
  public getPropertyDocumentation(property: string, blockType?: string): string {
    const blockContext = blockType ? ` in ${blockType} blocks` : '';
    
    if (property in this.propertyDocs) {
      return `**${property}**\n\n${this.propertyDocs[property]}\n\nUsed${blockContext}.`;
    }
    
    return `**${property}**\n\nLookML property used${blockContext}.`;
  }

  /**
   * Get documentation for a view
   */
  public getViewDocumentation(viewName: string): string {
    const viewDetails = this.workspaceModel.getView(viewName);
    const view = viewDetails?.view;
    if (!view) return `View: ${viewName}`;
    
    let doc = `# View: ${viewName}\n\n`;
    
    // Add field counts
    const fieldCount = (
      Object.keys(view.measure || {}).length + 
      Object.keys(view.dimension || {}).length + 
      Object.keys(view.dimension_group || {}).length
    );

    doc += `Contains ${fieldCount} fields\n\n`;
    
    // Add location
    console.log("getViewDocumentation view", view);
    //doc += `Defined in: ${this.getRelativePath(view.location.uri)}`;
    
    return doc;
  }

  /**
   * Get documentation for a field
   */
  public getFieldDocumentation(viewName: string, fieldName: string): string {
    const viewDetails = this.workspaceModel.getView(viewName);
    const view = viewDetails?.view;
    if (!view) {
      return `Field: ${fieldName} in view: ${viewName}`;
    }
    
    const field = view.measure?.[fieldName] || view.dimension?.[fieldName] || view.dimension_group?.[fieldName];
    if (!field) return `Field: ${fieldName} in view: ${viewName}`;
    
    let doc = `# ${field.type}: ${fieldName}\n\n`;
    
    // Add description if available
    const description = field.description
    if (description) {
      doc += `${description}\n\n`;
    }
    
    // Add field type if available
    const type = field.type;
    if (type) {
      doc += `**Type**: ${type}\n\n`;
    }
    
    // Add SQL definition if available
    const sql = field.sql;
    if (sql) {
      doc += `**SQL**:\n\`\`\`sql\n${sql}\n\`\`\`\n\n`;
    }
    
    doc += `Defined in view: ${viewName}`;
    return doc;
  }

  /**
   * Get a relative path from a URI
   */
  private getRelativePath(uri: string): string {
    try {
      const uriObj = URI.parse(uri);
      return path.basename(uriObj.fsPath);
    } catch (e) {
      return uri;
    }
  }
}