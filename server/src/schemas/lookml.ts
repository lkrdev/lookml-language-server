import { z } from 'zod';

export const recursiveStringArray: z.ZodType<unknown> = z.lazy(() =>
  z.union([z.string(), z.array(recursiveStringArray)])
);

const parserValues = z.object({
  $name: z.string().optional(),
  $type: z.string(),
  $strings: recursiveStringArray,
});

export const fieldProperties = parserValues.extend({
  alias: z.array(z.string()).optional(),
  alpha_sort: z.boolean().optional(),
  allow_approximate_optimization: z.boolean().optional(),
  approximate: z.boolean().optional(),
  approximate_threshold: z.number().optional(),
  fanout_on: z.string().optional(),
  precision: z.number().optional(),
  primary_key: z.boolean().optional(),
  required_access_grants: z.array(z.string()).optional(),
  sql_distinct_key: z.string().optional(),
  direction: z.string().optional(),
  end_location_field: z.string().optional(),
  list_field: z.string().optional(),
  start_location_field: z.string().optional(),
  description: z.string().optional(),
  full_suggestions: z.boolean().optional(),
  group_item_label: z.string().optional(),
  group_label: z.string().optional(),
  hidden: z.boolean().optional(),
  html: z.string().optional(),
  label_from_parameter: z.string().optional(),
  label: z.string().optional(),
  order_by_field: z.string().optional(),
  required_fields: z.array(z.string()).optional(),
  style: z.string().optional(),
  suggest_dimension: z.string().optional(),
  suggest_explore: z.string().optional(),
  suggest_persist_for: z.string().optional(),
  suggestable: z.boolean().optional(),
  suggestions: z.union([z.string(), z.array(z.string())]).optional(),
  tags: z.array(z.string()).optional(),
  value_format_name: z.string().optional(),
  view_label: z.string().optional(),
  can_filter: z.boolean().optional(),
  case_sensitive: z.boolean().optional(),
  skip_drill_filter: z.boolean().optional(),
  bypass_suggest_restrictions: z.boolean().optional(),
});

export const linkSchema = parserValues.extend({
  label: z.string(),
  icon_url: z.string().optional(),
  url: z.string(),
}).strict();

const optionSchema = z.object({
  name: z.string()
});

const paramSchema = z.object({
  name: z.string(),
  value: z.string().optional(),
  required: z.boolean().optional(),
  default: z.string().optional(),
  type: z.enum(['textarea', 'select']).optional(),
  option: z.union([optionSchema, z.array(optionSchema)]).optional(),
});

const actionSchema = z.object({
  label: z.string(),
  url: z.string(),
  icon_url: z.string().optional(),
  param: z.union([paramSchema, z.array(paramSchema)]).optional(),
  form_param: z.union([paramSchema, z.array(paramSchema)]).optional(),
});

export const dimensionValidTypes = [
  "bin", "date", "date_time", "date_raw","distance", "duration", "location",
  "number", "string", "tier", "time", "unquoted", "yesno", "zipcode",
  "duration_day", "duration_hour", "duration_minute", "duration_month",
  "duration_quarter", "duration_second", "duration_week", "duration_year"
] as const;

const individualDurationTypes = [
  "duration_day", "duration_hour", "duration_minute", "duration_month",
  "duration_quarter", "duration_second", "duration_week", "duration_year"
];

export const measureValidTypes = [
  'average', 'average_distinct', 'count', 'count_distinct', 'date', 'date_time',
  'list', 'max', 'median', 'median_distinct', 'min', 'number',
  'percent_of_previous', 'percent_of_total', 'percentile', 'percentile_distinct',
  'running_total', 'period_over_period', 'string', 'sum', 'sum_distinct', 'yesno'
] as const;


const caseWhenSchema = z.object({
  label: z.string(),
  sql: z.string(),
});

const caseSchema = parserValues.extend({
  when: z.union([caseWhenSchema, z.array(caseWhenSchema)]).optional(),
  else: z.union([z.string(), z.object({ label: z.string() })]).optional(),
}).strict();

const allowedValueSchema = z.object({
  label: z.string(),
  value: z.string(),
});

const parameterTypes = [
  'string', 'number', 'unquoted', 'date', 'date_time', 'yesno'
] as const;

const filterTypes = [
  'date', 'date_time', 'number', 'string', 'yesno',
  // Add individual time/duration types if you want to support them, e.g.:
  // 'date_hour', 'date_minute', 'date_second', 'duration_second', etc.
] as const;

