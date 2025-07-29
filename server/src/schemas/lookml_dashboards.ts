import { z } from "zod";

// Auto-reload test comment - schemas will regenerate when this file changes
// Common color application schema
const ColorApplicationSchema = z.object({
  collection_id: z.string().describe("ID of the color collection to use"),
  palette_id: z
    .string()
    .describe("ID of the color palette within the collection"),
});

// Conditional formatting schema
const ConditionalFormattingSchema = z.object({
  type: z.string().describe("Type of conditional formatting rule"),
  value: z
    .any()
    .nullable()
    .describe("Value to compare against for the formatting rule"),
  background_color: z
    .string()
    .optional()
    .describe("Background color to apply when condition is met"),
  font_color: z
    .string()
    .optional()
    .describe("Font color to apply when condition is met"),
  color_application: ColorApplicationSchema.optional().describe(
    "Color application settings"
  ),
  bold: z
    .boolean()
    .optional()
    .describe("Apply bold formatting when condition is met"),
  italic: z
    .boolean()
    .optional()
    .describe("Apply italic formatting when condition is met"),
  strikethrough: z
    .boolean()
    .optional()
    .describe("Apply strikethrough formatting when condition is met"),
  fields: z
    .any()
    .nullable()
    .optional()
    .describe("Fields to apply the formatting to"),
});

// Dynamic field schema
const DynamicFieldSchema = z.object({
  _kind_hint: z.string().optional().describe("Hint about the kind of field"),
  _type_hint: z.string().optional().describe("Hint about the type of field"),
  based_on: z
    .string()
    .optional()
    .describe("Field this dynamic field is based on"),
  expression: z
    .string()
    .optional()
    .describe("Expression for calculating the dynamic field"),
  label: z.string().optional().describe("Display label for the dynamic field"),
  measure: z.string().optional().describe("Measure name for the dynamic field"),
  type: z.string().optional().describe("Type of the dynamic field"),
  value_format: z.any().optional().describe("Formatting for the field values"),
  value_format_name: z
    .string()
    .optional()
    .describe("Name of the value format to apply"),
  table_calculation: z
    .string()
    .optional()
    .describe("Table calculation expression"),
  category: z
    .string()
    .optional()
    .describe("Category classification for the field"),
});

// Base element schema with common properties
const BaseElementSchema = z
  .object({
    title: z
      .string()
      .optional()
      .describe("Display title for the dashboard element"),
    name: z
      .string()
      .optional()
      .describe("Internal name identifier for the element"),
    type: z
      .string()
      .describe(
        "Type of dashboard element (looker_grid, single_value, text, etc.)"
      ),
    row: z.number().optional().describe("Row position for grid layout"),
    col: z.number().optional().describe("Column position for grid layout"),
    width: z.number().optional().describe("Width of the element"),
    height: z.number().optional().describe("Height of the element"),
    note_state: z
      .string()
      .optional()
      .describe("State of any notes attached to the element"),
    note_display: z.string().optional().describe("Display setting for notes"),
    note_text: z.string().optional().describe("Text content of notes"),
    listen: z
      .record(z.string())
      .optional()
      .describe("Filter listening configuration"),
    defaults_version: z
      .number()
      .optional()
      .describe("Version of default settings"),
  })
  .catchall(z.any()); // Allow additional properties

