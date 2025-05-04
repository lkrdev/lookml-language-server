import { z } from 'zod';

// Base schemas for common properties
export const recursiveStringArray: z.ZodType<unknown> = z.lazy(() =>
  z.union([z.string(), z.array(recursiveStringArray)])
);

export const baseProperties = z.object({
  $name: z.string(),
  $type: z.string(),
  $strings: recursiveStringArray,
  label: z.string().optional(),
  description: z.string().optional(),
  hidden: z.boolean().optional(),
  view_label: z.string().optional(),
  group_label: z.string().optional(),
  tags: z.array(z.string()).optional(),
  value_format_name: z.string().optional(),
});

export const linkSchema = z.object({
  label: z.string(),
  $name: z.string().optional(),
  $type: z.string(),
  $strings: recursiveStringArray,
  icon_url: z.string().optional(),
  url: z.string(),
}).strict();


const actionOptionSchema = z.object({
  name: z.string()
});

const actionParamSchema = z.object({
  name: z.string(),
  value: z.string().optional(),
  required: z.boolean().optional(),
  default: z.string().optional(),
  type: z.enum(['textarea', 'select']).optional(),
  option: z.union([
    actionOptionSchema,
    z.array(actionOptionSchema)
  ]).optional(),
});

const actionSchema = z.object({
  label: z.string(),
  url: z.string(),
  icon_url: z.string().optional(),
  param: actionParamSchema.optional(),
  form_param: z.array(actionParamSchema).optional(),
});

// Shared valid types between dimensions and measures
export const sharedValidTypes = [
  "time",
  "date",
  "number",
  "string",
  "yesno",
  "zipcode",
  "date_day_of_month",
  "date_day_of_week",
  "date_day_of_week_index",
  "date_day_of_year",
  "date_fiscal_month_num",
  "date_fiscal_quarter",
  "date_fiscal_quarter_of_year",
  "date_fiscal_year",
  "date_hour",
  "date_hour2",
  "date_hour3",
  "date_hour4",
  "date_hour6",
  "date_hour8",
  "date_hour12",
  "date_hour_of_day",
  "date_microsecond",
  "date_millisecond",
  "date_millisecond2",
  "date_millisecond4",
  "date_millisecond5",
  "date_millisecond8",
  "date_millisecond10",
  "date_millisecond20",
  "date_millisecond25",
  "date_millisecond40",
  "date_millisecond50",
  "date_millisecond100",
  "date_millisecond125",
  "date_millisecond200",
  "date_millisecond250",
  "date_millisecond500",
  "date_minute",
  "date_minute2",
  "date_minute3",
  "date_minute4",
  "date_minute5",
  "date_minute6",
  "date_minute10",
  "date_minute12",
  "date_minute15",
  "date_minute20",
  "date_minute30",
  "date_month",
  "date_month_name",
  "date_month_num",
  "date_quarter",
  "date_quarter_of_year",
  "date_raw",
  "date_second",
  "date_time",
  "date_time_of_day",
  "date_week",
  "date_week_of_year",
  "date_year"
] as const;

// Dimension-specific valid types (extends shared types)
export const dimensionValidTypes = [
  ...sharedValidTypes,
  "bin",
  "distance",
  "location",
  "tier",
  "duration_day",
  "duration_hour",
  "duration_minute",
  "duration_month",
  "duration_quarter",
  "duration_second",
  "duration_week",
  "duration_year"
] as const;

// Measure-specific valid types (extends shared types)
export const measureValidTypes = [
  ...sharedValidTypes,
  "average",
  "average_distinct",
  "count",
  "count_distinct",
  "int",
  "list",
  "max",
  "median",
  "median_distinct",
  "min",
  "percent_of_previous",
  "percent_of_total",
  "percentile",
  "percentile_distinct",
  "running_total",
  "sum",
  "sum_distinct",
  "date_date"
] as const;

export const dimensionGroupValidTypes = [
  ...sharedValidTypes,
  "time",
  "duration"
] as const;

// Dimension schema
export const dimensionSchema = baseProperties.extend({
  action: z.union([
    actionSchema,
    z.array(actionSchema)
  ]).optional(),
  drill_fields: z.array(z.string()).optional(),
  link: z.union([linkSchema, z.array(linkSchema)]).optional(),
  map_layer_name: z.string().optional(),
  primary_key: z.boolean().optional(),
  sql_end: z.string().optional(),
  sql_start: z.string().optional(),
  sql: z.string().optional(),
  style: z.enum(['integer', 'float', 'ordinal']).optional(),
  tiers: z.array(z.string()).optional(),
  type: z.enum(dimensionValidTypes).optional(),
  value_format: z.string().optional(),
}).strict();

// Dimension group schema
export const dimensionGroupSchema = baseProperties.extend({
  convert_tz: z.boolean().optional(),
  datatype: z.enum(['date', 'datetime', 'unixtime']).optional(),
  sql_end: z.string().optional(),
  sql_start: z.string().optional(),
  sql: z.string(),
  timeframes: z.array(
    z.enum([
      'raw',
      'time',
      'date',
      'week',
      'month',
      'quarter',
      'year',
      'day_of_week',
      'day_of_month',
      'day_of_year',
      'week_of_year',
      'month_of_year',
      'quarter_of_year',
      'hour',
      'minute',
      'second',
      'hour_of_day',
      'minute_of_hour',
      'second_of_minute',
      'time_of_day',
      'day_of_week_index',
      'week_start_date',
      'month_name',
      'quarter_name',
      'day_name',
    ])
  ),
  type: z.literal('time'),
}).strict();

// Measure schema
export const measureFiltersSchema = z.union([
  z.object({
    field: z.string(),
    value: z.string(),
  }),
  z.record(z.string(), z.string())
]);

export const measureSchema = baseProperties.extend({
  drill_fields: z.array(z.string()).optional(),
  filters: measureFiltersSchema.optional(),
  link: linkSchema.optional(),
  percentile: z.string().min(0).max(100).optional(),
  sql: z.string().optional(),
  type: z.enum(measureValidTypes),
  value_format: z.string().optional(),
}).strict();

// Set schema
export const setSchema = baseProperties.extend({
  fields: z.array(z.string())
}).strict();

// Join schema
export const joinSchema = baseProperties.extend({
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

// Explore schema
export const exploreSchema = baseProperties.extend({
  view_name: z.string().optional(),
  from: z.string().optional(),
  extends: z.array(z.string()).optional(),
  join: z.record(z.string(), joinSchema).optional(),
}).strict();

// Suggestions schema
export const suggestionsSchema = z.array(
  z.object({
    label: z.string(),
    value: z.string(),
  })
); 