const parameterSchema = fieldProperties.extend({
  type: z.enum(parameterTypes),
  default_value: z.string().optional(),
  allowed_value: z.array(allowedValueSchema).optional(),
  sql: z.string().optional(),
}).strict();

export const filterSchema = fieldProperties.extend({
  type: z.enum(filterTypes).optional(),
  field: z.string().optional(),
  value: z.string().optional(),
  // Add other filter-specific properties here if needed
}).catchall(z.string()).strict();

export const dimensionSchema = fieldProperties.extend({
  action: z.union([actionSchema, z.array(actionSchema)]).optional(),
  case: caseSchema.optional(),
  drill_fields: z.array(z.string()).optional(),
  link: z.union([linkSchema, z.array(linkSchema)]).optional(),
  map_layer_name: z.string().optional(),
  primary_key: z.boolean().optional(),
  required_fields: z.array(z.string()).optional(),
  sql_end: z.string().optional(),
  sql_latitude: z.string().optional(),
  sql_longitude: z.string().optional(),
  sql_start: z.string().optional(),
  sql: z.string().optional(),
  style: z.enum(['integer', 'float', 'ordinal', 'interval']).optional(),
  tiers: z.array(z.string()).optional(),
  type: z.enum(dimensionValidTypes).optional(),
  value_format: z.string().optional(),
}).strict().superRefine((val, ctx) => {
  if (val.type === 'location') {
    if (!val.sql_latitude) {
      ctx.addIssue({
        path: ['sql_latitude'],
        code: z.ZodIssueCode.custom,
        message: 'sql_latitude is required for type: location',
      });
    }
    if (!val.sql_longitude) {
      ctx.addIssue({
        path: ['sql_longitude'],
        code: z.ZodIssueCode.custom,
        message: 'sql_longitude is required for type: location',
      });
    }
  }
  if (val.type && individualDurationTypes.includes(val.type)) {
    if (!val.sql_start) {
      ctx.addIssue({
        path: ['sql_start'],
        code: z.ZodIssueCode.custom,
        message: 'sql_start is required for individual duration types',
      });
    }
    if (!val.sql_end) {
      ctx.addIssue({
        path: ['sql_end'],
        code: z.ZodIssueCode.custom,
        message: 'sql_end is required for individual duration types',
      });
    }
  }
});

export const dimensionGroupSchema = fieldProperties.extend({
  type: z.enum(['time', 'duration']),
  // For 'time' type
  sql: z.string().optional(),
  timeframes: z.array(z.string()).optional(),
  datatype: z.enum(['date', 'datetime', 'unixtime']).optional(),
  convert_tz: z.boolean().optional(),
  // For 'duration' type
  sql_start: z.string().optional(),
  sql_end: z.string().optional(),
  intervals: z.array(z.string()).optional(),
  // Additional dimension group-specific properties
  string_datatype: z.string().optional(),
  units: z.enum(['feet', 'kilometers', 'meters', 'miles', 'nautical_miles', 'yards']).optional(),
  value_format: z.string().optional(),
  allow_fill: z.boolean().optional(),
  map_layer_name: z.string().optional(),
}).strict().superRefine((val, ctx) => {
  if (val.type === 'time') {
    if (!val.sql) {
      ctx.addIssue({
        path: ['sql'],
        code: z.ZodIssueCode.custom,
        message: 'sql is required for type: time',
      });
    }
    if (val.intervals) {
      ctx.addIssue({
        path: ['intervals'],
        code: z.ZodIssueCode.custom,
        message: 'intervals should not be present for type: time',
      });
    }
    // timeframes is optional for 'time'
  }
  if (val.type === 'duration') {
    if (!val.sql_start) {
      ctx.addIssue({
        path: ['sql_start'],
        code: z.ZodIssueCode.custom,
        message: 'sql_start is required for type: duration',
      });
    }
    if (!val.sql_end) {
      ctx.addIssue({
        path: ['sql_end'],
        code: z.ZodIssueCode.custom,
        message: 'sql_end is required for type: duration',
      });
    }
    if (val.sql) {
      ctx.addIssue({
        path: ['sql'],
        code: z.ZodIssueCode.custom,
        message: 'sql should not be present for type: duration',
      });
    }
    if (val.timeframes) {
      ctx.addIssue({
        path: ['timeframes'],
        code: z.ZodIssueCode.custom,
        message: 'timeframes should not be present for type: duration',
      });
    }
    // intervals is allowed for 'duration'
  }
});