// Looker Grid element schema
const LookerGridElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_grid"),
  model: z.string().optional().describe("Model name for the data source"),
  explore: z.string().optional().describe("Explore name for the data source"),
  fields: z
    .array(z.string())
    .optional()
    .describe("Array of field names to display"),
  limit: z.number().optional().describe("Maximum number of rows to display"),
  column_limit: z
    .number()
    .optional()
    .describe("Maximum number of columns to display"),
  show_view_names: z
    .boolean()
    .optional()
    .describe("Show view names in column headers"),
  show_row_numbers: z
    .boolean()
    .optional()
    .describe("Show row numbers in the grid"),
  transpose: z.boolean().optional().describe("Transpose rows and columns"),
  truncate_text: z.boolean().optional().describe("Truncate long text in cells"),
  hide_totals: z.boolean().optional().describe("Hide total rows"),
  hide_row_totals: z.boolean().optional().describe("Hide row totals"),
  size_to_fit: z
    .boolean()
    .optional()
    .describe("Automatically size columns to fit content"),
  table_theme: z.string().optional().describe("Visual theme for the table"),
  limit_displayed_rows: z
    .boolean()
    .optional()
    .describe("Limit the number of displayed rows"),
  enable_conditional_formatting: z
    .boolean()
    .optional()
    .describe("Enable conditional formatting for the grid"),
  header_text_alignment: z
    .string()
    .optional()
    .describe("Text alignment for column headers"),
  header_font_size: z
    .union([z.string(), z.number()])
    .optional()
    .describe("Font size for column headers"),
  rows_font_size: z
    .union([z.string(), z.number()])
    .optional()
    .describe("Font size for data rows"),
  conditional_formatting_include_totals: z
    .boolean()
    .optional()
    .describe("Include totals in conditional formatting"),
  conditional_formatting_include_nulls: z
    .boolean()
    .optional()
    .describe("Include null values in conditional formatting"),
  color_application: ColorApplicationSchema.optional().describe(
    "Color application settings"
  ),
  show_sql_query_menu_options: z
    .boolean()
    .optional()
    .describe("Show SQL query menu options"),
  show_totals: z.boolean().optional().describe("Show total rows"),
  show_row_totals: z.boolean().optional().describe("Show row totals"),
  truncate_header: z.boolean().optional().describe("Truncate header text"),
  minimum_column_width: z
    .number()
    .optional()
    .describe("Minimum width for columns"),
  series_labels: z
    .record(z.string())
    .optional()
    .describe("Custom labels for data series"),
  series_cell_visualizations: z
    .record(z.any())
    .optional()
    .describe("Cell visualization settings for series"),
  header_font_color: z
    .string()
    .optional()
    .describe("Font color for column headers"),
  header_background_color: z
    .string()
    .optional()
    .describe("Background color for column headers"),
  custom_color_enabled: z
    .boolean()
    .optional()
    .describe("Enable custom color settings"),
  show_single_value_title: z
    .boolean()
    .optional()
    .describe("Show title for single value elements"),
  show_comparison: z.boolean().optional().describe("Show comparison data"),
  comparison_type: z
    .string()
    .optional()
    .describe("Type of comparison to display"),
  comparison_reverse_colors: z
    .boolean()
    .optional()
    .describe("Reverse colors for comparison display"),
  show_comparison_label: z
    .boolean()
    .optional()
    .describe("Show labels for comparison data"),
  hidden_fields: z.array(z.string()).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Single Value element schema
