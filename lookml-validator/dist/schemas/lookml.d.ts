import { z } from 'zod';
export declare const recursiveStringArray: z.ZodType<unknown>;
export declare const fieldProperties: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
}, "strip", z.ZodTypeAny, {
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
}, {
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
}>;
export declare const linkSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    label: z.ZodString;
    icon_url: z.ZodOptional<z.ZodString>;
    url: z.ZodString;
}, "strict", z.ZodTypeAny, {
    label: string;
    $type: string;
    url: string;
    $strings?: unknown;
    $name?: string | undefined;
    icon_url?: string | undefined;
}, {
    label: string;
    $type: string;
    url: string;
    $strings?: unknown;
    $name?: string | undefined;
    icon_url?: string | undefined;
}>;
export declare const dimensionValidTypes: readonly ["bin", "date", "date_time", "date_raw", "distance", "duration", "location", "number", "string", "tier", "time", "unquoted", "yesno", "zipcode", "duration_day", "duration_hour", "duration_minute", "duration_month", "duration_quarter", "duration_second", "duration_week", "duration_year"];
export declare const measureValidTypes: readonly ["average", "average_distinct", "count", "count_distinct", "date", "date_time", "list", "max", "median", "median_distinct", "min", "number", "percent_of_previous", "percent_of_total", "percentile", "percentile_distinct", "running_total", "period_over_period", "string", "sum", "sum_distinct", "yesno"];
export declare const parameterSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    type: z.ZodEnum<["string", "number", "unquoted", "date", "date_time", "yesno"]>;
    default_value: z.ZodOptional<z.ZodString>;
    allowed_value: z.ZodOptional<z.ZodArray<z.ZodObject<{
        label: z.ZodString;
        value: z.ZodString;
    }, "strip", z.ZodTypeAny, {
        label: string;
        value: string;
    }, {
        label: string;
        value: string;
    }>, "many">>;
    sql: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    type: "string" | "number" | "date" | "date_time" | "unquoted" | "yesno";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    default_value?: string | undefined;
    allowed_value?: {
        label: string;
        value: string;
    }[] | undefined;
}, {
    type: "string" | "number" | "date" | "date_time" | "unquoted" | "yesno";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    default_value?: string | undefined;
    allowed_value?: {
        label: string;
        value: string;
    }[] | undefined;
}>;
export declare const filterSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
    field: z.ZodOptional<z.ZodString>;
    value: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodString, z.objectOutputType<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
    field: z.ZodOptional<z.ZodString>;
    value: z.ZodOptional<z.ZodString>;
}, z.ZodString, "strict">, z.objectInputType<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
    field: z.ZodOptional<z.ZodString>;
    value: z.ZodOptional<z.ZodString>;
}, z.ZodString, "strict">>;
export declare const dimensionSchema: z.ZodEffects<z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    action: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
        label: z.ZodString;
        url: z.ZodString;
        icon_url: z.ZodOptional<z.ZodString>;
        param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, "many">]>>;
        form_param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, "many">]>>;
    }, "strip", z.ZodTypeAny, {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }, {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }>, z.ZodArray<z.ZodObject<{
        label: z.ZodString;
        url: z.ZodString;
        icon_url: z.ZodOptional<z.ZodString>;
        param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, "many">]>>;
        form_param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            value: z.ZodOptional<z.ZodString>;
            required: z.ZodOptional<z.ZodBoolean>;
            default: z.ZodOptional<z.ZodString>;
            type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
            option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }, {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }>, "many">]>>;
    }, "strip", z.ZodTypeAny, {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }, {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }>, "many">]>>;
    case: z.ZodOptional<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        when: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            label: z.ZodString;
            sql: z.ZodString;
        }, "strip", z.ZodTypeAny, {
            label: string;
            sql: string;
        }, {
            label: string;
            sql: string;
        }>, z.ZodArray<z.ZodObject<{
            label: z.ZodString;
            sql: z.ZodString;
        }, "strip", z.ZodTypeAny, {
            label: string;
            sql: string;
        }, {
            label: string;
            sql: string;
        }>, "many">]>>;
        else: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodObject<{
            label: z.ZodString;
        }, "strip", z.ZodTypeAny, {
            label: string;
        }, {
            label: string;
        }>]>>;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        $strings?: unknown;
        $name?: string | undefined;
        when?: {
            label: string;
            sql: string;
        } | {
            label: string;
            sql: string;
        }[] | undefined;
        else?: string | {
            label: string;
        } | undefined;
    }, {
        $type: string;
        $strings?: unknown;
        $name?: string | undefined;
        when?: {
            label: string;
            sql: string;
        } | {
            label: string;
            sql: string;
        }[] | undefined;
        else?: string | {
            label: string;
        } | undefined;
    }>>;
    drill_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    link: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        label: z.ZodString;
        icon_url: z.ZodOptional<z.ZodString>;
        url: z.ZodString;
    }, "strict", z.ZodTypeAny, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }>, z.ZodArray<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        label: z.ZodString;
        icon_url: z.ZodOptional<z.ZodString>;
        url: z.ZodString;
    }, "strict", z.ZodTypeAny, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }>, "many">]>>;
    map_layer_name: z.ZodOptional<z.ZodString>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_end: z.ZodOptional<z.ZodString>;
    sql_latitude: z.ZodOptional<z.ZodString>;
    sql_longitude: z.ZodOptional<z.ZodString>;
    sql_start: z.ZodOptional<z.ZodString>;
    sql: z.ZodOptional<z.ZodString>;
    style: z.ZodOptional<z.ZodEnum<["integer", "float", "ordinal", "interval"]>>;
    tiers: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    type: z.ZodOptional<z.ZodEnum<["bin", "date", "date_time", "date_raw", "distance", "duration", "location", "number", "string", "tier", "time", "unquoted", "yesno", "zipcode", "duration_day", "duration_hour", "duration_minute", "duration_month", "duration_quarter", "duration_second", "duration_week", "duration_year"]>>;
    value_format: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: "integer" | "float" | "ordinal" | "interval" | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    action?: {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    } | {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }[] | undefined;
    case?: {
        $type: string;
        $strings?: unknown;
        $name?: string | undefined;
        when?: {
            label: string;
            sql: string;
        } | {
            label: string;
            sql: string;
        }[] | undefined;
        else?: string | {
            label: string;
        } | undefined;
    } | undefined;
    drill_fields?: string[] | undefined;
    link?: {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    } | {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }[] | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_latitude?: string | undefined;
    sql_longitude?: string | undefined;
    sql_start?: string | undefined;
    tiers?: string[] | undefined;
    value_format?: string | undefined;
}, {
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: "integer" | "float" | "ordinal" | "interval" | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    action?: {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    } | {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }[] | undefined;
    case?: {
        $type: string;
        $strings?: unknown;
        $name?: string | undefined;
        when?: {
            label: string;
            sql: string;
        } | {
            label: string;
            sql: string;
        }[] | undefined;
        else?: string | {
            label: string;
        } | undefined;
    } | undefined;
    drill_fields?: string[] | undefined;
    link?: {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    } | {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }[] | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_latitude?: string | undefined;
    sql_longitude?: string | undefined;
    sql_start?: string | undefined;
    tiers?: string[] | undefined;
    value_format?: string | undefined;
}>, {
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: "integer" | "float" | "ordinal" | "interval" | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    action?: {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    } | {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }[] | undefined;
    case?: {
        $type: string;
        $strings?: unknown;
        $name?: string | undefined;
        when?: {
            label: string;
            sql: string;
        } | {
            label: string;
            sql: string;
        }[] | undefined;
        else?: string | {
            label: string;
        } | undefined;
    } | undefined;
    drill_fields?: string[] | undefined;
    link?: {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    } | {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }[] | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_latitude?: string | undefined;
    sql_longitude?: string | undefined;
    sql_start?: string | undefined;
    tiers?: string[] | undefined;
    value_format?: string | undefined;
}, {
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: "integer" | "float" | "ordinal" | "interval" | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    action?: {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    } | {
        label: string;
        url: string;
        icon_url?: string | undefined;
        param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
        form_param?: {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        } | {
            name: string;
            value?: string | undefined;
            type?: "textarea" | "select" | undefined;
            required?: boolean | undefined;
            default?: string | undefined;
            option?: {
                name: string;
            } | {
                name: string;
            }[] | undefined;
        }[] | undefined;
    }[] | undefined;
    case?: {
        $type: string;
        $strings?: unknown;
        $name?: string | undefined;
        when?: {
            label: string;
            sql: string;
        } | {
            label: string;
            sql: string;
        }[] | undefined;
        else?: string | {
            label: string;
        } | undefined;
    } | undefined;
    drill_fields?: string[] | undefined;
    link?: {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    } | {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }[] | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_latitude?: string | undefined;
    sql_longitude?: string | undefined;
    sql_start?: string | undefined;
    tiers?: string[] | undefined;
    value_format?: string | undefined;
}>;
export declare const dimensionGroupSchema: z.ZodEffects<z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    type: z.ZodEnum<["time", "duration"]>;
    sql: z.ZodOptional<z.ZodString>;
    timeframes: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    datatype: z.ZodOptional<z.ZodEnum<["date", "datetime", "unixtime"]>>;
    convert_tz: z.ZodOptional<z.ZodBoolean>;
    sql_start: z.ZodOptional<z.ZodString>;
    sql_end: z.ZodOptional<z.ZodString>;
    intervals: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    string_datatype: z.ZodOptional<z.ZodString>;
    units: z.ZodOptional<z.ZodEnum<["feet", "kilometers", "meters", "miles", "nautical_miles", "yards"]>>;
    value_format: z.ZodOptional<z.ZodString>;
    allow_fill: z.ZodOptional<z.ZodBoolean>;
    map_layer_name: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    type: "time" | "duration";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_start?: string | undefined;
    value_format?: string | undefined;
    timeframes?: string[] | undefined;
    datatype?: "date" | "datetime" | "unixtime" | undefined;
    convert_tz?: boolean | undefined;
    intervals?: string[] | undefined;
    string_datatype?: string | undefined;
    units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
    allow_fill?: boolean | undefined;
}, {
    type: "time" | "duration";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_start?: string | undefined;
    value_format?: string | undefined;
    timeframes?: string[] | undefined;
    datatype?: "date" | "datetime" | "unixtime" | undefined;
    convert_tz?: boolean | undefined;
    intervals?: string[] | undefined;
    string_datatype?: string | undefined;
    units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
    allow_fill?: boolean | undefined;
}>, {
    type: "time" | "duration";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_start?: string | undefined;
    value_format?: string | undefined;
    timeframes?: string[] | undefined;
    datatype?: "date" | "datetime" | "unixtime" | undefined;
    convert_tz?: boolean | undefined;
    intervals?: string[] | undefined;
    string_datatype?: string | undefined;
    units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
    allow_fill?: boolean | undefined;
}, {
    type: "time" | "duration";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    sql?: string | undefined;
    map_layer_name?: string | undefined;
    sql_end?: string | undefined;
    sql_start?: string | undefined;
    value_format?: string | undefined;
    timeframes?: string[] | undefined;
    datatype?: "date" | "datetime" | "unixtime" | undefined;
    convert_tz?: boolean | undefined;
    intervals?: string[] | undefined;
    string_datatype?: string | undefined;
    units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
    allow_fill?: boolean | undefined;
}>;
export declare const measureSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    alpha_sort: z.ZodOptional<z.ZodBoolean>;
    allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
    approximate: z.ZodOptional<z.ZodBoolean>;
    approximate_threshold: z.ZodOptional<z.ZodNumber>;
    fanout_on: z.ZodOptional<z.ZodString>;
    precision: z.ZodOptional<z.ZodNumber>;
    primary_key: z.ZodOptional<z.ZodBoolean>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_distinct_key: z.ZodOptional<z.ZodString>;
    direction: z.ZodOptional<z.ZodString>;
    end_location_field: z.ZodOptional<z.ZodString>;
    list_field: z.ZodOptional<z.ZodString>;
    start_location_field: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    full_suggestions: z.ZodOptional<z.ZodBoolean>;
    group_item_label: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    html: z.ZodOptional<z.ZodString>;
    label_from_parameter: z.ZodOptional<z.ZodString>;
    label: z.ZodOptional<z.ZodString>;
    order_by_field: z.ZodOptional<z.ZodString>;
    required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    style: z.ZodOptional<z.ZodString>;
    suggest_dimension: z.ZodOptional<z.ZodString>;
    suggest_explore: z.ZodOptional<z.ZodString>;
    suggest_persist_for: z.ZodOptional<z.ZodString>;
    suggestable: z.ZodOptional<z.ZodBoolean>;
    suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    value_format_name: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
    can_filter: z.ZodOptional<z.ZodBoolean>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
    bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
} & {
    drill_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    filters: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodString, z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">, z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">>, z.ZodArray<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodString, z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">, z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">>, "many">]>>;
    link: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        label: z.ZodString;
        icon_url: z.ZodOptional<z.ZodString>;
        url: z.ZodString;
    }, "strict", z.ZodTypeAny, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }>, z.ZodArray<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        label: z.ZodString;
        icon_url: z.ZodOptional<z.ZodString>;
        url: z.ZodString;
    }, "strict", z.ZodTypeAny, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }, {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }>, "many">]>>;
    percentile: z.ZodOptional<z.ZodString>;
    sql: z.ZodOptional<z.ZodString>;
    type: z.ZodEnum<["average", "average_distinct", "count", "count_distinct", "date", "date_time", "list", "max", "median", "median_distinct", "min", "number", "percent_of_previous", "percent_of_total", "percentile", "percentile_distinct", "running_total", "period_over_period", "string", "sum", "sum_distinct", "yesno"]>;
    value_format: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    type: "string" | "number" | "date" | "date_time" | "yesno" | "average" | "average_distinct" | "count" | "count_distinct" | "list" | "max" | "median" | "median_distinct" | "min" | "percent_of_previous" | "percent_of_total" | "percentile" | "percentile_distinct" | "running_total" | "period_over_period" | "sum" | "sum_distinct";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    percentile?: string | undefined;
    sql?: string | undefined;
    drill_fields?: string[] | undefined;
    link?: {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    } | {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }[] | undefined;
    value_format?: string | undefined;
    filters?: z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict"> | z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">[] | undefined;
}, {
    type: "string" | "number" | "date" | "date_time" | "yesno" | "average" | "average_distinct" | "count" | "count_distinct" | "list" | "max" | "median" | "median_distinct" | "min" | "percent_of_previous" | "percent_of_total" | "percentile" | "percentile_distinct" | "running_total" | "period_over_period" | "sum" | "sum_distinct";
    $type: string;
    label?: string | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    alias?: string[] | undefined;
    alpha_sort?: boolean | undefined;
    allow_approximate_optimization?: boolean | undefined;
    approximate?: boolean | undefined;
    approximate_threshold?: number | undefined;
    fanout_on?: string | undefined;
    precision?: number | undefined;
    primary_key?: boolean | undefined;
    required_access_grants?: string[] | undefined;
    sql_distinct_key?: string | undefined;
    direction?: string | undefined;
    end_location_field?: string | undefined;
    list_field?: string | undefined;
    start_location_field?: string | undefined;
    description?: string | undefined;
    full_suggestions?: boolean | undefined;
    group_item_label?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    html?: string | undefined;
    label_from_parameter?: string | undefined;
    order_by_field?: string | undefined;
    required_fields?: string[] | undefined;
    style?: string | undefined;
    suggest_dimension?: string | undefined;
    suggest_explore?: string | undefined;
    suggest_persist_for?: string | undefined;
    suggestable?: boolean | undefined;
    suggestions?: string | string[] | undefined;
    value_format_name?: string | undefined;
    view_label?: string | undefined;
    can_filter?: boolean | undefined;
    case_sensitive?: boolean | undefined;
    skip_drill_filter?: boolean | undefined;
    bypass_suggest_restrictions?: boolean | undefined;
    percentile?: string | undefined;
    sql?: string | undefined;
    drill_fields?: string[] | undefined;
    link?: {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    } | {
        label: string;
        $type: string;
        url: string;
        $strings?: unknown;
        $name?: string | undefined;
        icon_url?: string | undefined;
    }[] | undefined;
    value_format?: string | undefined;
    filters?: z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict"> | z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">[] | undefined;
}>;
export declare const setSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    fields: z.ZodArray<z.ZodString, "many">;
}, "strict", z.ZodTypeAny, {
    $type: string;
    fields: string[];
    $strings?: unknown;
    $name?: string | undefined;
}, {
    $type: string;
    fields: string[];
    $strings?: unknown;
    $name?: string | undefined;
}>;
export declare const joinSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    foreign_key: z.ZodOptional<z.ZodString>;
    from: z.ZodOptional<z.ZodString>;
    outer_only: z.ZodOptional<z.ZodBoolean>;
    relationship: z.ZodOptional<z.ZodEnum<["one_to_one", "one_to_many", "many_to_one", "many_to_many"]>>;
    required_joins: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_having: z.ZodOptional<z.ZodString>;
    sql_on: z.ZodOptional<z.ZodString>;
    sql_where: z.ZodOptional<z.ZodString>;
    sql: z.ZodOptional<z.ZodString>;
    type: z.ZodOptional<z.ZodEnum<["left_outer", "inner", "full_outer", "cross"]>>;
    view_label: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    $type: string;
    from?: string | undefined;
    sql_on?: string | undefined;
    relationship?: "one_to_one" | "one_to_many" | "many_to_one" | "many_to_many" | undefined;
    $strings?: unknown;
    type?: "left_outer" | "inner" | "full_outer" | "cross" | undefined;
    $name?: string | undefined;
    view_label?: string | undefined;
    sql?: string | undefined;
    fields?: string[] | undefined;
    foreign_key?: string | undefined;
    outer_only?: boolean | undefined;
    required_joins?: string[] | undefined;
    sql_having?: string | undefined;
    sql_where?: string | undefined;
}, {
    $type: string;
    from?: string | undefined;
    sql_on?: string | undefined;
    relationship?: "one_to_one" | "one_to_many" | "many_to_one" | "many_to_many" | undefined;
    $strings?: unknown;
    type?: "left_outer" | "inner" | "full_outer" | "cross" | undefined;
    $name?: string | undefined;
    view_label?: string | undefined;
    sql?: string | undefined;
    fields?: string[] | undefined;
    foreign_key?: string | undefined;
    outer_only?: boolean | undefined;
    required_joins?: string[] | undefined;
    sql_having?: string | undefined;
    sql_where?: string | undefined;
}>;
export declare const aggregateTableSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    query: z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        dimensions: z.ZodArray<z.ZodString, "many">;
        measures: z.ZodArray<z.ZodString, "many">;
        filters: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, "strict", z.ZodString, z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">, z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">>, z.ZodArray<z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, "strict", z.ZodString, z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">, z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">>, "many">]>>;
        timezone: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        dimensions: string[];
        measures: string[];
        $strings?: unknown;
        $name?: string | undefined;
        filters?: z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
        timezone?: string | undefined;
    }, {
        $type: string;
        dimensions: string[];
        measures: string[];
        $strings?: unknown;
        $name?: string | undefined;
        filters?: z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
        timezone?: string | undefined;
    }>;
    materialization: z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        datagroup_trigger: z.ZodString;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        datagroup_trigger: string;
        $strings?: unknown;
        $name?: string | undefined;
    }, {
        $type: string;
        datagroup_trigger: string;
        $strings?: unknown;
        $name?: string | undefined;
    }>;
}, "strict", z.ZodTypeAny, {
    $type: string;
    query: {
        $type: string;
        dimensions: string[];
        measures: string[];
        $strings?: unknown;
        $name?: string | undefined;
        filters?: z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
        timezone?: string | undefined;
    };
    materialization: {
        $type: string;
        datagroup_trigger: string;
        $strings?: unknown;
        $name?: string | undefined;
    };
    $strings?: unknown;
    $name?: string | undefined;
}, {
    $type: string;
    query: {
        $type: string;
        dimensions: string[];
        measures: string[];
        $strings?: unknown;
        $name?: string | undefined;
        filters?: z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
        timezone?: string | undefined;
    };
    materialization: {
        $type: string;
        datagroup_trigger: string;
        $strings?: unknown;
        $name?: string | undefined;
    };
    $strings?: unknown;
    $name?: string | undefined;
}>;
export declare const exploreSchema: z.ZodObject<{
    $name: z.ZodOptional<z.ZodString>;
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    extension: z.ZodOptional<z.ZodBoolean>;
    extends: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    description: z.ZodOptional<z.ZodString>;
    group_label: z.ZodOptional<z.ZodString>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    label: z.ZodOptional<z.ZodString>;
    query: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodUnknown>>;
    view_label: z.ZodOptional<z.ZodString>;
    access_filter: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
        field: z.ZodString;
        user_attribute: z.ZodString;
    }, "strip", z.ZodTypeAny, {
        field: string;
        user_attribute: string;
    }, {
        field: string;
        user_attribute: string;
    }>, z.ZodArray<z.ZodObject<{
        field: z.ZodString;
        user_attribute: z.ZodString;
    }, "strip", z.ZodTypeAny, {
        field: string;
        user_attribute: string;
    }, {
        field: string;
        user_attribute: string;
    }>, "many">]>>;
    always_filter: z.ZodOptional<z.ZodObject<{
        filters: z.ZodRecord<z.ZodString, z.ZodString>;
    }, "strip", z.ZodTypeAny, {
        filters: Record<string, string>;
    }, {
        filters: Record<string, string>;
    }>>;
    conditionally_filter: z.ZodOptional<z.ZodObject<{
        filters: z.ZodRecord<z.ZodString, z.ZodString>;
        unless: z.ZodArray<z.ZodString, "many">;
    }, "strip", z.ZodTypeAny, {
        filters: Record<string, string>;
        unless: string[];
    }, {
        filters: Record<string, string>;
        unless: string[];
    }>>;
    case_sensitive: z.ZodOptional<z.ZodBoolean>;
    sql_always_having: z.ZodOptional<z.ZodString>;
    sql_always_where: z.ZodOptional<z.ZodString>;
    always_join: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    join: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        foreign_key: z.ZodOptional<z.ZodString>;
        from: z.ZodOptional<z.ZodString>;
        outer_only: z.ZodOptional<z.ZodBoolean>;
        relationship: z.ZodOptional<z.ZodEnum<["one_to_one", "one_to_many", "many_to_one", "many_to_many"]>>;
        required_joins: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_having: z.ZodOptional<z.ZodString>;
        sql_on: z.ZodOptional<z.ZodString>;
        sql_where: z.ZodOptional<z.ZodString>;
        sql: z.ZodOptional<z.ZodString>;
        type: z.ZodOptional<z.ZodEnum<["left_outer", "inner", "full_outer", "cross"]>>;
        view_label: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        from?: string | undefined;
        sql_on?: string | undefined;
        relationship?: "one_to_one" | "one_to_many" | "many_to_one" | "many_to_many" | undefined;
        $strings?: unknown;
        type?: "left_outer" | "inner" | "full_outer" | "cross" | undefined;
        $name?: string | undefined;
        view_label?: string | undefined;
        sql?: string | undefined;
        fields?: string[] | undefined;
        foreign_key?: string | undefined;
        outer_only?: boolean | undefined;
        required_joins?: string[] | undefined;
        sql_having?: string | undefined;
        sql_where?: string | undefined;
    }, {
        $type: string;
        from?: string | undefined;
        sql_on?: string | undefined;
        relationship?: "one_to_one" | "one_to_many" | "many_to_one" | "many_to_many" | undefined;
        $strings?: unknown;
        type?: "left_outer" | "inner" | "full_outer" | "cross" | undefined;
        $name?: string | undefined;
        view_label?: string | undefined;
        sql?: string | undefined;
        fields?: string[] | undefined;
        foreign_key?: string | undefined;
        outer_only?: boolean | undefined;
        required_joins?: string[] | undefined;
        sql_having?: string | undefined;
        sql_where?: string | undefined;
    }>>>;
    cancel_grouping_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    from: z.ZodOptional<z.ZodString>;
    persist_for: z.ZodOptional<z.ZodString>;
    persist_with: z.ZodOptional<z.ZodString>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql_table_name: z.ZodOptional<z.ZodString>;
    symmetric_aggregates: z.ZodOptional<z.ZodBoolean>;
    view_name: z.ZodOptional<z.ZodString>;
    aggregate_table: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        query: z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            dimensions: z.ZodArray<z.ZodString, "many">;
            measures: z.ZodArray<z.ZodString, "many">;
            filters: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, "strict", z.ZodString, z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">, z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">>, z.ZodArray<z.ZodObject<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, "strict", z.ZodString, z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">, z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">>, "many">]>>;
            timezone: z.ZodOptional<z.ZodString>;
        }, "strict", z.ZodTypeAny, {
            $type: string;
            dimensions: string[];
            measures: string[];
            $strings?: unknown;
            $name?: string | undefined;
            filters?: z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict"> | z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">[] | undefined;
            timezone?: string | undefined;
        }, {
            $type: string;
            dimensions: string[];
            measures: string[];
            $strings?: unknown;
            $name?: string | undefined;
            filters?: z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict"> | z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">[] | undefined;
            timezone?: string | undefined;
        }>;
        materialization: z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            datagroup_trigger: z.ZodString;
        }, "strict", z.ZodTypeAny, {
            $type: string;
            datagroup_trigger: string;
            $strings?: unknown;
            $name?: string | undefined;
        }, {
            $type: string;
            datagroup_trigger: string;
            $strings?: unknown;
            $name?: string | undefined;
        }>;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        query: {
            $type: string;
            dimensions: string[];
            measures: string[];
            $strings?: unknown;
            $name?: string | undefined;
            filters?: z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict"> | z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">[] | undefined;
            timezone?: string | undefined;
        };
        materialization: {
            $type: string;
            datagroup_trigger: string;
            $strings?: unknown;
            $name?: string | undefined;
        };
        $strings?: unknown;
        $name?: string | undefined;
    }, {
        $type: string;
        query: {
            $type: string;
            dimensions: string[];
            measures: string[];
            $strings?: unknown;
            $name?: string | undefined;
            filters?: z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict"> | z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">[] | undefined;
            timezone?: string | undefined;
        };
        materialization: {
            $type: string;
            datagroup_trigger: string;
            $strings?: unknown;
            $name?: string | undefined;
        };
        $strings?: unknown;
        $name?: string | undefined;
    }>>>;
}, "strict", z.ZodTypeAny, {
    $type: string;
    join?: Record<string, {
        $type: string;
        from?: string | undefined;
        sql_on?: string | undefined;
        relationship?: "one_to_one" | "one_to_many" | "many_to_one" | "many_to_many" | undefined;
        $strings?: unknown;
        type?: "left_outer" | "inner" | "full_outer" | "cross" | undefined;
        $name?: string | undefined;
        view_label?: string | undefined;
        sql?: string | undefined;
        fields?: string[] | undefined;
        foreign_key?: string | undefined;
        outer_only?: boolean | undefined;
        required_joins?: string[] | undefined;
        sql_having?: string | undefined;
        sql_where?: string | undefined;
    }> | undefined;
    extends?: string[] | undefined;
    view_name?: string | undefined;
    from?: string | undefined;
    label?: string | undefined;
    extension?: boolean | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    required_access_grants?: string[] | undefined;
    description?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    view_label?: string | undefined;
    case_sensitive?: boolean | undefined;
    fields?: string[] | undefined;
    query?: Record<string, unknown> | undefined;
    access_filter?: {
        field: string;
        user_attribute: string;
    } | {
        field: string;
        user_attribute: string;
    }[] | undefined;
    always_filter?: {
        filters: Record<string, string>;
    } | undefined;
    conditionally_filter?: {
        filters: Record<string, string>;
        unless: string[];
    } | undefined;
    sql_always_having?: string | undefined;
    sql_always_where?: string | undefined;
    always_join?: string[] | undefined;
    cancel_grouping_fields?: string[] | undefined;
    persist_for?: string | undefined;
    persist_with?: string | undefined;
    sql_table_name?: string | undefined;
    symmetric_aggregates?: boolean | undefined;
    aggregate_table?: Record<string, {
        $type: string;
        query: {
            $type: string;
            dimensions: string[];
            measures: string[];
            $strings?: unknown;
            $name?: string | undefined;
            filters?: z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict"> | z.objectOutputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">[] | undefined;
            timezone?: string | undefined;
        };
        materialization: {
            $type: string;
            datagroup_trigger: string;
            $strings?: unknown;
            $name?: string | undefined;
        };
        $strings?: unknown;
        $name?: string | undefined;
    }> | undefined;
}, {
    $type: string;
    join?: Record<string, {
        $type: string;
        from?: string | undefined;
        sql_on?: string | undefined;
        relationship?: "one_to_one" | "one_to_many" | "many_to_one" | "many_to_many" | undefined;
        $strings?: unknown;
        type?: "left_outer" | "inner" | "full_outer" | "cross" | undefined;
        $name?: string | undefined;
        view_label?: string | undefined;
        sql?: string | undefined;
        fields?: string[] | undefined;
        foreign_key?: string | undefined;
        outer_only?: boolean | undefined;
        required_joins?: string[] | undefined;
        sql_having?: string | undefined;
        sql_where?: string | undefined;
    }> | undefined;
    extends?: string[] | undefined;
    view_name?: string | undefined;
    from?: string | undefined;
    label?: string | undefined;
    extension?: boolean | undefined;
    tags?: string[] | undefined;
    $strings?: unknown;
    $name?: string | undefined;
    required_access_grants?: string[] | undefined;
    description?: string | undefined;
    group_label?: string | undefined;
    hidden?: boolean | undefined;
    view_label?: string | undefined;
    case_sensitive?: boolean | undefined;
    fields?: string[] | undefined;
    query?: Record<string, unknown> | undefined;
    access_filter?: {
        field: string;
        user_attribute: string;
    } | {
        field: string;
        user_attribute: string;
    }[] | undefined;
    always_filter?: {
        filters: Record<string, string>;
    } | undefined;
    conditionally_filter?: {
        filters: Record<string, string>;
        unless: string[];
    } | undefined;
    sql_always_having?: string | undefined;
    sql_always_where?: string | undefined;
    always_join?: string[] | undefined;
    cancel_grouping_fields?: string[] | undefined;
    persist_for?: string | undefined;
    persist_with?: string | undefined;
    sql_table_name?: string | undefined;
    symmetric_aggregates?: boolean | undefined;
    aggregate_table?: Record<string, {
        $type: string;
        query: {
            $type: string;
            dimensions: string[];
            measures: string[];
            $strings?: unknown;
            $name?: string | undefined;
            filters?: z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict"> | z.objectInputType<{
                $name: z.ZodOptional<z.ZodString>;
                $type: z.ZodString;
                $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
            } & {
                alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                alpha_sort: z.ZodOptional<z.ZodBoolean>;
                allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
                approximate: z.ZodOptional<z.ZodBoolean>;
                approximate_threshold: z.ZodOptional<z.ZodNumber>;
                fanout_on: z.ZodOptional<z.ZodString>;
                precision: z.ZodOptional<z.ZodNumber>;
                primary_key: z.ZodOptional<z.ZodBoolean>;
                required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                sql_distinct_key: z.ZodOptional<z.ZodString>;
                direction: z.ZodOptional<z.ZodString>;
                end_location_field: z.ZodOptional<z.ZodString>;
                list_field: z.ZodOptional<z.ZodString>;
                start_location_field: z.ZodOptional<z.ZodString>;
                description: z.ZodOptional<z.ZodString>;
                full_suggestions: z.ZodOptional<z.ZodBoolean>;
                group_item_label: z.ZodOptional<z.ZodString>;
                group_label: z.ZodOptional<z.ZodString>;
                hidden: z.ZodOptional<z.ZodBoolean>;
                html: z.ZodOptional<z.ZodString>;
                label_from_parameter: z.ZodOptional<z.ZodString>;
                label: z.ZodOptional<z.ZodString>;
                order_by_field: z.ZodOptional<z.ZodString>;
                required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                style: z.ZodOptional<z.ZodString>;
                suggest_dimension: z.ZodOptional<z.ZodString>;
                suggest_explore: z.ZodOptional<z.ZodString>;
                suggest_persist_for: z.ZodOptional<z.ZodString>;
                suggestable: z.ZodOptional<z.ZodBoolean>;
                suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
                tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
                value_format_name: z.ZodOptional<z.ZodString>;
                view_label: z.ZodOptional<z.ZodString>;
                can_filter: z.ZodOptional<z.ZodBoolean>;
                case_sensitive: z.ZodOptional<z.ZodBoolean>;
                skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
                bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
            } & {
                type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
                field: z.ZodOptional<z.ZodString>;
                value: z.ZodOptional<z.ZodString>;
            }, z.ZodString, "strict">[] | undefined;
            timezone?: string | undefined;
        };
        materialization: {
            $type: string;
            datagroup_trigger: string;
            $strings?: unknown;
            $name?: string | undefined;
        };
        $strings?: unknown;
        $name?: string | undefined;
    }> | undefined;
}>;
export declare const derivedTableSchema: z.ZodOptional<z.ZodObject<{
    cluster_keys: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    create_process: z.ZodOptional<z.ZodObject<{
        sql_step: z.ZodOptional<z.ZodString>;
    }, "strip", z.ZodTypeAny, {
        sql_step?: string | undefined;
    }, {
        sql_step?: string | undefined;
    }>>;
    datagroup_trigger: z.ZodOptional<z.ZodString>;
    distribution: z.ZodOptional<z.ZodString>;
    distribution_style: z.ZodOptional<z.ZodString>;
    explore_source: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodObject<{}, "strip", z.ZodTypeAny, {}, {}>]>>;
    increment_key: z.ZodOptional<z.ZodString>;
    increment_offset: z.ZodOptional<z.ZodNumber>;
    indexes: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    interval_trigger: z.ZodOptional<z.ZodString>;
    materialized_view: z.ZodOptional<z.ZodBoolean>;
    partition_keys: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    persist_for: z.ZodOptional<z.ZodString>;
    publish_as_db_view: z.ZodOptional<z.ZodBoolean>;
    sortkeys: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    sql: z.ZodOptional<z.ZodString>;
    sql_create: z.ZodOptional<z.ZodObject<{
        sql: z.ZodOptional<z.ZodString>;
    }, "strip", z.ZodTypeAny, {
        sql?: string | undefined;
    }, {
        sql?: string | undefined;
    }>>;
    sql_trigger_value: z.ZodOptional<z.ZodString>;
    table_compression: z.ZodOptional<z.ZodString>;
    table_format: z.ZodOptional<z.ZodString>;
}, "strip", z.ZodTypeAny, {
    sql?: string | undefined;
    datagroup_trigger?: string | undefined;
    persist_for?: string | undefined;
    cluster_keys?: string[] | undefined;
    create_process?: {
        sql_step?: string | undefined;
    } | undefined;
    distribution?: string | undefined;
    distribution_style?: string | undefined;
    explore_source?: string | {} | undefined;
    increment_key?: string | undefined;
    increment_offset?: number | undefined;
    indexes?: string[] | undefined;
    interval_trigger?: string | undefined;
    materialized_view?: boolean | undefined;
    partition_keys?: string[] | undefined;
    publish_as_db_view?: boolean | undefined;
    sortkeys?: string[] | undefined;
    sql_create?: {
        sql?: string | undefined;
    } | undefined;
    sql_trigger_value?: string | undefined;
    table_compression?: string | undefined;
    table_format?: string | undefined;
}, {
    sql?: string | undefined;
    datagroup_trigger?: string | undefined;
    persist_for?: string | undefined;
    cluster_keys?: string[] | undefined;
    create_process?: {
        sql_step?: string | undefined;
    } | undefined;
    distribution?: string | undefined;
    distribution_style?: string | undefined;
    explore_source?: string | {} | undefined;
    increment_key?: string | undefined;
    increment_offset?: number | undefined;
    indexes?: string[] | undefined;
    interval_trigger?: string | undefined;
    materialized_view?: boolean | undefined;
    partition_keys?: string[] | undefined;
    publish_as_db_view?: boolean | undefined;
    sortkeys?: string[] | undefined;
    sql_create?: {
        sql?: string | undefined;
    } | undefined;
    sql_trigger_value?: string | undefined;
    table_compression?: string | undefined;
    table_format?: string | undefined;
}>>;
export declare const LookMLView: z.ZodObject<{
    $type: z.ZodString;
    $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
} & {
    $name: z.ZodString;
    access_filter: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodObject<{
        $name: z.ZodString;
        field: z.ZodString;
        user_attribute: z.ZodString;
    }, "strip", z.ZodTypeAny, {
        field: string;
        $name: string;
        user_attribute: string;
    }, {
        field: string;
        $name: string;
        user_attribute: string;
    }>>>;
    derived_table: z.ZodOptional<z.ZodObject<{
        cluster_keys: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        create_process: z.ZodOptional<z.ZodObject<{
            sql_step: z.ZodOptional<z.ZodString>;
        }, "strip", z.ZodTypeAny, {
            sql_step?: string | undefined;
        }, {
            sql_step?: string | undefined;
        }>>;
        datagroup_trigger: z.ZodOptional<z.ZodString>;
        distribution: z.ZodOptional<z.ZodString>;
        distribution_style: z.ZodOptional<z.ZodString>;
        explore_source: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodObject<{}, "strip", z.ZodTypeAny, {}, {}>]>>;
        increment_key: z.ZodOptional<z.ZodString>;
        increment_offset: z.ZodOptional<z.ZodNumber>;
        indexes: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        interval_trigger: z.ZodOptional<z.ZodString>;
        materialized_view: z.ZodOptional<z.ZodBoolean>;
        partition_keys: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        persist_for: z.ZodOptional<z.ZodString>;
        publish_as_db_view: z.ZodOptional<z.ZodBoolean>;
        sortkeys: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql: z.ZodOptional<z.ZodString>;
        sql_create: z.ZodOptional<z.ZodObject<{
            sql: z.ZodOptional<z.ZodString>;
        }, "strip", z.ZodTypeAny, {
            sql?: string | undefined;
        }, {
            sql?: string | undefined;
        }>>;
        sql_trigger_value: z.ZodOptional<z.ZodString>;
        table_compression: z.ZodOptional<z.ZodString>;
        table_format: z.ZodOptional<z.ZodString>;
    }, "strip", z.ZodTypeAny, {
        sql?: string | undefined;
        datagroup_trigger?: string | undefined;
        persist_for?: string | undefined;
        cluster_keys?: string[] | undefined;
        create_process?: {
            sql_step?: string | undefined;
        } | undefined;
        distribution?: string | undefined;
        distribution_style?: string | undefined;
        explore_source?: string | {} | undefined;
        increment_key?: string | undefined;
        increment_offset?: number | undefined;
        indexes?: string[] | undefined;
        interval_trigger?: string | undefined;
        materialized_view?: boolean | undefined;
        partition_keys?: string[] | undefined;
        publish_as_db_view?: boolean | undefined;
        sortkeys?: string[] | undefined;
        sql_create?: {
            sql?: string | undefined;
        } | undefined;
        sql_trigger_value?: string | undefined;
        table_compression?: string | undefined;
        table_format?: string | undefined;
    }, {
        sql?: string | undefined;
        datagroup_trigger?: string | undefined;
        persist_for?: string | undefined;
        cluster_keys?: string[] | undefined;
        create_process?: {
            sql_step?: string | undefined;
        } | undefined;
        distribution?: string | undefined;
        distribution_style?: string | undefined;
        explore_source?: string | {} | undefined;
        increment_key?: string | undefined;
        increment_offset?: number | undefined;
        indexes?: string[] | undefined;
        interval_trigger?: string | undefined;
        materialized_view?: boolean | undefined;
        partition_keys?: string[] | undefined;
        publish_as_db_view?: boolean | undefined;
        sortkeys?: string[] | undefined;
        sql_create?: {
            sql?: string | undefined;
        } | undefined;
        sql_trigger_value?: string | undefined;
        table_compression?: string | undefined;
        table_format?: string | undefined;
    }>>;
    description: z.ZodOptional<z.ZodString>;
    dimension_group: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodEffects<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodEnum<["time", "duration"]>;
        sql: z.ZodOptional<z.ZodString>;
        timeframes: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        datatype: z.ZodOptional<z.ZodEnum<["date", "datetime", "unixtime"]>>;
        convert_tz: z.ZodOptional<z.ZodBoolean>;
        sql_start: z.ZodOptional<z.ZodString>;
        sql_end: z.ZodOptional<z.ZodString>;
        intervals: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        string_datatype: z.ZodOptional<z.ZodString>;
        units: z.ZodOptional<z.ZodEnum<["feet", "kilometers", "meters", "miles", "nautical_miles", "yards"]>>;
        value_format: z.ZodOptional<z.ZodString>;
        allow_fill: z.ZodOptional<z.ZodBoolean>;
        map_layer_name: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodTypeAny, {
        type: "time" | "duration";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_start?: string | undefined;
        value_format?: string | undefined;
        timeframes?: string[] | undefined;
        datatype?: "date" | "datetime" | "unixtime" | undefined;
        convert_tz?: boolean | undefined;
        intervals?: string[] | undefined;
        string_datatype?: string | undefined;
        units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
        allow_fill?: boolean | undefined;
    }, {
        type: "time" | "duration";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_start?: string | undefined;
        value_format?: string | undefined;
        timeframes?: string[] | undefined;
        datatype?: "date" | "datetime" | "unixtime" | undefined;
        convert_tz?: boolean | undefined;
        intervals?: string[] | undefined;
        string_datatype?: string | undefined;
        units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
        allow_fill?: boolean | undefined;
    }>, {
        type: "time" | "duration";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_start?: string | undefined;
        value_format?: string | undefined;
        timeframes?: string[] | undefined;
        datatype?: "date" | "datetime" | "unixtime" | undefined;
        convert_tz?: boolean | undefined;
        intervals?: string[] | undefined;
        string_datatype?: string | undefined;
        units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
        allow_fill?: boolean | undefined;
    }, {
        type: "time" | "duration";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_start?: string | undefined;
        value_format?: string | undefined;
        timeframes?: string[] | undefined;
        datatype?: "date" | "datetime" | "unixtime" | undefined;
        convert_tz?: boolean | undefined;
        intervals?: string[] | undefined;
        string_datatype?: string | undefined;
        units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
        allow_fill?: boolean | undefined;
    }>>>;
    dimension: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodEffects<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        action: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            label: z.ZodString;
            url: z.ZodString;
            icon_url: z.ZodOptional<z.ZodString>;
            param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, "many">]>>;
            form_param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }, {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }>, z.ZodArray<z.ZodObject<{
            label: z.ZodString;
            url: z.ZodString;
            icon_url: z.ZodOptional<z.ZodString>;
            param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, "many">]>>;
            form_param: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                value: z.ZodOptional<z.ZodString>;
                required: z.ZodOptional<z.ZodBoolean>;
                default: z.ZodOptional<z.ZodString>;
                type: z.ZodOptional<z.ZodEnum<["textarea", "select"]>>;
                option: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, z.ZodArray<z.ZodObject<{
                    name: z.ZodString;
                }, "strip", z.ZodTypeAny, {
                    name: string;
                }, {
                    name: string;
                }>, "many">]>>;
            }, "strip", z.ZodTypeAny, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }, {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }>, "many">]>>;
        }, "strip", z.ZodTypeAny, {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }, {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }>, "many">]>>;
        case: z.ZodOptional<z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            when: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
                label: z.ZodString;
                sql: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                label: string;
                sql: string;
            }, {
                label: string;
                sql: string;
            }>, z.ZodArray<z.ZodObject<{
                label: z.ZodString;
                sql: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                label: string;
                sql: string;
            }, {
                label: string;
                sql: string;
            }>, "many">]>>;
            else: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodObject<{
                label: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                label: string;
            }, {
                label: string;
            }>]>>;
        }, "strict", z.ZodTypeAny, {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        }, {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        }>>;
        drill_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        link: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            label: z.ZodString;
            icon_url: z.ZodOptional<z.ZodString>;
            url: z.ZodString;
        }, "strict", z.ZodTypeAny, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }>, z.ZodArray<z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            label: z.ZodString;
            icon_url: z.ZodOptional<z.ZodString>;
            url: z.ZodString;
        }, "strict", z.ZodTypeAny, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }>, "many">]>>;
        map_layer_name: z.ZodOptional<z.ZodString>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_end: z.ZodOptional<z.ZodString>;
        sql_latitude: z.ZodOptional<z.ZodString>;
        sql_longitude: z.ZodOptional<z.ZodString>;
        sql_start: z.ZodOptional<z.ZodString>;
        sql: z.ZodOptional<z.ZodString>;
        style: z.ZodOptional<z.ZodEnum<["integer", "float", "ordinal", "interval"]>>;
        tiers: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        type: z.ZodOptional<z.ZodEnum<["bin", "date", "date_time", "date_raw", "distance", "duration", "location", "number", "string", "tier", "time", "unquoted", "yesno", "zipcode", "duration_day", "duration_hour", "duration_minute", "duration_month", "duration_quarter", "duration_second", "duration_week", "duration_year"]>>;
        value_format: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: "integer" | "float" | "ordinal" | "interval" | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        action?: {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        } | {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }[] | undefined;
        case?: {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        } | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_latitude?: string | undefined;
        sql_longitude?: string | undefined;
        sql_start?: string | undefined;
        tiers?: string[] | undefined;
        value_format?: string | undefined;
    }, {
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: "integer" | "float" | "ordinal" | "interval" | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        action?: {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        } | {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }[] | undefined;
        case?: {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        } | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_latitude?: string | undefined;
        sql_longitude?: string | undefined;
        sql_start?: string | undefined;
        tiers?: string[] | undefined;
        value_format?: string | undefined;
    }>, {
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: "integer" | "float" | "ordinal" | "interval" | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        action?: {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        } | {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }[] | undefined;
        case?: {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        } | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_latitude?: string | undefined;
        sql_longitude?: string | undefined;
        sql_start?: string | undefined;
        tiers?: string[] | undefined;
        value_format?: string | undefined;
    }, {
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: "integer" | "float" | "ordinal" | "interval" | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        action?: {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        } | {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }[] | undefined;
        case?: {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        } | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_latitude?: string | undefined;
        sql_longitude?: string | undefined;
        sql_start?: string | undefined;
        tiers?: string[] | undefined;
        value_format?: string | undefined;
    }>>>;
    drill_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    extends_ref: z.ZodOptional<z.ZodString>;
    extends: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    extension: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodBoolean]>>;
    fields_hidden_by_default: z.ZodOptional<z.ZodBoolean>;
    filter: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodString, z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">, z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">>, z.ZodArray<z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodString, z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">, z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">>, "many">]>>;
    hidden: z.ZodOptional<z.ZodBoolean>;
    label: z.ZodOptional<z.ZodString>;
    measure: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        drill_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        filters: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, "strict", z.ZodString, z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">, z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">>, z.ZodArray<z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, "strict", z.ZodString, z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">, z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">>, "many">]>>;
        link: z.ZodOptional<z.ZodUnion<[z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            label: z.ZodString;
            icon_url: z.ZodOptional<z.ZodString>;
            url: z.ZodString;
        }, "strict", z.ZodTypeAny, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }>, z.ZodArray<z.ZodObject<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            label: z.ZodString;
            icon_url: z.ZodOptional<z.ZodString>;
            url: z.ZodString;
        }, "strict", z.ZodTypeAny, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }, {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }>, "many">]>>;
        percentile: z.ZodOptional<z.ZodString>;
        sql: z.ZodOptional<z.ZodString>;
        type: z.ZodEnum<["average", "average_distinct", "count", "count_distinct", "date", "date_time", "list", "max", "median", "median_distinct", "min", "number", "percent_of_previous", "percent_of_total", "percentile", "percentile_distinct", "running_total", "period_over_period", "string", "sum", "sum_distinct", "yesno"]>;
        value_format: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodTypeAny, {
        type: "string" | "number" | "date" | "date_time" | "yesno" | "average" | "average_distinct" | "count" | "count_distinct" | "list" | "max" | "median" | "median_distinct" | "min" | "percent_of_previous" | "percent_of_total" | "percentile" | "percentile_distinct" | "running_total" | "period_over_period" | "sum" | "sum_distinct";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        percentile?: string | undefined;
        sql?: string | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        value_format?: string | undefined;
        filters?: z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
    }, {
        type: "string" | "number" | "date" | "date_time" | "yesno" | "average" | "average_distinct" | "count" | "count_distinct" | "list" | "max" | "median" | "median_distinct" | "min" | "percent_of_previous" | "percent_of_total" | "percentile" | "percentile_distinct" | "running_total" | "period_over_period" | "sum" | "sum_distinct";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        percentile?: string | undefined;
        sql?: string | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        value_format?: string | undefined;
        filters?: z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
    }>>>;
    parameter: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodEnum<["string", "number", "unquoted", "date", "date_time", "yesno"]>;
        default_value: z.ZodOptional<z.ZodString>;
        allowed_value: z.ZodOptional<z.ZodArray<z.ZodObject<{
            label: z.ZodString;
            value: z.ZodString;
        }, "strip", z.ZodTypeAny, {
            label: string;
            value: string;
        }, {
            label: string;
            value: string;
        }>, "many">>;
        sql: z.ZodOptional<z.ZodString>;
    }, "strict", z.ZodTypeAny, {
        type: "string" | "number" | "date" | "date_time" | "unquoted" | "yesno";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        default_value?: string | undefined;
        allowed_value?: {
            label: string;
            value: string;
        }[] | undefined;
    }, {
        type: "string" | "number" | "date" | "date_time" | "unquoted" | "yesno";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        default_value?: string | undefined;
        allowed_value?: {
            label: string;
            value: string;
        }[] | undefined;
    }>>>;
    persist_for: z.ZodOptional<z.ZodString>;
    persist_with: z.ZodOptional<z.ZodString>;
    relationship: z.ZodOptional<z.ZodString>;
    required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
    required: z.ZodOptional<z.ZodBoolean>;
    set: z.ZodOptional<z.ZodRecord<z.ZodString, z.ZodObject<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        fields: z.ZodArray<z.ZodString, "many">;
    }, "strict", z.ZodTypeAny, {
        $type: string;
        fields: string[];
        $strings?: unknown;
        $name?: string | undefined;
    }, {
        $type: string;
        fields: string[];
        $strings?: unknown;
        $name?: string | undefined;
    }>>>;
    sql_always_having: z.ZodOptional<z.ZodString>;
    sql_always_where: z.ZodOptional<z.ZodString>;
    sql_on: z.ZodOptional<z.ZodString>;
    sql_table_name: z.ZodOptional<z.ZodString>;
    suggestions: z.ZodOptional<z.ZodBoolean>;
    timezone: z.ZodOptional<z.ZodString>;
    view_label: z.ZodOptional<z.ZodString>;
}, "strict", z.ZodTypeAny, {
    $name: string;
    $type: string;
    dimension?: Record<string, {
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: "integer" | "float" | "ordinal" | "interval" | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        action?: {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        } | {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }[] | undefined;
        case?: {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        } | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_latitude?: string | undefined;
        sql_longitude?: string | undefined;
        sql_start?: string | undefined;
        tiers?: string[] | undefined;
        value_format?: string | undefined;
    }> | undefined;
    measure?: Record<string, {
        type: "string" | "number" | "date" | "date_time" | "yesno" | "average" | "average_distinct" | "count" | "count_distinct" | "list" | "max" | "median" | "median_distinct" | "min" | "percent_of_previous" | "percent_of_total" | "percentile" | "percentile_distinct" | "running_total" | "period_over_period" | "sum" | "sum_distinct";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        percentile?: string | undefined;
        sql?: string | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        value_format?: string | undefined;
        filters?: z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectOutputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
    }> | undefined;
    parameter?: Record<string, {
        type: "string" | "number" | "date" | "date_time" | "unquoted" | "yesno";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        default_value?: string | undefined;
        allowed_value?: {
            label: string;
            value: string;
        }[] | undefined;
    }> | undefined;
    filter?: z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict"> | z.objectOutputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">[] | undefined;
    extends?: string[] | undefined;
    sql_on?: string | undefined;
    relationship?: string | undefined;
    label?: string | undefined;
    extension?: string | boolean | undefined;
    $strings?: unknown;
    dimension_group?: Record<string, {
        type: "time" | "duration";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_start?: string | undefined;
        value_format?: string | undefined;
        timeframes?: string[] | undefined;
        datatype?: "date" | "datetime" | "unixtime" | undefined;
        convert_tz?: boolean | undefined;
        intervals?: string[] | undefined;
        string_datatype?: string | undefined;
        units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
        allow_fill?: boolean | undefined;
    }> | undefined;
    set?: Record<string, {
        $type: string;
        fields: string[];
        $strings?: unknown;
        $name?: string | undefined;
    }> | undefined;
    required_access_grants?: string[] | undefined;
    description?: string | undefined;
    hidden?: boolean | undefined;
    suggestions?: boolean | undefined;
    view_label?: string | undefined;
    required?: boolean | undefined;
    drill_fields?: string[] | undefined;
    timezone?: string | undefined;
    access_filter?: Record<string, {
        field: string;
        $name: string;
        user_attribute: string;
    }> | undefined;
    sql_always_having?: string | undefined;
    sql_always_where?: string | undefined;
    persist_for?: string | undefined;
    persist_with?: string | undefined;
    sql_table_name?: string | undefined;
    derived_table?: {
        sql?: string | undefined;
        datagroup_trigger?: string | undefined;
        persist_for?: string | undefined;
        cluster_keys?: string[] | undefined;
        create_process?: {
            sql_step?: string | undefined;
        } | undefined;
        distribution?: string | undefined;
        distribution_style?: string | undefined;
        explore_source?: string | {} | undefined;
        increment_key?: string | undefined;
        increment_offset?: number | undefined;
        indexes?: string[] | undefined;
        interval_trigger?: string | undefined;
        materialized_view?: boolean | undefined;
        partition_keys?: string[] | undefined;
        publish_as_db_view?: boolean | undefined;
        sortkeys?: string[] | undefined;
        sql_create?: {
            sql?: string | undefined;
        } | undefined;
        sql_trigger_value?: string | undefined;
        table_compression?: string | undefined;
        table_format?: string | undefined;
    } | undefined;
    extends_ref?: string | undefined;
    fields_hidden_by_default?: boolean | undefined;
}, {
    $name: string;
    $type: string;
    dimension?: Record<string, {
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        type?: "string" | "number" | "time" | "duration" | "date" | "bin" | "date_time" | "date_raw" | "distance" | "location" | "tier" | "unquoted" | "yesno" | "zipcode" | "duration_day" | "duration_hour" | "duration_minute" | "duration_month" | "duration_quarter" | "duration_second" | "duration_week" | "duration_year" | undefined;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: "integer" | "float" | "ordinal" | "interval" | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        action?: {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        } | {
            label: string;
            url: string;
            icon_url?: string | undefined;
            param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
            form_param?: {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            } | {
                name: string;
                value?: string | undefined;
                type?: "textarea" | "select" | undefined;
                required?: boolean | undefined;
                default?: string | undefined;
                option?: {
                    name: string;
                } | {
                    name: string;
                }[] | undefined;
            }[] | undefined;
        }[] | undefined;
        case?: {
            $type: string;
            $strings?: unknown;
            $name?: string | undefined;
            when?: {
                label: string;
                sql: string;
            } | {
                label: string;
                sql: string;
            }[] | undefined;
            else?: string | {
                label: string;
            } | undefined;
        } | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_latitude?: string | undefined;
        sql_longitude?: string | undefined;
        sql_start?: string | undefined;
        tiers?: string[] | undefined;
        value_format?: string | undefined;
    }> | undefined;
    measure?: Record<string, {
        type: "string" | "number" | "date" | "date_time" | "yesno" | "average" | "average_distinct" | "count" | "count_distinct" | "list" | "max" | "median" | "median_distinct" | "min" | "percent_of_previous" | "percent_of_total" | "percentile" | "percentile_distinct" | "running_total" | "period_over_period" | "sum" | "sum_distinct";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        percentile?: string | undefined;
        sql?: string | undefined;
        drill_fields?: string[] | undefined;
        link?: {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        } | {
            label: string;
            $type: string;
            url: string;
            $strings?: unknown;
            $name?: string | undefined;
            icon_url?: string | undefined;
        }[] | undefined;
        value_format?: string | undefined;
        filters?: z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict"> | z.objectInputType<{
            $name: z.ZodOptional<z.ZodString>;
            $type: z.ZodString;
            $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
        } & {
            alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            alpha_sort: z.ZodOptional<z.ZodBoolean>;
            allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
            approximate: z.ZodOptional<z.ZodBoolean>;
            approximate_threshold: z.ZodOptional<z.ZodNumber>;
            fanout_on: z.ZodOptional<z.ZodString>;
            precision: z.ZodOptional<z.ZodNumber>;
            primary_key: z.ZodOptional<z.ZodBoolean>;
            required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            sql_distinct_key: z.ZodOptional<z.ZodString>;
            direction: z.ZodOptional<z.ZodString>;
            end_location_field: z.ZodOptional<z.ZodString>;
            list_field: z.ZodOptional<z.ZodString>;
            start_location_field: z.ZodOptional<z.ZodString>;
            description: z.ZodOptional<z.ZodString>;
            full_suggestions: z.ZodOptional<z.ZodBoolean>;
            group_item_label: z.ZodOptional<z.ZodString>;
            group_label: z.ZodOptional<z.ZodString>;
            hidden: z.ZodOptional<z.ZodBoolean>;
            html: z.ZodOptional<z.ZodString>;
            label_from_parameter: z.ZodOptional<z.ZodString>;
            label: z.ZodOptional<z.ZodString>;
            order_by_field: z.ZodOptional<z.ZodString>;
            required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            style: z.ZodOptional<z.ZodString>;
            suggest_dimension: z.ZodOptional<z.ZodString>;
            suggest_explore: z.ZodOptional<z.ZodString>;
            suggest_persist_for: z.ZodOptional<z.ZodString>;
            suggestable: z.ZodOptional<z.ZodBoolean>;
            suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
            tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
            value_format_name: z.ZodOptional<z.ZodString>;
            view_label: z.ZodOptional<z.ZodString>;
            can_filter: z.ZodOptional<z.ZodBoolean>;
            case_sensitive: z.ZodOptional<z.ZodBoolean>;
            skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
            bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
        } & {
            type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
            field: z.ZodOptional<z.ZodString>;
            value: z.ZodOptional<z.ZodString>;
        }, z.ZodString, "strict">[] | undefined;
    }> | undefined;
    parameter?: Record<string, {
        type: "string" | "number" | "date" | "date_time" | "unquoted" | "yesno";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        default_value?: string | undefined;
        allowed_value?: {
            label: string;
            value: string;
        }[] | undefined;
    }> | undefined;
    filter?: z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict"> | z.objectInputType<{
        $name: z.ZodOptional<z.ZodString>;
        $type: z.ZodString;
        $strings: z.ZodType<unknown, z.ZodTypeDef, unknown>;
    } & {
        alias: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        alpha_sort: z.ZodOptional<z.ZodBoolean>;
        allow_approximate_optimization: z.ZodOptional<z.ZodBoolean>;
        approximate: z.ZodOptional<z.ZodBoolean>;
        approximate_threshold: z.ZodOptional<z.ZodNumber>;
        fanout_on: z.ZodOptional<z.ZodString>;
        precision: z.ZodOptional<z.ZodNumber>;
        primary_key: z.ZodOptional<z.ZodBoolean>;
        required_access_grants: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        sql_distinct_key: z.ZodOptional<z.ZodString>;
        direction: z.ZodOptional<z.ZodString>;
        end_location_field: z.ZodOptional<z.ZodString>;
        list_field: z.ZodOptional<z.ZodString>;
        start_location_field: z.ZodOptional<z.ZodString>;
        description: z.ZodOptional<z.ZodString>;
        full_suggestions: z.ZodOptional<z.ZodBoolean>;
        group_item_label: z.ZodOptional<z.ZodString>;
        group_label: z.ZodOptional<z.ZodString>;
        hidden: z.ZodOptional<z.ZodBoolean>;
        html: z.ZodOptional<z.ZodString>;
        label_from_parameter: z.ZodOptional<z.ZodString>;
        label: z.ZodOptional<z.ZodString>;
        order_by_field: z.ZodOptional<z.ZodString>;
        required_fields: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        style: z.ZodOptional<z.ZodString>;
        suggest_dimension: z.ZodOptional<z.ZodString>;
        suggest_explore: z.ZodOptional<z.ZodString>;
        suggest_persist_for: z.ZodOptional<z.ZodString>;
        suggestable: z.ZodOptional<z.ZodBoolean>;
        suggestions: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodArray<z.ZodString, "many">]>>;
        tags: z.ZodOptional<z.ZodArray<z.ZodString, "many">>;
        value_format_name: z.ZodOptional<z.ZodString>;
        view_label: z.ZodOptional<z.ZodString>;
        can_filter: z.ZodOptional<z.ZodBoolean>;
        case_sensitive: z.ZodOptional<z.ZodBoolean>;
        skip_drill_filter: z.ZodOptional<z.ZodBoolean>;
        bypass_suggest_restrictions: z.ZodOptional<z.ZodBoolean>;
    } & {
        type: z.ZodOptional<z.ZodEnum<["date", "date_time", "number", "string", "yesno"]>>;
        field: z.ZodOptional<z.ZodString>;
        value: z.ZodOptional<z.ZodString>;
    }, z.ZodString, "strict">[] | undefined;
    extends?: string[] | undefined;
    sql_on?: string | undefined;
    relationship?: string | undefined;
    label?: string | undefined;
    extension?: string | boolean | undefined;
    $strings?: unknown;
    dimension_group?: Record<string, {
        type: "time" | "duration";
        $type: string;
        label?: string | undefined;
        tags?: string[] | undefined;
        $strings?: unknown;
        $name?: string | undefined;
        alias?: string[] | undefined;
        alpha_sort?: boolean | undefined;
        allow_approximate_optimization?: boolean | undefined;
        approximate?: boolean | undefined;
        approximate_threshold?: number | undefined;
        fanout_on?: string | undefined;
        precision?: number | undefined;
        primary_key?: boolean | undefined;
        required_access_grants?: string[] | undefined;
        sql_distinct_key?: string | undefined;
        direction?: string | undefined;
        end_location_field?: string | undefined;
        list_field?: string | undefined;
        start_location_field?: string | undefined;
        description?: string | undefined;
        full_suggestions?: boolean | undefined;
        group_item_label?: string | undefined;
        group_label?: string | undefined;
        hidden?: boolean | undefined;
        html?: string | undefined;
        label_from_parameter?: string | undefined;
        order_by_field?: string | undefined;
        required_fields?: string[] | undefined;
        style?: string | undefined;
        suggest_dimension?: string | undefined;
        suggest_explore?: string | undefined;
        suggest_persist_for?: string | undefined;
        suggestable?: boolean | undefined;
        suggestions?: string | string[] | undefined;
        value_format_name?: string | undefined;
        view_label?: string | undefined;
        can_filter?: boolean | undefined;
        case_sensitive?: boolean | undefined;
        skip_drill_filter?: boolean | undefined;
        bypass_suggest_restrictions?: boolean | undefined;
        sql?: string | undefined;
        map_layer_name?: string | undefined;
        sql_end?: string | undefined;
        sql_start?: string | undefined;
        value_format?: string | undefined;
        timeframes?: string[] | undefined;
        datatype?: "date" | "datetime" | "unixtime" | undefined;
        convert_tz?: boolean | undefined;
        intervals?: string[] | undefined;
        string_datatype?: string | undefined;
        units?: "feet" | "kilometers" | "meters" | "miles" | "nautical_miles" | "yards" | undefined;
        allow_fill?: boolean | undefined;
    }> | undefined;
    set?: Record<string, {
        $type: string;
        fields: string[];
        $strings?: unknown;
        $name?: string | undefined;
    }> | undefined;
    required_access_grants?: string[] | undefined;
    description?: string | undefined;
    hidden?: boolean | undefined;
    suggestions?: boolean | undefined;
    view_label?: string | undefined;
    required?: boolean | undefined;
    drill_fields?: string[] | undefined;
    timezone?: string | undefined;
    access_filter?: Record<string, {
        field: string;
        $name: string;
        user_attribute: string;
    }> | undefined;
    sql_always_having?: string | undefined;
    sql_always_where?: string | undefined;
    persist_for?: string | undefined;
    persist_with?: string | undefined;
    sql_table_name?: string | undefined;
    derived_table?: {
        sql?: string | undefined;
        datagroup_trigger?: string | undefined;
        persist_for?: string | undefined;
        cluster_keys?: string[] | undefined;
        create_process?: {
            sql_step?: string | undefined;
        } | undefined;
        distribution?: string | undefined;
        distribution_style?: string | undefined;
        explore_source?: string | {} | undefined;
        increment_key?: string | undefined;
        increment_offset?: number | undefined;
        indexes?: string[] | undefined;
        interval_trigger?: string | undefined;
        materialized_view?: boolean | undefined;
        partition_keys?: string[] | undefined;
        publish_as_db_view?: boolean | undefined;
        sortkeys?: string[] | undefined;
        sql_create?: {
            sql?: string | undefined;
        } | undefined;
        sql_trigger_value?: string | undefined;
        table_compression?: string | undefined;
        table_format?: string | undefined;
    } | undefined;
    extends_ref?: string | undefined;
    fields_hidden_by_default?: boolean | undefined;
}>;