export const measureSchema = fieldProperties.extend({
  drill_fields: z.array(z.string()).optional(),
  filters: z.union([filterSchema, z.array(filterSchema)]).optional(),
  link: z.union([linkSchema, z.array(linkSchema)]).optional(),
  percentile: z.string().min(0).max(100).optional(),
  sql: z.string().optional(),
  type: z.enum(measureValidTypes), 
  value_format: z.string().optional(),
}).strict();

export const setSchema = parserValues.extend({
  fields: z.array(z.string())
}).strict();

export const joinSchema = parserValues.extend({
  fields: z.array(z.string()).optional(),
  foreign_key: z.string().optional(),
  from: z.string().optional(),
  outer_only: z.boolean().optional(),
  relationship: z.enum(['one_to_one', 'one_to_many', 'many_to_one', 'many_to_many']).optional(),
  required_joins: z.array(z.string()).optional(),
  sql_having: z.string().optional(),
  sql_on: z.string().optional(),
  sql_where: z.string().optional(),
  sql: z.string().optional(),
  type: z.enum(['left_outer', 'inner', 'full_outer', 'cross']).optional(),
  view_label: z.string().optional(),
}).strict();

export const aggregateTableSchema = parserValues.extend({
  query: parserValues.extend({
    dimensions: z.array(z.string()),
    measures: z.array(z.string()),
    filters: z.union([filterSchema, z.array(filterSchema)]).optional(),
    timezone: z.string().optional(),
  }).strict(),
  materialization: parserValues.extend({
    datagroup_trigger: z.string(),
  }).strict(),
}).strict();

export const exploreSchema = parserValues.extend({
  view_name: z.string().optional(),
  from: z.string().optional(),
  fields: z.array(z.string()).optional(),
  extends: z.array(z.string()).optional(),
  join: z.record(z.string(), joinSchema).optional(),
  aggregate_table: z.record(z.string(), aggregateTableSchema).optional(),
}).strict();

export const derivedTableSchema = z.object({
  cluster_keys: z.array(z.string()).optional(),
  create_process: z.object({
    sql_step: z.string().optional(),
  }).optional(),
  datagroup_trigger: z.string().optional(),
  distribution: z.string().optional(),
  distribution_style: z.string().optional(),
  explore_source: z.union([
    z.string(),
    z.object({
      // Add subparameters for explore_source here if needed
    })
  ]).optional(),
  increment_key: z.string().optional(),
  increment_offset: z.number().optional(),
  indexes: z.array(z.string()).optional(),
  interval_trigger: z.string().optional(),
  materialized_view: z.boolean().optional(),
  partition_keys: z.array(z.string()).optional(),
  persist_for: z.string().optional(),
  publish_as_db_view: z.boolean().optional(),
  sortkeys: z.array(z.string()).optional(),
  sql: z.string().optional(),
  sql_create: z.object({
    sql: z.string().optional(),
  }).optional(),
  sql_trigger_value: z.string().optional(),
  table_compression: z.string().optional(),
  table_format: z.string().optional(),
}).optional();

export const LookMLView = parserValues.extend({
  $name: z.string(),
  access_filter: z.record(z.string(), z.object({
    $name: z.string(),
    field: z.string(),
    user_attribute: z.string(),
  })).optional(),
  derived_table: derivedTableSchema,
  description: z.string().optional(),
  dimension_group: z.record(z.string(), dimensionGroupSchema).optional(),
  dimension: z.record(z.string(), dimensionSchema).optional(),
  drill_fields: z.array(z.string()).optional(),
  extends_ref: z.string().optional(),
  extends: z.array(z.string()).optional(),
  extension: z.union([z.string(), z.boolean()]).optional(),
  fields_hidden_by_default: z.boolean().optional(),
  filter: z.union([filterSchema, z.array(filterSchema)]).optional(),
  hidden: z.boolean().optional(),
  label: z.string().optional(),
  measure: z.record(z.string(), measureSchema).optional(),
  parameter: z.record(z.string(), parameterSchema).optional(),
  persist_for: z.string().optional(),
  persist_with: z.string().optional(),
  relationship: z.string().optional(),
  required_access_grants: z.array(z.string()).optional(),
  required: z.boolean().optional(),
  set: z.record(z.string(), setSchema).optional(),
  sql_always_having: z.string().optional(),
  sql_always_where: z.string().optional(),
  sql_on: z.string().optional(),
  sql_table_name: z.string().optional(),
  suggestions: z.boolean().optional(),
  timezone: z.string().optional(),
  view_label: z.string().optional(),
}).strict();