const SingleValueElementSchema = BaseElementSchema.extend({
  type: z.literal("single_value"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Text element schema
const TextElementSchema = BaseElementSchema.extend({
  type: z.literal("text"),
  title_text: z.string().optional().describe("Title text for the text element"),
  body_text: z
    .string()
    .optional()
    .describe("Body text content for the text element"),
});

// Looker Line element schema
const LookerLineElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_line"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Area element schema
const LookerAreaElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_area"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Bar element schema
const LookerBarElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_bar"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Column element schema
const LookerColumnElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_column"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Donut Multiples element schema
const LookerDonutMultiplesElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_donut_multiples"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Pie element schema
const LookerPieElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_pie"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Scatter element schema
const LookerScatterElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_scatter"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Map element schema
const LookerMapElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_map"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Timeline element schema
const LookerTimelineElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_timeline"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Funnel element schema
const LookerFunnelElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_funnel"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Looker Single Record element schema
const LookerSingleRecordElementSchema = BaseElementSchema.extend({
  type: z.literal("looker_single_record"),
  model: z.string().optional(),
  explore: z.string().optional(),
  fields: z.array(z.string()).optional(),
  limit: z.number().optional(),
  column_limit: z.number().optional(),
  custom_color_enabled: z.boolean().optional(),
  show_single_value_title: z.boolean().optional(),
  show_comparison: z.boolean().optional(),
  comparison_type: z.string().optional(),
  comparison_reverse_colors: z.boolean().optional(),
  show_comparison_label: z.boolean().optional(),
  enable_conditional_formatting: z.boolean().optional(),
  conditional_formatting_include_totals: z.boolean().optional(),
  conditional_formatting_include_nulls: z.boolean().optional(),
  comparison_label: z.string().optional(),
  conditional_formatting: z.array(ConditionalFormattingSchema).optional(),
  hidden_fields: z.array(z.string()).optional(),
  show_view_names: z.boolean().optional(),
  show_row_numbers: z.boolean().optional(),
  transpose: z.boolean().optional(),
  truncate_text: z.boolean().optional(),
  hide_totals: z.boolean().optional(),
  hide_row_totals: z.boolean().optional(),
  size_to_fit: z.boolean().optional(),
  table_theme: z.string().optional(),
  limit_displayed_rows: z.boolean().optional(),
  header_text_alignment: z.string().optional(),
  header_font_size: z.union([z.string(), z.number()]).optional(),
  rows_font_size: z.union([z.string(), z.number()]).optional(),
  sorts: z.array(z.string()).optional(),
  filters: z.record(z.string()).optional(),
  fill_fields: z.array(z.string()).optional(),
  pivots: z.array(z.string()).optional(),
  dynamic_fields: z.array(DynamicFieldSchema).optional(),
  y_axes: z.array(z.any()).optional(),
  x_axis_gridlines: z.boolean().optional(),
  y_axis_gridlines: z.boolean().optional(),
  show_y_axis_labels: z.boolean().optional(),
  show_y_axis_ticks: z.boolean().optional(),
  y_axis_tick_density: z.string().optional(),
  y_axis_tick_density_custom: z.number().optional(),
  show_x_axis_label: z.boolean().optional(),
  show_x_axis_ticks: z.boolean().optional(),
  y_axis_scale_mode: z.string().optional(),
  x_axis_reversed: z.boolean().optional(),
  y_axis_reversed: z.boolean().optional(),
  plot_size_by_field: z.boolean().optional(),
  trellis: z.string().optional(),
  stacking: z.string().optional(),
  legend_position: z.string().optional(),
  point_style: z.string().optional(),
  show_value_labels: z.boolean().optional(),
  label_density: z.number().optional(),
  x_axis_scale: z.string().optional(),
  y_axis_combined: z.boolean().optional(),
  ordering: z.string().optional(),
  show_null_labels: z.boolean().optional(),
  show_totals_labels: z.boolean().optional(),
  show_silhouette: z.boolean().optional(),
  totals_color: z.string().optional(),
  show_null_points: z.boolean().optional(),
  interpolation: z.string().optional(),
  x_axis_zoom: z.boolean().optional(),
  y_axis_zoom: z.boolean().optional(),
  limit_displayed_rows_values: z.any().optional(),
  hidden_pivots: z.record(z.any()).optional(),
  series_colors: z.record(z.string()).optional(),
  temperature: z.number().optional(),
  prompt: z.string().optional(),
  query: z.string().optional(),
  insightImage: z.string().optional(),
  map: z.string().optional(),
  map_projection: z.string().optional(),
  quantize_colors: z.boolean().optional(),
  colors: z.array(z.string()).optional(),
  hidden_points_if_no: z.array(z.string()).optional(),
  ui_config: z.any().optional(),
  allow_multiple_values: z.boolean().optional(),
  required: z.boolean().optional(),
  listens_to_filters: z.array(z.string()).optional(),
  field: z.string().optional(),
});

// Extension element schema
const ExtensionElementSchema = BaseElementSchema.extend({
  type: z.literal("extension"),
  extension_id: z.string().optional().describe("ID of the extension to load"),
});

// Union of all element types
const DashboardElementSchema = z
  .union([
    LookerGridElementSchema,
    SingleValueElementSchema,
    TextElementSchema,
    LookerLineElementSchema,
    LookerAreaElementSchema,
    LookerBarElementSchema,
    LookerColumnElementSchema,
    LookerDonutMultiplesElementSchema,
    LookerPieElementSchema,
    LookerScatterElementSchema,
    LookerMapElementSchema,
    LookerTimelineElementSchema,
    LookerFunnelElementSchema,
    LookerSingleRecordElementSchema,
    ExtensionElementSchema,
  ])
  .or(z.any()); // Fallback to any for unknown element types

// Filter schema
const DashboardFilterSchema = z.object({
  name: z.string().optional().describe("The internal name of the filter"),
  title: z.string().optional().describe("The display title for the filter"),
  type: z
    .string()
    .optional()
    .describe(
      "The type of filter (field_filter | number_filter | date_filter | string_filter)"
    ),
  default_value: z
    .any()
    .optional()
    .describe("Default value for the filter using Looker filter expression"),
  allow_multiple_values: z
    .boolean()
    .optional()
    .describe("Allow users to select multiple values for this filter"),
  required: z
    .boolean()
    .optional()
    .describe("Make this filter required for dashboard access"),
  ui_config: z
    .any()
    .optional()
    .describe(
      "UI configuration for the filter including type, display, and options"
    ),
  model: z
    .string()
    .optional()
    .describe("Model name for field_filter type filters"),
  explore: z
    .string()
    .optional()
    .describe("Explore name for field_filter type filters"),
  listens_to_filters: z
    .array(z.string())
    .optional()
    .describe("Filter names that this filter listens to for suggestions"),
  field: z
    .string()
    .optional()
    .describe(
      "Fully scoped field name (view_name.field_name) for field_filter type filters"
    ),
});

// Row schema for grid layout
const DashboardRowSchema = z.object({
  elements: z
    .array(z.string())
    .optional()
    .describe(
      "Define the elements that should go into a row of a layout: grid dashboard"
    ),
  height: z
    .number()
    .optional()
    .describe("Define the height of a row for a layout: grid dashboard"),
});

// Embed style schema for embedded dashboards
const EmbedStyleSchema = z.object({
  background_color: z
    .string()
    .optional()
    .describe("Sets the color of the background of an embedded dashboard"),
  show_title: z
    .boolean()
    .optional()
    .describe(
      "Specifies whether the embedded dashboard title is visible to users"
    ),
  title_color: z
    .string()
    .optional()
    .describe("Sets the color of the title of an embedded dashboard"),
  show_filters_bar: z
    .boolean()
    .optional()
    .describe(
      "Specifies whether the embedded dashboard filters are visible to users"
    ),
  tile_background_color: z
    .string()
    .optional()
    .describe(
      "Sets the color of the background of all tiles on an embedded dashboard"
    ),
  tile_text_color: z
    .string()
    .optional()
    .describe("Sets the color of text on all tiles on an embedded dashboard"),
  text_tile_text_color: z
    .string()
    .optional()
    .describe(
      "Sets the color of text on all text tiles on an embedded dashboard"
    ),
});

// Main dashboard schema
export const LookMLDashboardSchema = z
  .object({
    title: z
      .string()
      .optional()
      .describe("Change the way a dashboard name appears to users"),
    layout: z
      .string()
      .optional()
      .describe(
        "Define the way that the dashboard will place elements (tile | static | grid | newspaper)"
      ),
    preferred_viewer: z
      .string()
      .optional()
      .describe("This parameter is ignored"),
    crossfilter_enabled: z
      .boolean()
      .optional()
      .describe("Enable or disable cross-filtering for a dashboard"),
    description: z
      .string()
      .optional()
      .describe(
        "Add a description that can be viewed in the Dashboard Details panel or in a folder set to list view"
      ),
    preferred_slug: z
      .string()
      .optional()
      .describe("Custom URL slug for the dashboard"),
    enable_viz_full_screen: z
      .boolean()
      .optional()
      .describe(
        "Define whether dashboard viewers can see dashboard tiles in full-screen and expanded views"
      ),
    extends: z
      .string()
      .optional()
      .describe("Base the LookML dashboard on another LookML dashboard"),
    extension: z
      .boolean()
      .optional()
      .describe("Require that the dashboard is extended by another dashboard"),
    rows: z
      .array(DashboardRowSchema)
      .optional()
      .describe(
        "Define the elements that should go into each row of a layout: grid dashboard"
      ),
    tile_size: z
      .number()
      .optional()
      .describe("Define the size of a tile for a layout: tile dashboard"),
    width: z
      .number()
      .optional()
      .describe(
        "Define the width of the dashboard for a layout: static dashboard"
      ),
    refresh: z
      .string()
      .optional()
      .describe(
        "Set the interval on which dashboard elements will automatically refresh (seconds | minutes | hours | days)"
      ),
    auto_run: z
      .boolean()
      .optional()
      .describe(
        "Determine whether dashboards run automatically when initially opened or reloaded"
      ),
    filters_bar_collapsed: z
      .boolean()
      .optional()
      .describe(
        "Set the dashboard filter bar as default collapsed or expanded"
      ),
    filters_location_top: z
      .boolean()
      .optional()
      .describe("Position the filters bar at the top of the dashboard"),
    embed_style: EmbedStyleSchema.optional().describe(
      "Customize the appearance of an embedded dashboard"
    ),
    elements: z
      .array(DashboardElementSchema)
      .optional()
      .describe("Define the elements that will make up a dashboard"),
    filters: z
      .array(DashboardFilterSchema)
      .optional()
      .describe("Define dashboard filters for user interaction"),
  })
  .catchall(z.any()); // Allow additional properties

// Schema for a dashboard document (the wrapper structure)
export const LookMLDashboardDocumentSchema = z
  .object({
    dashboard: z.string(),
  })
  .and(LookMLDashboardSchema);

// Schema for multiple dashboard documents
export const LookMLDashboardDocumentsSchema = z.array(
  LookMLDashboardDocumentSchema
);

// Export the main schema
export const LookMLDashboard = LookMLDashboardSchema;
