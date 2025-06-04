"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LookMLView = exports.derivedTableSchema = exports.exploreSchema = exports.aggregateTableSchema = exports.joinSchema = exports.setSchema = exports.measureSchema = exports.dimensionGroupSchema = exports.dimensionSchema = exports.filterSchema = exports.parameterSchema = exports.measureValidTypes = exports.dimensionValidTypes = exports.linkSchema = exports.fieldProperties = exports.recursiveStringArray = void 0;
const zod_1 = require("zod");
exports.recursiveStringArray = zod_1.z.lazy(() => zod_1.z.union([zod_1.z.string(), zod_1.z.array(exports.recursiveStringArray)]));
const parserValues = zod_1.z.object({
    $name: zod_1.z.string().optional(),
    $type: zod_1.z.string(),
    $strings: exports.recursiveStringArray,
});
exports.fieldProperties = parserValues.extend({
    alias: zod_1.z.array(zod_1.z.string()).optional(),
    alpha_sort: zod_1.z.boolean().optional(),
    allow_approximate_optimization: zod_1.z.boolean().optional(),
    approximate: zod_1.z.boolean().optional(),
    approximate_threshold: zod_1.z.number().optional(),
    fanout_on: zod_1.z.string().optional(),
    precision: zod_1.z.number().optional(),
    primary_key: zod_1.z.boolean().optional(),
    required_access_grants: zod_1.z.array(zod_1.z.string()).optional(),
    sql_distinct_key: zod_1.z.string().optional(),
    direction: zod_1.z.string().optional(),
    end_location_field: zod_1.z.string().optional(),
    list_field: zod_1.z.string().optional(),
    start_location_field: zod_1.z.string().optional(),
    description: zod_1.z.string().optional(),
    full_suggestions: zod_1.z.boolean().optional(),
    group_item_label: zod_1.z.string().optional(),
    group_label: zod_1.z.string().optional(),
    hidden: zod_1.z.boolean().optional(),
    html: zod_1.z.string().optional(),
    label_from_parameter: zod_1.z.string().optional(),
    label: zod_1.z.string().optional(),
    order_by_field: zod_1.z.string().optional(),
    required_fields: zod_1.z.array(zod_1.z.string()).optional(),
    style: zod_1.z.string().optional(),
    suggest_dimension: zod_1.z.string().optional(),
    suggest_explore: zod_1.z.string().optional(),
    suggest_persist_for: zod_1.z.string().optional(),
    suggestable: zod_1.z.boolean().optional(),
    suggestions: zod_1.z.union([zod_1.z.string(), zod_1.z.array(zod_1.z.string())]).optional(),
    tags: zod_1.z.array(zod_1.z.string()).optional(),
    value_format_name: zod_1.z.string().optional(),
    view_label: zod_1.z.string().optional(),
    can_filter: zod_1.z.boolean().optional(),
    case_sensitive: zod_1.z.boolean().optional(),
    skip_drill_filter: zod_1.z.boolean().optional(),
    bypass_suggest_restrictions: zod_1.z.boolean().optional(),
});
exports.linkSchema = parserValues.extend({
    label: zod_1.z.string(),
    icon_url: zod_1.z.string().optional(),
    url: zod_1.z.string(),
}).strict();
const optionSchema = zod_1.z.object({
    name: zod_1.z.string()
});
const paramSchema = zod_1.z.object({
    name: zod_1.z.string(),
    value: zod_1.z.string().optional(),
    required: zod_1.z.boolean().optional(),
    default: zod_1.z.string().optional(),
    type: zod_1.z.enum(['textarea', 'select']).optional(),
    option: zod_1.z.union([optionSchema, zod_1.z.array(optionSchema)]).optional(),
});
const actionSchema = zod_1.z.object({
    label: zod_1.z.string(),
    url: zod_1.z.string(),
    icon_url: zod_1.z.string().optional(),
    param: zod_1.z.union([paramSchema, zod_1.z.array(paramSchema)]).optional(),
    form_param: zod_1.z.union([paramSchema, zod_1.z.array(paramSchema)]).optional(),
});
exports.dimensionValidTypes = [
    "bin", "date", "date_time", "date_raw", "distance", "duration", "location",
    "number", "string", "tier", "time", "unquoted", "yesno", "zipcode",
    "duration_day", "duration_hour", "duration_minute", "duration_month",
    "duration_quarter", "duration_second", "duration_week", "duration_year"
];
const individualDurationTypes = [
    "duration_day", "duration_hour", "duration_minute", "duration_month",
    "duration_quarter", "duration_second", "duration_week", "duration_year"
];
exports.measureValidTypes = [
    'average', 'average_distinct', 'count', 'count_distinct', 'date', 'date_time',
    'list', 'max', 'median', 'median_distinct', 'min', 'number',
    'percent_of_previous', 'percent_of_total', 'percentile', 'percentile_distinct',
    'running_total', 'period_over_period', 'string', 'sum', 'sum_distinct', 'yesno'
];
const caseWhenSchema = zod_1.z.object({
    label: zod_1.z.string(),
    sql: zod_1.z.string(),
});
const caseSchema = parserValues.extend({
    when: zod_1.z.union([caseWhenSchema, zod_1.z.array(caseWhenSchema)]).optional(),
    else: zod_1.z.union([zod_1.z.string(), zod_1.z.object({ label: zod_1.z.string() })]).optional(),
}).strict();
const allowedValueSchema = zod_1.z.object({
    label: zod_1.z.string(),
    value: zod_1.z.string(),
});
const parameterTypes = [
    'string', 'number', 'unquoted', 'date', 'date_time', 'yesno'
];
const filterTypes = [
    'date', 'date_time', 'number', 'string', 'yesno',
    // Add individual time/duration types if you want to support them, e.g.:
    // 'date_hour', 'date_minute', 'date_second', 'duration_second', etc.
];
exports.parameterSchema = exports.fieldProperties.extend({
    type: zod_1.z.enum(parameterTypes),
    default_value: zod_1.z.string().optional(),
    allowed_value: zod_1.z.array(allowedValueSchema).optional(),
    sql: zod_1.z.string().optional(),
}).strict();
exports.filterSchema = exports.fieldProperties.extend({
    type: zod_1.z.enum(filterTypes).optional(),
    field: zod_1.z.string().optional(),
    value: zod_1.z.string().optional(),
    // Add other filter-specific properties here if needed
}).catchall(zod_1.z.string()).strict();
exports.dimensionSchema = exports.fieldProperties.extend({
    action: zod_1.z.union([actionSchema, zod_1.z.array(actionSchema)]).optional(),
    case: caseSchema.optional(),
    drill_fields: zod_1.z.array(zod_1.z.string()).optional(),
    link: zod_1.z.union([exports.linkSchema, zod_1.z.array(exports.linkSchema)]).optional(),
    map_layer_name: zod_1.z.string().optional(),
    primary_key: zod_1.z.boolean().optional(),
    required_fields: zod_1.z.array(zod_1.z.string()).optional(),
    sql_end: zod_1.z.string().optional(),
    sql_latitude: zod_1.z.string().optional(),
    sql_longitude: zod_1.z.string().optional(),
    sql_start: zod_1.z.string().optional(),
    sql: zod_1.z.string().optional(),
    style: zod_1.z.enum(['integer', 'float', 'ordinal', 'interval']).optional(),
    tiers: zod_1.z.array(zod_1.z.string()).optional(),
    type: zod_1.z.enum(exports.dimensionValidTypes).optional(),
    value_format: zod_1.z.string().optional(),
}).strict().superRefine((val, ctx) => {
    if (val.type === 'location') {
        if (!val.sql_latitude) {
            ctx.addIssue({
                path: ['sql_latitude'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql_latitude is required for type: location',
            });
        }
        if (!val.sql_longitude) {
            ctx.addIssue({
                path: ['sql_longitude'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql_longitude is required for type: location',
            });
        }
    }
    if (val.type && individualDurationTypes.includes(val.type)) {
        if (!val.sql_start) {
            ctx.addIssue({
                path: ['sql_start'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql_start is required for individual duration types',
            });
        }
        if (!val.sql_end) {
            ctx.addIssue({
                path: ['sql_end'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql_end is required for individual duration types',
            });
        }
    }
});
exports.dimensionGroupSchema = exports.fieldProperties.extend({
    type: zod_1.z.enum(['time', 'duration']),
    // For 'time' type
    sql: zod_1.z.string().optional(),
    timeframes: zod_1.z.array(zod_1.z.string()).optional(),
    datatype: zod_1.z.enum(['date', 'datetime', 'unixtime']).optional(),
    convert_tz: zod_1.z.boolean().optional(),
    // For 'duration' type
    sql_start: zod_1.z.string().optional(),
    sql_end: zod_1.z.string().optional(),
    intervals: zod_1.z.array(zod_1.z.string()).optional(),
    // Additional dimension group-specific properties
    string_datatype: zod_1.z.string().optional(),
    units: zod_1.z.enum(['feet', 'kilometers', 'meters', 'miles', 'nautical_miles', 'yards']).optional(),
    value_format: zod_1.z.string().optional(),
    allow_fill: zod_1.z.boolean().optional(),
    map_layer_name: zod_1.z.string().optional(),
}).strict().superRefine((val, ctx) => {
    if (val.type === 'time') {
        if (!val.sql) {
            ctx.addIssue({
                path: ['sql'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql is required for type: time',
            });
        }
        if (val.intervals) {
            ctx.addIssue({
                path: ['intervals'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'intervals should not be present for type: time',
            });
        }
        // timeframes is optional for 'time'
    }
    if (val.type === 'duration') {
        if (!val.sql_start) {
            ctx.addIssue({
                path: ['sql_start'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql_start is required for type: duration',
            });
        }
        if (!val.sql_end) {
            ctx.addIssue({
                path: ['sql_end'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql_end is required for type: duration',
            });
        }
        if (val.sql) {
            ctx.addIssue({
                path: ['sql'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'sql should not be present for type: duration',
            });
        }
        if (val.timeframes) {
            ctx.addIssue({
                path: ['timeframes'],
                code: zod_1.z.ZodIssueCode.custom,
                message: 'timeframes should not be present for type: duration',
            });
        }
        // intervals is allowed for 'duration'
    }
});
exports.measureSchema = exports.fieldProperties.extend({
    drill_fields: zod_1.z.array(zod_1.z.string()).optional(),
    filters: zod_1.z.union([exports.filterSchema, zod_1.z.array(exports.filterSchema)]).optional(),
    link: zod_1.z.union([exports.linkSchema, zod_1.z.array(exports.linkSchema)]).optional(),
    percentile: zod_1.z.string().min(0).max(100).optional(),
    sql: zod_1.z.string().optional(),
    type: zod_1.z.enum(exports.measureValidTypes),
    value_format: zod_1.z.string().optional(),
}).strict();
exports.setSchema = parserValues.extend({
    fields: zod_1.z.array(zod_1.z.string())
}).strict();
exports.joinSchema = parserValues.extend({
    fields: zod_1.z.array(zod_1.z.string()).optional(),
    foreign_key: zod_1.z.string().optional(),
    from: zod_1.z.string().optional(),
    outer_only: zod_1.z.boolean().optional(),
    relationship: zod_1.z.enum(['one_to_one', 'one_to_many', 'many_to_one', 'many_to_many']).optional(),
    required_joins: zod_1.z.array(zod_1.z.string()).optional(),
    sql_having: zod_1.z.string().optional(),
    sql_on: zod_1.z.string().optional(),
    sql_where: zod_1.z.string().optional(),
    sql: zod_1.z.string().optional(),
    type: zod_1.z.enum(['left_outer', 'inner', 'full_outer', 'cross']).optional(),
    view_label: zod_1.z.string().optional(),
}).strict();
exports.aggregateTableSchema = parserValues.extend({
    query: parserValues.extend({
        dimensions: zod_1.z.array(zod_1.z.string()),
        measures: zod_1.z.array(zod_1.z.string()),
        filters: zod_1.z.union([exports.filterSchema, zod_1.z.array(exports.filterSchema)]).optional(),
        timezone: zod_1.z.string().optional(),
    }).strict(),
    materialization: parserValues.extend({
        datagroup_trigger: zod_1.z.string(),
    }).strict(),
}).strict();
exports.exploreSchema = parserValues.extend({
    extension: zod_1.z.boolean().optional(),
    extends: zod_1.z.array(zod_1.z.string()).optional(),
    fields: zod_1.z.array(zod_1.z.string()).optional(),
    tags: zod_1.z.array(zod_1.z.string()).optional(),
    // Display
    description: zod_1.z.string().optional(),
    group_label: zod_1.z.string().optional(),
    hidden: zod_1.z.boolean().optional(),
    label: zod_1.z.string().optional(),
    query: zod_1.z.record(zod_1.z.unknown()).optional(),
    view_label: zod_1.z.string().optional(),
    // Filter
    access_filter: zod_1.z.union([
        zod_1.z.object({
            field: zod_1.z.string(),
            user_attribute: zod_1.z.string(),
        }),
        zod_1.z.array(zod_1.z.object({
            field: zod_1.z.string(),
            user_attribute: zod_1.z.string(),
        }))
    ]).optional(),
    always_filter: zod_1.z.object({
        filters: zod_1.z.record(zod_1.z.string())
    }).optional(),
    conditionally_filter: zod_1.z.object({
        filters: zod_1.z.record(zod_1.z.string()),
        unless: zod_1.z.array(zod_1.z.string()),
    }).optional(),
    case_sensitive: zod_1.z.boolean().optional(),
    sql_always_having: zod_1.z.string().optional(),
    sql_always_where: zod_1.z.string().optional(),
    // Join
    always_join: zod_1.z.array(zod_1.z.string()).optional(),
    join: zod_1.z.record(zod_1.z.string(), exports.joinSchema).optional(),
    // Query
    cancel_grouping_fields: zod_1.z.array(zod_1.z.string()).optional(),
    from: zod_1.z.string().optional(),
    persist_for: zod_1.z.string().optional(),
    persist_with: zod_1.z.string().optional(),
    required_access_grants: zod_1.z.array(zod_1.z.string()).optional(),
    sql_table_name: zod_1.z.string().optional(),
    symmetric_aggregates: zod_1.z.boolean().optional(),
    view_name: zod_1.z.string().optional(),
    // Aggregate Table
    aggregate_table: zod_1.z.record(zod_1.z.string(), exports.aggregateTableSchema).optional(),
}).strict();
exports.derivedTableSchema = zod_1.z.object({
    cluster_keys: zod_1.z.array(zod_1.z.string()).optional(),
    create_process: zod_1.z.object({
        sql_step: zod_1.z.string().optional(),
    }).optional(),
    datagroup_trigger: zod_1.z.string().optional(),
    distribution: zod_1.z.string().optional(),
    distribution_style: zod_1.z.string().optional(),
    explore_source: zod_1.z.union([
        zod_1.z.string(),
        zod_1.z.object({
        // Add subparameters for explore_source here if needed
        })
    ]).optional(),
    increment_key: zod_1.z.string().optional(),
    increment_offset: zod_1.z.number().optional(),
    indexes: zod_1.z.array(zod_1.z.string()).optional(),
    interval_trigger: zod_1.z.string().optional(),
    materialized_view: zod_1.z.boolean().optional(),
    partition_keys: zod_1.z.array(zod_1.z.string()).optional(),
    persist_for: zod_1.z.string().optional(),
    publish_as_db_view: zod_1.z.boolean().optional(),
    sortkeys: zod_1.z.array(zod_1.z.string()).optional(),
    sql: zod_1.z.string().optional(),
    sql_create: zod_1.z.object({
        sql: zod_1.z.string().optional(),
    }).optional(),
    sql_trigger_value: zod_1.z.string().optional(),
    table_compression: zod_1.z.string().optional(),
    table_format: zod_1.z.string().optional(),
}).optional();
exports.LookMLView = parserValues.extend({
    $name: zod_1.z.string(),
    access_filter: zod_1.z.record(zod_1.z.string(), zod_1.z.object({
        $name: zod_1.z.string(),
        field: zod_1.z.string(),
        user_attribute: zod_1.z.string(),
    })).optional(),
    derived_table: exports.derivedTableSchema,
    description: zod_1.z.string().optional(),
    dimension_group: zod_1.z.record(zod_1.z.string(), exports.dimensionGroupSchema).optional(),
    dimension: zod_1.z.record(zod_1.z.string(), exports.dimensionSchema).optional(),
    drill_fields: zod_1.z.array(zod_1.z.string()).optional(),
    extends_ref: zod_1.z.string().optional(),
    extends: zod_1.z.array(zod_1.z.string()).optional(),
    extension: zod_1.z.union([zod_1.z.string(), zod_1.z.boolean()]).optional(),
    fields_hidden_by_default: zod_1.z.boolean().optional(),
    filter: zod_1.z.union([exports.filterSchema, zod_1.z.array(exports.filterSchema)]).optional(),
    hidden: zod_1.z.boolean().optional(),
    label: zod_1.z.string().optional(),
    measure: zod_1.z.record(zod_1.z.string(), exports.measureSchema).optional(),
    parameter: zod_1.z.record(zod_1.z.string(), exports.parameterSchema).optional(),
    persist_for: zod_1.z.string().optional(),
    persist_with: zod_1.z.string().optional(),
    relationship: zod_1.z.string().optional(),
    required_access_grants: zod_1.z.array(zod_1.z.string()).optional(),
    required: zod_1.z.boolean().optional(),
    set: zod_1.z.record(zod_1.z.string(), exports.setSchema).optional(),
    sql_always_having: zod_1.z.string().optional(),
    sql_always_where: zod_1.z.string().optional(),
    sql_on: zod_1.z.string().optional(),
    sql_table_name: zod_1.z.string().optional(),
    suggestions: zod_1.z.boolean().optional(),
    timezone: zod_1.z.string().optional(),
    view_label: zod_1.z.string().optional(),
}).strict();
