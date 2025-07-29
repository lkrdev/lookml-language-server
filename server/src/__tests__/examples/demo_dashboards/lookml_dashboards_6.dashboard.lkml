---
- dashboard: customer_loyalty_snapshot
  title: Customer Loyalty Snapshot
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: zSUN1SGEFIpMWVWh6tXUGc
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot
  title: Customer Loyalty Snapshot
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8cN0ymPaZG2FX6kNJhjejZ
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [users.email, users.state, users.age, order_items.total_sale_price]
    filters:
      products.brand: Calvin Klein
      order_items.created_date: 30 days
      order_items.total_sale_price: ">100"
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:
  - title: New Tile
    name: New Tile (2)
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [order_items.30_day_repeat_purchase_rate, order_items.count_with_repeat_purchase_within_30d,
      order_items.total_sale_price, order_items.average_spend_per_user, users.state]
    sorts: [order_items.30_day_repeat_purchase_rate desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:
  - title: New Tile
    name: New Tile (3)
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_revenue,
      user_order_facts.lifetime_orders, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: 18 months
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:
  - title: New Tile
    name: New Tile (4)
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [users.email, users.state, users.age, order_items.total_sale_price]
    filters:
      order_items.created_date: 30 days
      user_order_facts.repeat_customer: 'Yes'
      products.brand: Calvin Klein
      order_items.total_sale_price: ">100"
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:

---
- dashboard: customer_loyalty_snapshot
  title: Customer Loyalty Snapshot
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: snnGrho33H0xcL3LlTw86M
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot
  title: Customer Loyalty Snapshot
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: GqtRuPxCjsAvqBxdXmUZIX
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot
  title: Customer Loyalty Snapshot
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: KUI6WFPW6WL9PDSwoW9ZBI
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Gemini
    name: Dashboard Insights Powered by Gemini
    row: 0
    col: 0
    width: 9
    height: 21
  - title: Orders Count Per Month
    name: Orders Count Per Month
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.order_count, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
      is_disabled: true
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: order_items.order_count
        forecast_n: 3
        forecast_interval: month
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    row: 14
    col: 9
    width: 15
    height: 7

---
- dashboard: customer_loyalty_snapshot
  title: Customer Loyalty Snapshot
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: vqnb2jgCHXulmHW0blN3tf
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_chen
  title: Customer Loyalty Snapshot (Chen)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: yo0divph5IjyG2gxcAhjSM
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 8
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 3acwqgFm5L7YR3Y2XsD486
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NJe1xYUygzAAmoC0T2k9CR
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14
  - type: extension
    extension_id: genai_extensions::dashboard-summarization-staging
    title: 'Staging: Dashboard Insights Powered by Vertex AI'
    name: 'Staging: Dashboard Insights Powered by Vertex AI'
    row: 14
    col: 0
    width: 8
    height: 6

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: RVbw5vIgTA8E69Ejb1BxIB
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 7HRvtX4ki4Lk7jIQ92tQDE
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 46GbHu2LleKwsbN7ybYcrb
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: aAO6Ba6BprmdGeOnA9MazX
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: pYgDcG2Mo0Dzm8czVUd7h6
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: xN3kJYiqPOk4SKvUbChbRD
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ljBSD429uHoI8Rsc8NN81B
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LQEqfT0gtvbTkmG23Hg99T
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.id, users.name, users.email, users.age, users.created_date, order_items.count,
      order_items.average_sale_price]
    filters:
      users.created_date: 7 days
      users.state: ''
      users.city: ''
      users.traffic_source: ''
      users.gender: ''
      order_items.created_date: 30 days
      distribution_centers.location: ''
      users.country: ''
      order_items.average_sale_price: ''
    sorts: [users.created_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: g9J1BMAeN9JVKvQKfgCRgX
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: wNtgkXXIqZTol4G2bK29at
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen:
      State: users.state
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      State: users.state
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      State: users.state
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen:
      State: users.state
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen:
      State: users.state
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.state

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: S1gycu6MxcnnyN3W7ORrWg
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: yCQZP8128Gpzeby9kbNzEg
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_copy
  title: Customer Loyalty Snapshot (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DHZL4DvQgAnemaFn7SiRHA
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 1 month ago for 1 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 17
    width: 7
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 14

---
- dashboard: customer_loyalty_snapshot_extension_tile
  title: Customer Loyalty Snapshot (Extension tile)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5enJavofbUWpjMmUzgGtRO
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 7
    width: 6
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 13
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 7
    width: 9
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 16
    width: 8
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 6
    height: 14

---
- dashboard: customer_loyalty_snapshot_hms
  title: Customer Loyalty Snapshot (HMS)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: YJUKW557r0oarjeX239KG6
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 27
    col: 13
    width: 11
    height: 4
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 23
    col: 13
    width: 11
    height: 4
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 12
    col: 0
    width: 13
    height: 8
  - title: Customer Geography Breakdown
    name: Customer Geography Breakdown
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [users.state, users.count]
    filters:
      order_items.created_date: ''
      users.country: USA
    sorts: [users.count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    colors: ["#4285F4"]
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
      options:
        steps: 5
        reverse: true
    series_colors: {}
    series_labels: {}
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    y_axes: []
    hidden_pivots: {}
    listen: {}
    row: 23
    col: 0
    width: 13
    height: 14
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Executive Summary","color":"hsl(0,
      0%, 56%)"},{"text":" | "},{"text":"2024","color":"hsl(0, 86%, 47%)","bold":true}]},{"type":"h1","children":[{"text":"State
      of Cyber Security"}],"id":"khwcm"}]'
    rich_content_json: '{"format":"slate"}'
    row: 3
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://mms.businesswire.com/media/20250115272711/en/2353641/5/diligent_logo_fullcolor_rgb.jpg?download=1">
    row: 0
    col: 0
    width: 3
    height: 3
  - title: Tickets this month
    name: Tickets this month
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.created_month]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_year: 12 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${ticket.count}/offset(${ticket.count},1) -1 "
      label: Ticket difference calc
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ticket_difference_calc
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: vs. last month
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 6
    col: 13
    width: 11
    height: 6
  - title: Customers Acquired
    name: Customers Acquired
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.created_quarter_of_year, users.created_year, users.count]
    filters:
      users.created_year: 12 months
    sorts: [users.created_year desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '15'
    label_value_format: ''
    series_colors:
      users.count: "#CBC3E3"
    label_color: ["#00000"]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    comparison_label: vs. last quarter
    conditional_formatting: [{type: less than, value: 0, background_color: "#1A73E8",
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 37
    col: 0
    width: 13
    height: 10
  - title: New Tile
    name: New Tile
    model: sfdc_demo
    explore: ticket
    type: genai_extensions::query_insights
    fields: [ticket.count, ticket.created_month]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_year: 12 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${ticket.count}/offset(${ticket.count},1) -1 "
      label: Ticket difference calc
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ticket_difference_calc
      _type_hint: number
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. last month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    title_hidden: true
    listen: {}
    row: 6
    col: 0
    width: 13
    height: 6
  - title: New Tile
    name: New Tile (2)
    model: sfdc_demo
    explore: ticket
    type: looker_area
    fields: [issue.created_month, issue.count]
    fill_fields: [issue.created_month]
    sorts: [issue.created_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '15'
    series_colors:
      issue.count: "#9334E6"
    label_color: ["#0000"]
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Current Repeat Purchase Rate (Copy)
    name: Current Repeat Purchase Rate (Copy)
    model: thelook
    explore: order_items
    type: genai_extensions::query_insights
    fields: [order_items.30_day_repeat_purchase_rate, order_items.created_month]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen: {}
    row: 15
    col: 13
    width: 11
    height: 5
  - title: Current Repeat Purchase Rate
    name: Current Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, order_items.created_month]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 12
    col: 13
    width: 11
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"hhb4l"},{"type":"h2","children":[{"text":"Key
      metrics and insights","bold":true}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 20
    col: 0
    width: 24
    height: 3
  - title: Average Lifetime Value (Copy)
    name: Average Lifetime Value (Copy)
    model: thelook
    explore: order_items
    type: genai_extensions::query_insights
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders,
      order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_year: 1 years
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Average Orders
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    y_axes: []
    title_hidden: true
    listen: {}
    row: 31
    col: 13
    width: 11
    height: 6
  - title: Orders Each Month
    name: Orders Each Month
    model: thelook
    explore: order_items
    type: looker_area
    fields: [order_items.order_count, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 6 months
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '15'
    label_value_format: ''
    series_colors:
      order_items.order_count: "#CBC3E3"
    label_color: ["#000000"]
    defaults_version: 1
    listen: {}
    row: 37
    col: 13
    width: 11
    height: 10

---
- dashboard: customer_loyalty_snapshot_textbox
  title: Customer Loyalty Snapshot (textbox)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: X8uPfbXyHE5RC6h93Vq3V8
  elements:
  - title: Customer Loyalty Snapshot
    name: Customer Loyalty Snapshot
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_order_cost, average_of_items_in_order]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_order_cost
      based_on: order_facts.order_cost
      expression: ''
      label: Average of Order Cost
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Average of Items in Order
      value_format:
      value_format_name: decimal_2
      based_on: order_facts.items_in_order
      _kind_hint: measure
      measure: average_of_items_in_order
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Items
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 5
  - title: Average Lifetime Value
    name: Average Lifetime Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [average_of_lifetime_revenue, user_order_facts.average_lifetime_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_lifetime_revenue
      based_on: user_order_facts.lifetime_revenue
      expression: ''
      label: Average of Lifetime Revenue
      type: average
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: embed-demo, palette_id: embed-demo-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 6
    width: 5
    height: 5
  - title: 30-day Repeat Purchase Rate
    name: 30-day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate, average_of_number_subsequent_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Average of Number Subsequent Orders
      value_format:
      value_format_name: decimal_2
      based_on: repeat_purchase_facts.number_subsequent_orders
      _kind_hint: measure
      measure: average_of_number_subsequent_orders
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    comparison_label: Average Subsequent Orders
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285f4",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 11
    width: 6
    height: 5
  - title: Loyalty Longevity Analysis
    name: Loyalty Longevity Analysis
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.traffic_source, order_items.months_since_signup, users.count]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0,12]"
      users.created_month: 12 month ago for 12 month
    sorts: [users.traffic_source, order_items.months_since_signup]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.count} / max(${users.count})"
      label: Pct Still Active
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pct_still_active
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [users.count]
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: 'This chart shows an analysis of how long customers remain loyal after
      their first purchase, by traffic acquisition source cohort. This is how long
      customers continue purchasing products from the business since becoming a customer. '
    listen: {}
    row: 5
    col: 0
    width: 9
    height: 9
  - title: Loyal Customers
    name: Loyal Customers
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      order_items.created_date: ''
    sorts: [user_order_facts.lifetime_orders desc, user_order_facts.lifetime_revenue
        desc, order_items.30_day_repeat_purchase_rate desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ["#4285F4"]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 5
    col: 9
    width: 8
    height: 9
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Sales Rep''s Insights","color":"hsl(210,
      70%, 61%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"w8xk7"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"xsi7z","children":[{"text":""},{"type":"a","url":"https://demowest.cloud.looker.com/projects/thelook_ecomm/files/views/01_order_items.view.lkml","children":[{"text":"One"}],"id":"hnb7r"},{"text":"
      of the reasons sales were down "},{"text":"this","bold":true},{"text":" "},{"text":"quarter","italic":true},{"text":"
      is ……"}]}],"id":"m9bu9"}],"id":"z2vz8"},{"type":"p","id":"iwsu9","children":[{"text":""}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 17
    width: 6
    height: 5
