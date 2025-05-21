import { CompletionItem, CompletionItemKind } from "vscode-languageserver/node";
import { CompletionContext } from "./context-detector";
import { WorkspaceModel } from "../../models/workspace";


export class PropertyCompletionProvider {
  private workspaceModel: WorkspaceModel;

  // Common property patterns for different block types
  private readonly commonProperties: { [key: string]: string[] } = {
    view: [
      "sql_table_name",
      "extends",
      "derived_table",
      "label",
      "description",
      "drill_fields",
      "required_access_grants",
    ],
    dimension: [
      "type",
      "sql",
      "label",
      "group_label", 
      "description",
      "hidden",
      "primary_key",
      "value_format",
      "html",
      "required_access_grants",
    ],
    dimension_group: [
      "type",
      "sql",
      "timeframes",
      "label",
      "description",
      "hidden",
      "convert_tz",
      "datatype",
    ],
    measure: [
      "type",
      "sql",
      "label",
      "group_label",
      "description",
      "hidden",
      "value_format",
      "drill_fields",
      "html",
      "filters",
    ],
    explore: [
      "view_name",
      "from",
      "join",
      "label",
      "description",
      "hidden",
      "always_filter",
      "conditionally_filter",
      "fields",
    ],
    join: [
      "type",
      "relationship",
      "sql_on",
      "from",
      "view_name",
      "fields",
      "required_joins",
    ],
    parameter: [
      "type",
      "default_value",
      "allowed_values",
      "label",
      "description",
      "hidden",
    ],
    filter: ["type", "sql", "default_value", "label", "description", "hidden"],
    model: [
      "connection",
      "include",
      "fiscal_month_offset",
      "week_start_day",
      "case_sensitive",
      "explore",
    ],
  };

  // Type completions for different block types
  private readonly dimensionTypes = [
    "string",
    "number",
    "date",
    "time",
    "datetime",
    "yesno",
    "tier",
    "zipcode",
  ];

  private readonly measureTypes = [
    "count",
    "count_distinct",
    "sum",
    "average",
    "max",
    "min",
    "median",
    "number",
  ];

  // Relationships for join blocks
  private readonly joinRelationships = [
    "one_to_one",
    "many_to_one",
    "one_to_many",
    "many_to_many",
  ];

  // Join types
  private readonly joinTypes = ["left_outer", "full_outer", "inner", "cross"];

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

  /**
   * Get completions for properties and property values
   */
  public getCompletions(context: CompletionContext): CompletionItem[] {
    if (context.type === "property") {
      return this.getPropertyCompletions(context.blockType);
    }

    if (context.type === "type" || (context.type === "value" && context.propertyName === "type")) {
      return this.getTypeCompletions(context.blockType);
    }

    if (context.type === "value") {
      return this.getPropertyValueCompletions(context);
    }

    

    return [];
  }

  /**
   * Get property completions based on the current block type
   */
  private getPropertyCompletions(
    blockType: string | undefined
  ): CompletionItem[] {
    if (blockType && this.commonProperties[blockType]) {
      return this.commonProperties[blockType].map((prop) => ({
        label: prop,
        kind: CompletionItemKind.Property,
        insertText: `${prop}`,
        data: { type: "property", blockType },
      }));
    }

    // Default properties
    return [
      {
        label: "label",
        kind: CompletionItemKind.Property,
        insertText: 'label: "',
        data: { type: "property" },
      },
      {
        label: "group_label",
        kind: CompletionItemKind.Property,
        insertText: 'group_label: "',
        data: { type: "property" },
      },
      {
        label: "description",
        kind: CompletionItemKind.Property,
        insertText: 'description: "',
        data: { type: "property" },
      },
      {
        label: "hidden",
        kind: CompletionItemKind.Property,
        insertText: "hidden: yes",
        data: { type: "property" },
      },
    ];
  }

  /**
   * Get type completions based on the current block type
   */
  private getTypeCompletions(blockType: string | undefined): CompletionItem[] {
    if (
      blockType === "dimension" ||
      blockType === "filter" ||
      blockType === "parameter"
    ) {
      return this.dimensionTypes.map((type) => ({
        label: type,
        kind: CompletionItemKind.TypeParameter,
        data: { type: "type" },
      }));
    }
    
    if (blockType === "measure") {
      return this.measureTypes.map((type) => ({
        label: type,
        kind: CompletionItemKind.TypeParameter,
        data: { type: "type" },
      }));
    }
    
    if (blockType === "dimension_group") {
      return [
        {
          label: "time",
          kind: CompletionItemKind.TypeParameter,
          data: { type: "type" },
          documentation: "Creates a set of time-based dimensions",
        },
      ];
    }
    
    if (blockType === "join") {
      return this.joinTypes.map((type) => ({
        label: ` ${type}`,
        kind: CompletionItemKind.EnumMember,
        data: { type: "join_type" },
      }));
    }

    // Default to all types
    return [...this.dimensionTypes, ...this.measureTypes].map((type) => ({
      label: type,
      kind: CompletionItemKind.TypeParameter,
      data: { type: "type" },
    }));
  }

  /**
   * Get completions for property values
   */
  public getPropertyValueCompletions(
    context: CompletionContext
  ): CompletionItem[] {
    if (!context.propertyName) return [];

    switch (context.propertyName) {
      case "hidden":
      case "primary_key":
        return ["yes", "no"].map((value) => ({
          label: value,
          kind: CompletionItemKind.EnumMember,
          data: { type: "property_value" },
        }));

      case "relationship":
        if (context.blockType === "join") {
          return this.joinRelationships.map((relationship) => ({
            label: ` ${relationship}`,
            kind: CompletionItemKind.EnumMember,
            data: { type: "relationship" },
          }));
        }
        break;

      case "timeframes":
        return ["raw", "time", "date", "week", "month", "quarter", "year"].map(
          (value) => ({
            label: value,
            kind: CompletionItemKind.EnumMember,
            data: { type: "timeframe" },
          })
        );
    }

    return [];
  }
}