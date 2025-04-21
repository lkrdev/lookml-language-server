import {
  Hover,
  MarkupKind,
  Position,
  Range,
  TextDocument,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../models/workspace";

export class HoverProvider {
  private workspaceModel: WorkspaceModel;

  // Documentation for LookML keywords
  private lookmlDocs: { [key: string]: string } = {
    view: "A view in LookML represents a database table or derived table.\n\n```lookml\nview: view_name {\n  # view definition\n}\n```",
    explore:
      "An explore specifies which views to use and how they join together.\n\n```lookml\nexplore: explore_name {\n  view_name: view_name\n}\n```",
    model:
      "A model defines a collection of explores that should be grouped together.\n\n```lookml\nmodel: model_name {\n  # model definition\n}\n```",
    dimension:
      "A field that can be selected and filtered in queries.\n\n```lookml\ndimension: dimension_name {\n  type: string\n  sql: ${TABLE}.field ;;\n}\n```",
    measure:
      "A field that aggregates multiple rows (e.g., sum, count).\n\n```lookml\nmeasure: measure_name {\n  type: count\n  drill_fields: [id]\n}\n```",
    parameter:
      "A user input field that can be referenced elsewhere in the model.\n\n```lookml\nparameter: parameter_name {\n  type: string\n  allowed_values: [value1, value2]\n}\n```",
    filter:
      "A field that can only be used for filtering, not for selecting.\n\n```lookml\nfilter: filter_name {\n  type: string\n  sql: ${TABLE}.field ;;\n}\n```",
    join: "Defines how to join two views together in an explore.\n\n```lookml\njoin: view_name {\n  relationship: many_to_one\n  sql_on: ${view_name.id} = ${other_view.view_id} ;;\n}\n```",
    sql_table_name:
      "Specifies the actual table name in the database.\n\n```lookml\nsql_table_name: schema_name.table_name ;;\n```",
    sql: "Raw SQL to define a field or derived table.\n\n```lookml\nsql: ${TABLE}.field ;;\n```",
    sql_on:
      "SQL expression that defines the join condition.\n\n```lookml\nsql_on: ${view_one.id} = ${view_two.id} ;;\n```",
    extends:
      "Inherits properties from another view or explore.\n\n```lookml\nextends: [view_name, another_view]\n```",
    group_label:
      'Groups fields together in the field picker.\n\n```lookml\ngroup_label: "Label Name"\n```',
    label:
      'The display name for a field in the Looker UI.\n\n```lookml\nlabel: "Display Name"\n```',
    description:
      'Provides additional information about a field to users.\n\n```lookml\ndescription: "Detailed description of what this field represents"\n```',
    type: "Defines the data type of a dimension or parameter.\n\n```lookml\ntype: string # or number, date, etc.\n```",
    datagroup:
      'Defines a caching policy for derived tables or PDTs.\n\n```lookml\ndatagroup: datagroup_name {\n  sql_trigger: SELECT CURRENT_DATE() ;;\n  max_cache_age: "24 hours"\n}\n```',
    access_grant:
      "Defines a permission that can be required to see certain fields or explores.\n\n```lookml\naccess_grant: grant_name {\n  user_attribute: attribute_name\n  allowed_values: [value1, value2]\n}\n```",
  };

  // Documentation for LookML types
  private typeDocs: { [key: string]: string } = {
    string: "Text data type that can store characters.",
    number: "Numeric data type that can be used in calculations.",
    date: "A calendar date without time information.",
    time: "A time of day without date information.",
    datetime: "A combined date and time value.",
    yesno: "Boolean data type with yes/no values.",
    tier: "Groups numeric values into custom buckets.",
    zipcode: "Special data type for US zip codes with appropriate formatting.",
    count: "Count of rows or records.",
    sum: "Sum of values in the specified column.",
    average: "Average of values in the specified column.",
    min: "Minimum value in the specified column.",
    max: "Maximum value in the specified column.",
    count_distinct: "Count of unique values in the specified column.",
    list: "A list of values.",
    location: "Geographic coordinates with mapping visualization.",
  };

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

  /**
   * Provide hover information at a given position
   */
  public getHoverInfo(
    document: TextDocument,
    position: Position
  ): Hover | null {
    //const text = document.getText();
    const wordRange = this.getWordRangeAtPosition(document, position);

    if (!wordRange) {
      return null;
    }

    const word = document.getText(wordRange);

    // Check different contexts for hover information
    const keywordHover = this.getKeywordHover(word);
    const typeHover = this.getTypeHover(word);
    const viewHover = this.getViewHover(word);
    const fieldHover = this.getFieldHover(word, document, position);
    const exploreHover = this.getExploreHover(word);
    const propertyHover = this.getPropertyHover(word, document, position);

    if (keywordHover) console.log("keywordHover", keywordHover);
    if (typeHover) console.log("typeHover", typeHover);
    if (viewHover) console.log("viewHover", viewHover);
    if (fieldHover) console.log("fieldHover", fieldHover);
    if (exploreHover) console.log("exploreHover", exploreHover);
    if (propertyHover) console.log("propertyHover", propertyHover);

    const hover =
      keywordHover ||
      typeHover ||
      viewHover ||
      fieldHover ||
      exploreHover ||
      propertyHover;

      console.log("hover", hover);
    return hover;
  }

  /**
   * Get the word range at the current position
   */
  private getWordRangeAtPosition(
    document: TextDocument,
    position: Position
  ): Range | null {
    const text = document.getText();
    const lines = text.split("\n");

    if (position.line >= lines.length) {
      return null;
    }

    const line = lines[position.line];
    const character = position.character;

    // Find word boundaries
    let start = character;
    let end = character;

    // Find start position
    while (start > 0) {
      const char = line.charAt(start - 1);
      if (!/[a-zA-Z0-9_]/.test(char)) {
        break;
      }
      start--;
    }

    // Find end position
    while (end < line.length) {
      const char = line.charAt(end);
      if (!/[a-zA-Z0-9_]/.test(char)) {
        break;
      }
      end++;
    }

    // No word found
    if (start === end) {
      return null;
    }

    return Range.create(
      Position.create(position.line, start),
      Position.create(position.line, end)
    );
  }

  /**
   * Get hover info for a keyword
   */
  private getKeywordHover(word: string): Hover | null {
    if (this.lookmlDocs[word]) {
      return {
        contents: {
          kind: MarkupKind.Markdown,
          value: `**${word}** (LookML Keyword)\n\n${this.lookmlDocs[word]}`,
        },
      };
    }
    return null;
  }

  /**
   * Get hover info for a type
   */
  private getTypeHover(word: string): Hover | null {
    if (this.typeDocs[word]) {
      return {
        contents: {
          kind: MarkupKind.Markdown,
          value: `**${word}** (LookML Type)\n\n${this.typeDocs[word]}`,
        },
      };
    }
    return null;
  }

  /**
   * Get hover info for a view
   */
  private getViewHover(word: string): Hover | null {
    const view = this.workspaceModel.getView(word);
    if (view) {
      // Extract field counts by type
      const fieldCounts = {
        dimension: 0,
        measure: 0,
        parameter: 0,
        filter: 0,
      };

      for (const [_, field] of view.fields.entries()) {
        fieldCounts[field.type]++;
      }

      // Build view details
      const details = [];

      // Add SQL table name if available
      const sqlTableName = view.properties.get("sql_table_name")?.value;
      if (sqlTableName) {
        details.push(`**SQL Table:** \`${sqlTableName}\``);
      }

      // Add extends info if available
      if (view.extends) {
        details.push(`**Extends:** \`${view.extends}\``);
      }

      // Add field counts
      details.push(
        `**Fields:** ${view.fields.size} total (${fieldCounts.dimension} dimensions, ${fieldCounts.measure} measures, ${fieldCounts.parameter} parameters, ${fieldCounts.filter} filters)`
      );

      return {
        contents: {
          kind: MarkupKind.Markdown,
          value: `**${word}** (View)\n\n${details.join("\n\n")}`,
        },
      };
    }
    return null;
  }

  /**
   * Get hover info for a field
   */
  private getFieldHover(
    word: string,
    document: TextDocument,
    position: Position
  ): Hover | null {
    // Check if this word is a field in any view
    for (const [viewName, viewInfo] of this.workspaceModel
      .getViews()
      .entries()) {

      if (viewInfo.fields.has(word)) {
        const field = viewInfo.fields.get(word)!;

        // Build field details
        const details = [];

        // Add type info if available
        const typeProperty = field.properties.get("type")?.value;
        if (typeProperty) {
          details.push(`**Type:** \`${typeProperty}\``);
        }

        // Add SQL definition if available
        const sqlProperty = field.properties.get("sql")?.value;
        if (sqlProperty) {
          details.push(`**SQL:** \`${sqlProperty}\``);
        }

        // Add label if available
        const labelProperty = field.properties.get("label")?.value;
        if (labelProperty) {
          details.push(`**Label:** ${labelProperty}`);
        }

        // Add description if available
        const descProperty = field.properties.get("description")?.value;
        if (descProperty) {
          details.push(`**Description:** ${descProperty}`);
        }

        return {
          contents: {
            kind: MarkupKind.Markdown,
            value: `**${word}** (${
              field.type
            }) in View \`${viewName}\`\n\n${details.join("\n\n")}`,
          },
        };
      }
    }
    return null;
  }

  /**
   * Get hover info for an explore
   */
  private getExploreHover(word: string): Hover | null {
    const explore = this.workspaceModel.getExplore(word);
    if (explore) {
      // Build explore details
      const details = [];

      // Add view name if available
      if (explore.viewName) {
        details.push(`**Based on view:** \`${explore.viewName}\``);
      }

      // Add join count
      details.push(`**Joins:** ${explore.joins.size}`);

      // Add label if available
      const labelProperty = explore.properties.get("label")?.value;
      if (labelProperty) {
        details.push(`**Label:** ${labelProperty}`);
      }

      // Add description if available
      const descProperty = explore.properties.get("description")?.value;
      if (descProperty) {
        details.push(`**Description:** ${descProperty}`);
      }

      return {
        contents: {
          kind: MarkupKind.Markdown,
          value: `**${word}** (Explore)\n\n${details.join("\n\n")}`,
        },
      };
    }
    return null;
  }

  /**
   * Get hover info for a property based on context
   */
  private getPropertyHover(
    word: string,
    document: TextDocument,
    position: Position
  ): Hover | null {
    // Check if the word is a property within the current context
    const text = document.getText();
    const lines = text.split("\n");
    const line = lines[position.line];

    // Check if we're looking at a property assignment
    const propertyMatch = line.match(/^\s*([a-zA-Z0-9_]+):/);
    if (propertyMatch && propertyMatch[1] === word) {
      // Find the containing block by scanning backwards
      let blockType = null;
      let blockName = null;

      for (let i = position.line - 1; i >= 0; i--) {
        const prevLine = lines[i].trim();
        const blockMatch = prevLine.match(
          /^([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/
        );

        if (blockMatch) {
          blockType = blockMatch[1];
          blockName = blockMatch[2];
          break;
        }

        // Exit if we hit a block end
        if (prevLine === "}") break;
      }

      if (blockType) {
        // Custom property documentation based on context
        const propertyDocs: { [key: string]: { [key: string]: string } } = {
          dimension: {
            type: "The data type for this dimension.\n\n```lookml\ntype: string # or number, date, etc.\n```",
            sql: "The SQL expression that generates the values for this dimension.\n\n```lookml\nsql: ${TABLE}.field ;;\n```",
            primary_key:
              "Designates this dimension as the primary key for the view.\n\n```lookml\nprimary_key: yes\n```",
            hidden:
              "Hides this dimension from the field picker.\n\n```lookml\nhidden: yes\n```",
          },
          measure: {
            type: "The aggregation type for this measure.\n\n```lookml\ntype: sum # or count, avg, etc.\n```",
            sql: "The SQL expression to aggregate for this measure.\n\n```lookml\nsql: ${TABLE}.amount ;;\n```",
            drill_fields:
              "Fields to show when drilling into this measure.\n\n```lookml\ndrill_fields: [field1, field2]\n```",
            hidden:
              "Hides this measure from the field picker.\n\n```lookml\nhidden: yes\n```",
          },
          join: {
            relationship:
              "Defines the cardinality between the two views.\n\n```lookml\nrelationship: many_to_one # or one_to_many, etc.\n```",
            sql_on:
              "The SQL expression that defines the join condition.\n\n```lookml\nsql_on: ${view_one.id} = ${view_two.id} ;;\n```",
            type: "The join type to use.\n\n```lookml\ntype: left_outer # or inner, full_outer, etc.\n```",
          },
        };

        if (propertyDocs[blockType] && propertyDocs[blockType][word]) {
          return {
            contents: {
              kind: MarkupKind.Markdown,
              value: `**${word}** (Property in ${blockType})\n\n${propertyDocs[blockType][word]}`,
            },
          };
        } else {
          // Generic property documentation if specific one isn't available
          return {
            contents: {
              kind: MarkupKind.Markdown,
              value: `**${word}** (Property)\n\nA property used in ${blockType} blocks.`,
            },
          };
        }
      }
    }

    return null;
  }
}
