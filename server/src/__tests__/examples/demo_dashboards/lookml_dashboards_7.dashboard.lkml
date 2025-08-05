---
- dashboard: customer_loyalty_snapshot__chen
  title: Customer Loyalty Snapshot - Chen
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: T0CjWlP3aVLbqahMJUGdTe
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
    col: 4
    width: 6
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
    col: 10
    width: 6
    height: 4
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
    col: 16
    width: 6
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
    row: 4
    col: 10
    width: 6
    height: 12
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
    row: 4
    col: 16
    width: 6
    height: 12
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 4
    height: 20

---
- dashboard: customer_loyalty_snapshot_current_month
  title: Customer Loyalty Snapshot Current Month
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 1 minute
  preferred_slug: F2f6DUDzZBoq4Yg2di5Sf7
  elements:
  - title: Average Order Volume
    name: Average Order Volume
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_month, average_of_items_in_order, order_items.total_sale_price]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 month ago for 12 month
    sorts: [average_of_items_in_order]
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
    hidden_pivots: {}
    y_axes: []
    listen:
      Country: users.country
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
      Country: users.country
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
      Country: users.country
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
      Country: users.country
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
      Country: users.country
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
  - name: Country
    title: Country
    type: field_filter
    default_value: USA
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - USA
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.country
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
    listens_to_filters: [Country]
    field: users.state

---
- dashboard: customer_segment_deepdive
  title: Customer Segment Deep-dive
  layout: newspaper
  description: ''
  preferred_slug: rPiqpL214a2t0oOeO58gso
  elements:
  - title: Customer Coverage
    name: Customer Coverage
    model: retail_block_model
    explore: transactions
    type: looker_map
    fields: [customers.location, transactions__line_items.total_sales]
    filters:
      transactions.transaction_date: 12 months
      customers.country: USA
      customers.location_bin_level: '9'
      customers.location: inside box from 55.7765730186677, -157.50000000000003 to
        21.94304553343818, -45
    sorts: [transactions__line_items.total_sales desc]
    limit: 5000
    column_limit: 50
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: dark
    map_position: custom
    map_latitude: 37.96152331396614
    map_longitude: -96.7236328125
    map_zoom: 4
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Sales
    name: Sales
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions__line_items.total_quantity]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
    sorts: [transactions.selected_comparison desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: vs_ly
      label: vs LY
      expression: "${transactions__line_items.total_sales}/offset(${transactions__line_items.total_sales},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#5A30C2"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [transactions__line_items.average_basket_size, transactions__line_items.total_quantity,
      transactions.number_of_transactions]
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
      Date Range: transactions.date_comparison_filter
    row: 2
    col: 12
    width: 6
    height: 4
  - title: Transactions
    name: Transactions
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions__line_items.total_quantity]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
    sorts: [transactions.selected_comparison desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: vs_ly
      label: vs LY
      expression: "${transactions.number_of_transactions}/offset(${transactions.number_of_transactions},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#5A30C2"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [transactions__line_items.average_basket_size, transactions__line_items.total_sales,
      transactions__line_items.total_quantity]
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
      Date Range: transactions.date_comparison_filter
    row: 2
    col: 18
    width: 6
    height: 4
  - title: Basket Size
    name: Basket Size
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions__line_items.total_quantity]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
    sorts: [transactions.selected_comparison desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: vs_ly
      label: vs LY
      expression: "${transactions__line_items.average_basket_size}/offset(${transactions__line_items.average_basket_size},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#5A30C2"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [transactions__line_items.total_sales, transactions__line_items.total_quantity,
      transactions.number_of_transactions]
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
      Date Range: transactions.date_comparison_filter
    row: 6
    col: 12
    width: 6
    height: 4
  - title: Quantity
    name: Quantity
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions__line_items.total_quantity]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
    sorts: [transactions.selected_comparison desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: vs_ly
      label: vs LY
      expression: "${transactions__line_items.total_quantity}/offset(${transactions__line_items.total_quantity},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#5A30C2"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [transactions__line_items.total_sales, transactions.number_of_transactions,
      transactions__line_items.average_basket_size]
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
      Date Range: transactions.date_comparison_filter
    row: 6
    col: 18
    width: 6
    height: 4
  - title: Customer Segment
    name: Customer Segment
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [customer_clustering_prediction.customer_segment]
    filters:
      transactions.transaction_date: 30 days
    sorts: [customer_clustering_prediction.customer_segment]
    limit: 500
    column_limit: 50
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div align="center">
      <div><img src="https://upload.wikimedia.org/wikipedia/en/thumb/8/83/Salesforce_logo.svg/1200px-Salesforce_logo.svg.png" height="150"></div>
      <div><a href="https://retail-demo-app-idhn2cvrpq-uc.a.run.app/api/exportToSalesforce" target="_blank"><button style="color:white; padding: 10px 20px; background-color: #0088bd; border: none; font-size: 16px;">Create campaign segment</button></a></div>
      </div>
    row: 12
    col: 18
    width: 6
    height: 6
  - title: Potential Value from 10% Reactivation
    name: Potential Value from 10% Reactivation
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions__line_items.total_sales]
    filters:
      transactions.transaction_date: 12 months
      customer_facts.customer_spend_trend_past_year: "<-0.1"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: reactivation_threshold
      label: Reactivation Threshold
      expression: '0.1'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: potential_value
      label: Potential Value
      expression: "${transactions__line_items.total_sales}*${reactivation_threshold}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#49c244"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      customer_facts.customer_spend_trend_past_year:
        is_active: true
        palette:
          palette_id: retailer-scheme-diverging-0
          collection_id: retailer-scheme
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: dark
    map_position: custom
    map_latitude: 37.96152331396614
    map_longitude: -96.7236328125
    map_zoom: 4
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_fields: [reactivation_threshold, transactions__line_items.total_sales]
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
    row: 10
    col: 18
    width: 6
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      **Recommended Action ?**
      These are our previously loyal customers in our segment, who have dropped off over the past year. Click the button on the right to create a campaign segment in Salesforce to prepare an email campaign for the CRM manager.
    row: 10
    col: 0
    width: 3
    height: 8
  - title: Customers for Reactivation Campaign
    name: Customers for Reactivation Campaign
    model: retail_block_model
    explore: transactions
    type: looker_grid
    fields: [customer_facts.customer_id, customer_facts.customer_spend_trend_past_year,
      customers.email, customers.gender, customers.age, customers.postcode]
    filters:
      transactions.transaction_date: 12 months
      customer_facts.customer_spend_trend_past_year: "<-0.1"
    sorts: [customer_facts.customer_spend_trend_past_year]
    limit: 500
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      customer_facts.customer_spend_trend_past_year:
        is_active: true
        palette:
          palette_id: 50d44102-be13-bd23-eed2-8000589f3610
          collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
          custom_colors:
          - "#ab2824"
          - "#ffffff"
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Customer Segment: customer_clustering_prediction.customer_segment
    row: 10
    col: 3
    width: 15
    height: 8
  filters:
  - name: Customer Segment
    title: Customer Segment
    type: field_filter
    default_value: Emerging Millennials 🥑
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    model: retail_block_model
    explore: transactions
    listens_to_filters: []
    field: customer_clustering_prediction.customer_segment
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover

---
- dashboard: customer_success_overview
  title: Customer Success Overview
  layout: newspaper
  description: ''
  preferred_slug: 8SMc0Aj4eQO5orarr0UFXe
  elements:
  - title: Number of Accounts
    name: Number of Accounts
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [account.count]
    filters:
      account.type: Customer
    limit: 500
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 3
    col: 3
    width: 10
    height: 3
  - title: Active ARR
    name: Active ARR
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr]
    filters:
      opportunity.is_active_contract: 'Yes'
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
    value_format: ''
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 6
    col: 3
    width: 5
    height: 2
  - name: "<b>Accounts Overview</b>"
    type: text
    title_text: "<b>Accounts Overview</b>"
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Account Activity
    type: text
    title_text: Account Activity
    row: 21
    col: 0
    width: 24
    height: 3
  - title: Upcoming Renewal Opportunities
    name: Upcoming Renewal Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_grid
    fields: [account.next_contract_renewal_date, account.account_name, opportunity_line_item.total_arr,
      opportunity.renewal_opportunity_id, sales_rep.name]
    filters:
      opportunity.is_active_contract: 'Yes'
      opportunity_line_item.total_arr: ">0"
      account.next_contract_renewal_date: 0 days ago for 1 year
    sorts: [account.next_contract_renewal_date]
    limit: 500
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      opportunity_line_item.total_arr:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    listen:
      Customer Success Manager: csm.name
    row: 13
    col: 0
    width: 12
    height: 8
  - title: "$BNR"
    name: "$BNR"
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_date]
    fill_fields: [daily_active_accounts.calendar_date]
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    conditional_formatting: [{type: less than, value: 95, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Dollar base net retention tells how much ARR from accounts active 1
      year ago has been retained, values less than 100 means that you have decreased
      your active ARR, values over 100 means you have increased through upsells
    listen:
      Customer Success Manager: csm.name
    row: 6
    col: 8
    width: 5
    height: 2
  - name: "<b>Active Opportunities</b>"
    type: text
    title_text: "<b>Active Opportunities</b>"
    row: 10
    col: 0
    width: 24
    height: 3
  - title: Qualified Upsell Opportunities
    name: Qualified Upsell Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_grid
    fields: [account.account_name, opportunity_line_item.total_arr, opportunity.short_id,
      opportunity.stage_name, opportunity.close_date, sales_rep.name]
    filters:
      opportunity.type: Addon/Upsell
      opportunity.stage_name: "-Active Lead,-Closed Lost,-Closed Won"
    sorts: [opportunity.close_date desc]
    limit: 500
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      opportunity_line_item.total_arr:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    listen:
      Customer Success Manager: csm.name
    row: 13
    col: 12
    width: 12
    height: 8
  - title: Number of Accounts by Daily Chat Tier
    name: Number of Accounts by Daily Chat Tier
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_user_count.event_date, account.count, daily_account_tickets.number_chats_tier]
    pivots: [daily_account_tickets.number_chats_tier]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 30 days
      daily_account_tickets.number_chats_tier: "-Undefined"
    sorts: [daily_user_count.event_date desc, daily_account_tickets.number_chats_tier]
    limit: 500
    column_limit: 50
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
    stacking: normal
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    hidden_series: [TXX Undefined - account.count]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Urgent Tickets
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 32
    col: 0
    width: 12
    height: 11
  - title: Accounts with Poor Satisfaction Ratings
    name: Accounts with Poor Satisfaction Ratings
    model: sfdc_demo
    explore: daily_user_count
    type: single_value
    fields: [account.count]
    filters:
      daily_user_count.event_date: 30 days
      daily_account_tickets.csat: "<=2"
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#E57947"
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 27
    col: 0
    width: 6
    height: 5
  - title: Accounts with Urgent Support Tickets
    name: Accounts with Urgent Support Tickets
    model: sfdc_demo
    explore: daily_user_count
    type: single_value
    fields: [account.count]
    filters:
      daily_user_count.event_date: 30 days
      daily_account_tickets.urgent_tickets: ">=1"
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#FBB555"
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 27
    col: 6
    width: 6
    height: 5
  - name: ''
    type: text
    body_text: "<div class='alert alert-info'><font color='#282828' size='5'><center><b>Customer\
      \ Support</b></center></font></div>"
    row: 24
    col: 0
    width: 12
    height: 3
  - name: " (2)"
    type: text
    body_text: "<div class='alert alert-info'><font color='#282828' size='5'><center><b>Product\
      \ Usage</b></center></font></div>"
    row: 24
    col: 12
    width: 12
    height: 3
  - title: Accounts by % Active Users
    name: Accounts by % Active Users
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_client_usage.percent_active_tier, account.count, daily_user_count.event_date]
    pivots: [daily_client_usage.percent_active_tier]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 30 days
      daily_client_usage.percent_active_tier: "-Undefined"
    sorts: [daily_user_count.event_date desc, daily_client_usage.percent_active_tier]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: normal
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Below 25 - 0 - account.count,
            id: Below 25 - 0 - account.count, name: Below 25}, {axisId: 25 to 49 -
              1 - account.count, id: 25 to 49 - 1 - account.count, name: 25 to 49},
          {axisId: 50 to 74 - 2 - account.count, id: 50 to 74 - 2 - account.count,
            name: 50 to 74}, {axisId: 75 to 99 - 3 - account.count, id: 75 to 99 -
              3 - account.count, name: 75 to 99}, {axisId: 100 or Above - 4 - account.count,
            id: 100 or Above - 4 - account.count, name: 100 or Above}, {axisId: Undefined
              - 5 - account.count, id: Undefined - 5 - account.count, name: Undefined}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [Undefined - 5 - account.count]
    series_colors:
      Below 25 - 0 - account.count: "#E57947"
      25 to 49 - 1 - account.count: "#2196F3"
      50 to 74 - 2 - account.count: "#04b5cc"
      75 to 99 - 3 - account.count: "#4CAF50"
      Undefined - 5 - account.count: "#9E9E9E"
      100 or Above - 4 - account.count: "#FBB555"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 35
    col: 12
    width: 12
    height: 8
  - title: Accounts by Events per User Tier
    name: Accounts by Events per User Tier
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [account.count, daily_user_count.event_date, daily_client_usage.total_event_per_user_tier]
    pivots: [daily_client_usage.total_event_per_user_tier]
    fill_fields: [daily_user_count.event_date, daily_client_usage.total_event_per_user_tier]
    filters:
      daily_user_count.event_date: 30 days
      daily_client_usage.percent_active_tier: "-Undefined"
    sorts: [daily_user_count.event_date desc, daily_client_usage.total_event_per_user_tier]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: normal
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Below 25 - 0 - account.count,
            id: Below 25 - 0 - account.count, name: Below 25}, {axisId: 25 to 49 -
              1 - account.count, id: 25 to 49 - 1 - account.count, name: 25 to 49},
          {axisId: 50 to 74 - 2 - account.count, id: 50 to 74 - 2 - account.count,
            name: 50 to 74}, {axisId: 75 to 99 - 3 - account.count, id: 75 to 99 -
              3 - account.count, name: 75 to 99}, {axisId: 100 or Above - 4 - account.count,
            id: 100 or Above - 4 - account.count, name: 100 or Above}, {axisId: Undefined
              - 5 - account.count, id: Undefined - 5 - account.count, name: Undefined}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [Undefined - 5 - account.count]
    series_colors:
      Below 25 - 0 - account.count: "#E57947"
      25 to 49 - 1 - account.count: "#2196F3"
      50 to 74 - 2 - account.count: "#04b5cc"
      75 to 99 - 3 - account.count: "#4CAF50"
      Undefined - 5 - account.count: "#9E9E9E"
      100 or Above - 4 - account.count: "#FBB555"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 27
    col: 12
    width: 12
    height: 8
  - title: Accounts by Health Score
    name: Accounts by Health Score
    model: sfdc_demo
    explore: daily_user_count
    type: looker_pie
    fields: [account.count, daily_user_count.overall_health]
    filters:
      daily_user_count.event_date: 1 days ago for 1 days
    sorts: [account.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_colors:
      At Risk: "#FBB555"
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
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 3
    col: 13
    width: 8
    height: 7
  - title: Account Overview
    name: Account Overview
    model: sfdc_demo
    explore: daily_user_count
    type: looker_grid
    fields: [account.account_name, daily_user_count.average_health_score, daily_client_sessions.estimated_usage_time,
      daily_client_sessions.total_sessions, daily_client_usage.average_percent_active_users,
      daily_client_usage.average_distinct_users]
    filters:
      daily_user_count.event_date: 30 days
      account.account_name: "-NULL"
      account.type: Customer
    sorts: [daily_client_sessions.estimated_usage_time desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      daily_user_count.support_score:
        is_active: true
      daily_user_count.average_health_score:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    swap_axes: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Customer Success Manager: csm.name
    row: 43
    col: 0
    width: 24
    height: 11
  - title: Average $BNR for Team
    name: Average $BNR for Team
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_date,
      csm.name]
    filters:
      daily_active_accounts.calendar_date: 1 days
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 500
    dynamic_fields:
    - table_calculation: average_net_retention
      label: Average Net Retention
      expression: mean(${daily_active_accounts.net_retention})
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#E57947"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#aed5ff",
        font_color: "#f4fff4", color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date, daily_active_accounts.net_retention,
      csm.name]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Dollar base net retention tells how much ARR from accounts active 1
      year ago has been retained, values less than 100 means that you have decreased
      your active ARR, values over 100 means you have increased through upsells
    listen: {}
    row: 8
    col: 8
    width: 5
    height: 2
  - title: Average ARR for Team
    name: Average ARR for Team
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr, csm.name]
    filters:
      opportunity.is_active_contract: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: average_arr_for_team
      label: Average ARR for Team
      expression: mean(${opportunity_line_item.total_arr})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#aed5ff",
        font_color: "#f4fff9", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [opportunity_line_item.total_arr, csm.name]
    listen: {}
    row: 8
    col: 3
    width: 5
    height: 2
  filters:
  - name: Customer Success Manager
    title: Customer Success Manager
    type: field_filter
    default_value: Melissa Glaser
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: sfdc_demo
    explore: daily_user_count
    listens_to_filters: []
    field: csm.name

---
- dashboard: customer_success_overview_copy
  title: Customer Success Overview (copy)
  layout: newspaper
  description: ''
  preferred_slug: zr9dBBKy7ebx03UQ1YAKYB
  elements:
  - title: Number of Accounts
    name: Number of Accounts
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [account.count]
    filters:
      account.type: Customer
    limit: 500
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 3
    col: 3
    width: 10
    height: 3
  - title: Active ARR
    name: Active ARR
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr]
    filters:
      opportunity.is_active_contract: 'Yes'
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
    value_format: ''
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 6
    col: 3
    width: 5
    height: 2
  - name: "<b>Accounts Overview</b>"
    type: text
    title_text: "<b>Accounts Overview</b>"
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - title: "$BNR"
    name: "$BNR"
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_date]
    fill_fields: [daily_active_accounts.calendar_date]
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    conditional_formatting: [{type: less than, value: 95, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Dollar base net retention tells how much ARR from accounts active 1
      year ago has been retained, values less than 100 means that you have decreased
      your active ARR, values over 100 means you have increased through upsells
    listen:
      Customer Success Manager: csm.name
    row: 6
    col: 8
    width: 5
    height: 2
  - title: Accounts by Health Score
    name: Accounts by Health Score
    model: sfdc_demo
    explore: daily_user_count
    type: looker_pie
    fields: [account.count, daily_user_count.overall_health]
    filters:
      daily_user_count.event_date: 1 days ago for 1 days
    sorts: [account.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_colors:
      At Risk: "#FBB555"
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
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 3
    col: 13
    width: 8
    height: 7
  - title: Average $BNR for Team
    name: Average $BNR for Team
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_date,
      csm.name]
    filters:
      daily_active_accounts.calendar_date: 1 days
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 500
    dynamic_fields:
    - table_calculation: average_net_retention
      label: Average Net Retention
      expression: mean(${daily_active_accounts.net_retention})
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#E57947"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#aed5ff",
        font_color: "#f4fff4", color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date, daily_active_accounts.net_retention,
      csm.name]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Dollar base net retention tells how much ARR from accounts active 1
      year ago has been retained, values less than 100 means that you have decreased
      your active ARR, values over 100 means you have increased through upsells
    listen: {}
    row: 8
    col: 8
    width: 5
    height: 2
  - title: Average ARR for Team
    name: Average ARR for Team
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr, csm.name]
    filters:
      opportunity.is_active_contract: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: average_arr_for_team
      label: Average ARR for Team
      expression: mean(${opportunity_line_item.total_arr})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#aed5ff",
        font_color: "#f4fff9", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [opportunity_line_item.total_arr, csm.name]
    listen: {}
    row: 8
    col: 3
    width: 5
    height: 2
  filters:
  - name: Customer Success Manager
    title: Customer Success Manager
    type: field_filter
    default_value: Melissa Glaser
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: sfdc_demo
    explore: daily_user_count
    listens_to_filters: []
    field: csm.name

---
- dashboard: cymbol
  title: cymbol
  layout: newspaper
  preferred_slug: LkXK4Z3mFlnAEVntDmrZ8T

---
- dashboard: daily_pulse
  title: Daily Pulse
  layout: newspaper
  description: ''
  preferred_slug: rrFRo4Ha3db19lwy06sVhq
  embed_style:
    background_color: ''
    show_title: true
    title_color: "#5c4ac3"
    show_filters_bar: true
    tile_text_color: "#ff7725"
    text_tile_text_color: ''
  elements:
  - title: New Tile
    name: New Tile
    model: gaming
    explore: events
    type: looker_line
    fields: [events.number_of_new_users, events.event_date, events.number_of_users]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: events.number_of_new_users,
            name: Number of New Users, axisId: events.number_of_new_users}, {id: events.number_of_users,
            name: Active Users, axisId: events.number_of_users}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
      events.number_of_new_users: New Installs
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: true
    interpolation: linear
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 4
    width: 4
    height: 7
  - title: Daily Active Users
    name: Daily Active Users
    model: gaming
    explore: events
    type: single_value
    fields: [events.number_of_users, events.event_date]
    fill_fields: [events.event_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: daily_active_users
      label: Daily Active Users
      expression: mean(${events.number_of_users})
      value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0'
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    note_state: collapsed
    note_display: hover
    note_text: The average number of unique users per day who played at least one
      session in the selected time period
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 0
    width: 4
    height: 4
  - name: "<span class='fa fa-tachometer'> Topline KPIs</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Topline KPIs</span>"
    subtitle_text: Are we headed in the right direction?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-smile-o'> Retention </span>"
    type: text
    title_text: "<span class='fa fa-smile-o'> Retention </span>"
    subtitle_text: Are our games fun?
    row: 19
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-users'> User Acquistion </span>"
    type: text
    title_text: "<span class='fa fa-users'> User Acquistion </span>"
    subtitle_text: Are we acquiring players from the best places?
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-usd'> Monetization </span>"
    type: text
    title_text: "<span class='fa fa-usd'> Monetization </span>"
    subtitle_text: <p> Are we building a sustainable business? Go to <a href="/dashboards/TB2xb5rP4kh60hgHPZKepV"
      target="_blank">monetization dashboard</a></p>
    body_text: ''
    row: 28
    col: 0
    width: 24
    height: 2
  - title: Revenue
    name: Revenue
    model: gaming
    explore: events
    type: single_value
    fields: [events.total_revenue]
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: Total revenue (In-app Purhcases + Ad)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 8
    width: 4
    height: 3
  - title: ARPPU
    name: ARPPU
    model: gaming
    explore: events
    type: single_value
    fields: [events.average_revenue_per_spender]
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: |-
      Average Revenue Per Paying User
      (Revenue / IAP Paying Users)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 12
    width: 4
    height: 3
  - title: New Tile (copy)
    name: New Tile (copy)
    model: gaming
    explore: events
    type: looker_line
    fields: [events.event_date, events.total_revenue, events.average_revenue_per_spender]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: events.total_revenue,
            id: events.total_revenue, name: Total Revenue}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: events.average_revenue_per_spender,
            id: events.average_revenue_per_spender, name: ARPPU (IAP)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      events.average_revenue_per_spender: column
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 5
    col: 8
    width: 8
    height: 4
  - title: ROAS
    name: ROAS
    model: gaming
    explore: events
    type: single_value
    fields: [events.return_on_ad_spend]
    filters:
      events.install_group: paid
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: |-
      Return on Ad Spend (revenue/ad spend)

      NOTE: only counts revenue from paid users
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 20
    width: 4
    height: 3
  - title: Marketing Spend
    name: Marketing Spend
    model: gaming
    explore: events
    type: single_value
    fields: [events.total_install_spend]
    limit: 500
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Return on Ad Spend (revenue/ad spend)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 16
    width: 4
    height: 3
  - title: UA Overview
    name: UA Overview
    model: gaming
    explore: events
    type: looker_line
    fields: [events.event_date, events.total_install_spend, events.return_on_ad_spend]
    fill_fields: [events.event_date]
    filters:
      events.install_group: paid
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    stacking: ''
    trellis: ''
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
    series_types:
      events.return_on_ad_spend: column
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: events.total_install_spend,
            name: Total Install Cost, axisId: events.total_install_spend}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: events.return_on_ad_spend,
            name: ROAS, axisId: events.return_on_ad_spend}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 5
    col: 16
    width: 8
    height: 4
  - title: CPI (paid only)
    name: CPI (paid only)
    model: gaming
    explore: events
    type: single_value
    fields: [events.cost_per_install]
    filters:
      events.install_group: paid
    limit: 500
    column_limit: 50
    note_state: collapsed
    note_display: hover
    note_text: Cost per Install
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 12
    col: 0
    width: 4
    height: 2
  - title: Install Sources
    name: Install Sources
    model: gaming
    explore: events
    type: table
    fields: [events.install_source, events.return_on_ad_spend, events.total_revenue,
      events.total_install_spend, events.number_of_new_users, events.device_platform]
    pivots: [events.device_platform]
    filters:
      events.install_group: paid
    sorts: [events.number_of_new_users desc 0, events.device_platform]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      events.number_of_users: Active Users
      events.d7_revenue_per_retained_user: D7 Revenue
      events.number_of_new_users: Installs
      events.total_install_spend: Spend
    series_cell_visualizations:
      events.return_on_ad_spend:
        is_active: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 611da387-0e33-4239-aef0-a187c149cf88,
          palette_id: 4f09bd77-8e34-41d6-a356-12c05cdb2de5, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: 611da387-0e33-4239-aef0-a187c149cf88, palette_id: 4f09bd77-8e34-41d6-a356-12c05cdb2de5},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    stacking: ''
    trellis: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    point_style: none
    series_colors: {}
    y_axes: [{label: '', orientation: left, series: [{id: events.total_revenue, name: Total
              Revenue, axisId: events.total_revenue}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{id: events.average_revenue_per_paying_user,
            name: ARPPU (IAP), axisId: events.average_revenue_per_paying_user}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    note_state: expanded
    note_display: above
    note_text: 'Recommended Action: Drill into Install Sources to see what campaigns
      are working'
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 12
    col: 10
    width: 14
    height: 7
  - title: Installs by Day
    name: Installs by Day
    model: gaming
    explore: events
    type: looker_line
    fields: [events.install_group, events.number_of_new_users, events.event_date]
    pivots: [events.install_group]
    fill_fields: [events.event_date]
    sorts: [events.number_of_new_users desc 0, events.install_group]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: cross - events.number_of_new_users,
            name: cross, axisId: events.number_of_new_users}, {id: organic - events.number_of_new_users,
            name: organic, axisId: events.number_of_new_users}, {id: paid - events.number_of_new_users,
            name: paid, axisId: events.number_of_new_users}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 12
    col: 4
    width: 6
    height: 7
  - title: Retention by Source
    name: Retention by Source
    model: gaming
    explore: events
    type: looker_line
    fields: [events.retention_day, events.number_of_new_users, events.number_of_users,
      events.install_source]
    pivots: [events.install_source]
    filters:
      events.retention_day: "<=30"
    sorts: [events.retention_day, events.install_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: still_active
      label: "% still active"
      expression: "${events.number_of_users}/max(${events.number_of_new_users})"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: cross - still_active, name: cross,
            axisId: still_active}, {id: organic - still_active, name: organic, axisId: still_active},
          {id: paid - still_active, name: paid, axisId: still_active}], showLabels: true,
        showValues: true, maxValue: 0.6, unpinAxis: false, tickDensity: default, type: log}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: days since signup
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: [events.number_of_new_users, events.number_of_users]
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 21
    col: 12
    width: 12
    height: 7
  - title: D7 Retention
    name: D7 Retention
    model: gaming
    explore: events
    type: single_value
    fields: [events.d7_retention_rate]
    filters: {}
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
    note_state: collapsed
    note_display: hover
    note_text: D7 % = session on D7/ session on D0
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 24
    col: 0
    width: 4
    height: 2
  - title: D1 Retention
    name: D1 Retention
    model: gaming
    explore: events
    type: single_value
    fields: [events.d1_retention_rate]
    filters: {}
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
    note_state: collapsed
    note_display: hover
    note_text: D1 % = session on D1/ session on D0
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 21
    col: 0
    width: 4
    height: 3
  - title: D14 Retention
    name: D14 Retention
    model: gaming
    explore: events
    type: single_value
    fields: [events.d14_retention_rate]
    filters: {}
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
    note_state: collapsed
    note_display: hover
    note_text: D14 % = session on D14/ session on D0
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 26
    col: 0
    width: 4
    height: 2
  - title: "% New Paid Users"
    name: "% New Paid Users"
    model: gaming
    explore: events
    type: looker_donut_multiples
    fields: [events.install_group, events.number_of_new_users]
    pivots: [events.install_group]
    sorts: [events.install_group]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: paid - events.number_of_new_users,
            id: paid - events.number_of_new_users, name: paid}, {axisId: organic -
              events.number_of_new_users, id: organic - events.number_of_new_users,
            name: organic}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: What percentage of users did we pay for (vs organic)?
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 14
    col: 0
    width: 4
    height: 5
  - title: D1& D7 Retention
    name: D1& D7 Retention
    model: gaming
    explore: events
    type: looker_line
    fields: [events.d1_retention_rate, events.user_first_seen_date, events.d7_retention_rate]
    filters: {}
    sorts: [events.user_first_seen_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: events.d1_retention_rate,
            name: D1 Retention Rate, axisId: events.d1_retention_rate}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#8BC34A",
        line_value: '0.45', label: d1 goal 45%}, {reference_type: line, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#ff3b3b", line_value: '0.16', label: d7 goal
          16%}]
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: []
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 21
    col: 4
    width: 8
    height: 7
  - title: LTV (0-30 days)
    name: LTV (0-30 days)
    model: gaming
    explore: events
    type: looker_area
    fields: [events.retention_day, events.average_ad_revenue_per_user, events.average_iap_revenue_per_user]
    filters:
      events.retention_day: "<=30"
    sorts: [events.retention_day]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: ltv_iap
      label: LTV - IAP
      expression: running_total(${events.average_iap_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltv_ads
      label: LTV - Ads
      expression: running_total(${events.average_ad_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltv_growth
      label: ltv growth %
      expression: "(${total} - ${prev_day})/${prev_day}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total
      label: total
      expression: "${ltv_ads}+ ${ltv_iap}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: prev_day
      label: prev day
      expression: offset(${total},-1)
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    stacking: normal
    trellis: ''
    trellis_rows: 5
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      growth: ltv growth
    series_types:
      ltv_growth: column
    limit_displayed_rows: false
    hidden_series: [ltv_total, ltv_growth]
    y_axes: [{label: '', orientation: left, series: [{id: ltv_iap, name: LTV - IAP,
            axisId: ltv_iap}, {id: ltv_ads, name: LTV - Ads, axisId: ltv_ads}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{id: ltv_growth, name: ltv growth
              %, axisId: ltv_growth}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Days since player start
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#8BC34A",
        line_value: '1'}]
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: [events.average_iap_revenue_per_user, events.average_ad_revenue_per_user,
      total, prev_day]
    note_state: expanded
    note_display: hover
    note_text: How long does it take to make $1? (for all users)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 30
    col: 0
    width: 12
    height: 6
  - title: "% Spenders"
    name: "% Spenders"
    model: gaming
    explore: events
    type: single_value
    fields: [events.percent_spenders]
    limit: 500
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 30
    col: 12
    width: 4
    height: 6
  - title: Revenue Breadkdown
    name: Revenue Breadkdown
    model: gaming
    explore: events
    type: looker_bar
    fields: [events.total_iap_revenue, events.total_ad_revenue]
    limit: 500
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
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
    stacking: normal
    limit_displayed_rows: false
    hide_legend: false
    legend_position: center
    font_size: '12'
    point_style: none
    series_labels:
      events.total_ad_revenue: Ad Revenue
      events.total_iap_revenue: IAP revenue
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 30
    col: 16
    width: 8
    height: 6
  - title: Daily Installs
    name: Daily Installs
    model: gaming
    explore: events
    type: single_value
    fields: [events.event_date, events.number_of_new_users]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: daily_installs
      label: Daily Installs
      expression: mean(${events.number_of_new_users})
      value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0'
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    note_state: expanded
    note_display: hover
    note_text: Average daily new players
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 6
    col: 0
    width: 4
    height: 3
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 2023/01/01 to 2023/03/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.event_date
  - name: Drill Down
    title: Drill Down
    type: field_filter
    default_value: device^_platform
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.drill_by
  - name: Platform
    title: Platform
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.device_platform
  - name: Install Source
    title: Install Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.install_source
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.country
  - name: Game
    title: Game
    type: field_filter
    default_value: Lookerwood Farm
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.game_name

---
- dashboard: daily_pulse_copy
  title: Daily Pulse (copy)
  layout: newspaper
  description: ''
  preferred_slug: GulAIfxvlIfGpicw69qIF4
  embed_style:
    background_color: ''
    show_title: true
    title_color: "#5c4ac3"
    show_filters_bar: true
    tile_text_color: "#ff7725"
    text_tile_text_color: ''
  elements:
  - title: New Tile
    name: New Tile
    model: gaming
    explore: events
    type: looker_line
    fields: [events.number_of_new_users, events.event_date, events.number_of_users]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: events.number_of_new_users,
            name: Number of New Users, axisId: events.number_of_new_users}, {id: events.number_of_users,
            name: Active Users, axisId: events.number_of_users}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
      events.number_of_new_users: New Installs
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: true
    interpolation: linear
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 4
    width: 4
    height: 7
  - title: Daily Active Users
    name: Daily Active Users
    model: gaming
    explore: events
    type: single_value
    fields: [events.number_of_users, events.event_date]
    fill_fields: [events.event_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: daily_active_users
      label: Daily Active Users
      expression: mean(${events.number_of_users})
      value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0'
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    note_state: collapsed
    note_display: hover
    note_text: The average number of unique users per day who played at least one
      session in the selected time period
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 0
    width: 4
    height: 4
  - name: "<span class='fa fa-tachometer'> Topline KPIs</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Topline KPIs</span>"
    subtitle_text: Are we headed in the right direction?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-smile-o'> Retention </span>"
    type: text
    title_text: "<span class='fa fa-smile-o'> Retention </span>"
    subtitle_text: Are our games fun?
    row: 19
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-users'> User Acquistion </span>"
    type: text
    title_text: "<span class='fa fa-users'> User Acquistion </span>"
    subtitle_text: Are we acquiring players from the best places?
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-usd'> Monetization </span>"
    type: text
    title_text: "<span class='fa fa-usd'> Monetization </span>"
    subtitle_text: <p> Are we building a sustainable business? Go to <a href="/dashboards/TB2xb5rP4kh60hgHPZKepV"
      target="_blank">monetization dashboard</a></p>
    body_text: ''
    row: 28
    col: 0
    width: 24
    height: 2
  - title: Revenue
    name: Revenue
    model: gaming
    explore: events
    type: single_value
    fields: [events.total_revenue]
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: Total revenue (In-app Purhcases + Ad)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 8
    width: 4
    height: 3
  - title: ARPPU
    name: ARPPU
    model: gaming
    explore: events
    type: single_value
    fields: [events.average_revenue_per_spender]
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: |-
      Average Revenue Per Paying User
      (Revenue / IAP Paying Users)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 12
    width: 4
    height: 3
  - title: New Tile (copy)
    name: New Tile (copy)
    model: gaming
    explore: events
    type: looker_line
    fields: [events.event_date, events.total_revenue, events.average_revenue_per_spender]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: events.total_revenue,
            id: events.total_revenue, name: Total Revenue}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: events.average_revenue_per_spender,
            id: events.average_revenue_per_spender, name: ARPPU (IAP)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      events.average_revenue_per_spender: column
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 5
    col: 8
    width: 8
    height: 4
  - title: ROAS
    name: ROAS
    model: gaming
    explore: events
    type: single_value
    fields: [events.return_on_ad_spend]
    filters:
      events.install_group: paid
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: |-
      Return on Ad Spend (revenue/ad spend)

      NOTE: only counts revenue from paid users
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 20
    width: 4
    height: 3
  - title: Marketing Spend
    name: Marketing Spend
    model: gaming
    explore: events
    type: single_value
    fields: [events.total_install_spend]
    limit: 500
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Return on Ad Spend (revenue/ad spend)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 2
    col: 16
    width: 4
    height: 3
  - title: UA Overview
    name: UA Overview
    model: gaming
    explore: events
    type: looker_line
    fields: [events.event_date, events.total_install_spend, events.return_on_ad_spend]
    fill_fields: [events.event_date]
    filters:
      events.install_group: paid
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    stacking: ''
    trellis: ''
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
    series_types:
      events.return_on_ad_spend: column
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: events.total_install_spend,
            name: Total Install Cost, axisId: events.total_install_spend}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: events.return_on_ad_spend,
            name: ROAS, axisId: events.return_on_ad_spend}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 5
    col: 16
    width: 8
    height: 4
  - title: CPI (paid only)
    name: CPI (paid only)
    model: gaming
    explore: events
    type: single_value
    fields: [events.cost_per_install]
    filters:
      events.install_group: paid
    limit: 500
    column_limit: 50
    note_state: collapsed
    note_display: hover
    note_text: Cost per Install
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 12
    col: 0
    width: 4
    height: 2
  - title: Install Sources
    name: Install Sources
    model: gaming
    explore: events
    type: table
    fields: [events.install_source, events.return_on_ad_spend, events.total_revenue,
      events.total_install_spend, events.number_of_new_users, events.device_platform]
    pivots: [events.device_platform]
    filters:
      events.install_group: paid
    sorts: [events.number_of_new_users desc 0, events.device_platform]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      events.number_of_users: Active Users
      events.d7_revenue_per_retained_user: D7 Revenue
      events.number_of_new_users: Installs
      events.total_install_spend: Spend
    series_cell_visualizations:
      events.return_on_ad_spend:
        is_active: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 611da387-0e33-4239-aef0-a187c149cf88,
          palette_id: 4f09bd77-8e34-41d6-a356-12c05cdb2de5, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: 611da387-0e33-4239-aef0-a187c149cf88, palette_id: 4f09bd77-8e34-41d6-a356-12c05cdb2de5},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    stacking: ''
    trellis: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    point_style: none
    series_colors: {}
    y_axes: [{label: '', orientation: left, series: [{id: events.total_revenue, name: Total
              Revenue, axisId: events.total_revenue}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{id: events.average_revenue_per_paying_user,
            name: ARPPU (IAP), axisId: events.average_revenue_per_paying_user}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    note_state: expanded
    note_display: above
    note_text: 'Recommended Action: Drill into Install Sources to see what campaigns
      are working'
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 12
    col: 10
    width: 14
    height: 7
  - title: Installs by Day
    name: Installs by Day
    model: gaming
    explore: events
    type: looker_line
    fields: [events.install_group, events.number_of_new_users, events.event_date]
    pivots: [events.install_group]
    fill_fields: [events.event_date]
    sorts: [events.number_of_new_users desc 0, events.install_group]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: cross - events.number_of_new_users,
            name: cross, axisId: events.number_of_new_users}, {id: organic - events.number_of_new_users,
            name: organic, axisId: events.number_of_new_users}, {id: paid - events.number_of_new_users,
            name: paid, axisId: events.number_of_new_users}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 12
    col: 4
    width: 6
    height: 7
  - title: Retention by Source
    name: Retention by Source
    model: gaming
    explore: events
    type: looker_line
    fields: [events.retention_day, events.number_of_new_users, events.number_of_users,
      events.install_source]
    pivots: [events.install_source]
    filters:
      events.retention_day: "<=30"
    sorts: [events.retention_day, events.install_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: still_active
      label: "% still active"
      expression: "${events.number_of_users}/max(${events.number_of_new_users})"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: cross - still_active, name: cross,
            axisId: still_active}, {id: organic - still_active, name: organic, axisId: still_active},
          {id: paid - still_active, name: paid, axisId: still_active}], showLabels: true,
        showValues: true, maxValue: 0.6, unpinAxis: false, tickDensity: default, type: log}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: days since signup
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: [events.number_of_new_users, events.number_of_users]
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 21
    col: 12
    width: 12
    height: 7
  - title: D7 Retention
    name: D7 Retention
    model: gaming
    explore: events
    type: single_value
    fields: [events.d7_retention_rate]
    filters: {}
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
    note_state: collapsed
    note_display: hover
    note_text: D7 % = session on D7/ session on D0
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 24
    col: 0
    width: 4
    height: 2
  - title: D1 Retention
    name: D1 Retention
    model: gaming
    explore: events
    type: single_value
    fields: [events.d1_retention_rate]
    filters: {}
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
    note_state: collapsed
    note_display: hover
    note_text: D1 % = session on D1/ session on D0
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 21
    col: 0
    width: 4
    height: 3
  - title: D14 Retention
    name: D14 Retention
    model: gaming
    explore: events
    type: single_value
    fields: [events.d14_retention_rate]
    filters: {}
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
    note_state: collapsed
    note_display: hover
    note_text: D14 % = session on D14/ session on D0
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 26
    col: 0
    width: 4
    height: 2
  - title: "% New Paid Users"
    name: "% New Paid Users"
    model: gaming
    explore: events
    type: looker_donut_multiples
    fields: [events.install_group, events.number_of_new_users]
    pivots: [events.install_group]
    sorts: [events.install_group]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: paid - events.number_of_new_users,
            id: paid - events.number_of_new_users, name: paid}, {axisId: organic -
              events.number_of_new_users, id: organic - events.number_of_new_users,
            name: organic}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: What percentage of users did we pay for (vs organic)?
    title_hidden: true
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 14
    col: 0
    width: 4
    height: 5
  - title: D1& D7 Retention
    name: D1& D7 Retention
    model: gaming
    explore: events
    type: looker_line
    fields: [events.d1_retention_rate, events.user_first_seen_date, events.d7_retention_rate]
    filters: {}
    sorts: [events.user_first_seen_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: events.d1_retention_rate,
            name: D1 Retention Rate, axisId: events.d1_retention_rate}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#8BC34A",
        line_value: '0.45', label: d1 goal 45%}, {reference_type: line, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#ff3b3b", line_value: '0.16', label: d7 goal
          16%}]
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: []
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 21
    col: 4
    width: 8
    height: 7
  - title: LTV (0-30 days)
    name: LTV (0-30 days)
    model: gaming
    explore: events
    type: looker_area
    fields: [events.retention_day, events.average_ad_revenue_per_user, events.average_iap_revenue_per_user]
    filters:
      events.retention_day: "<=30"
    sorts: [events.retention_day]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: ltv_iap
      label: LTV - IAP
      expression: running_total(${events.average_iap_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltv_ads
      label: LTV - Ads
      expression: running_total(${events.average_ad_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltv_growth
      label: ltv growth %
      expression: "(${total} - ${prev_day})/${prev_day}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total
      label: total
      expression: "${ltv_ads}+ ${ltv_iap}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: prev_day
      label: prev day
      expression: offset(${total},-1)
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    stacking: normal
    trellis: ''
    trellis_rows: 5
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      growth: ltv growth
    series_types:
      ltv_growth: column
    limit_displayed_rows: false
    hidden_series: [ltv_total, ltv_growth]
    y_axes: [{label: '', orientation: left, series: [{id: ltv_iap, name: LTV - IAP,
            axisId: ltv_iap}, {id: ltv_ads, name: LTV - Ads, axisId: ltv_ads}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{id: ltv_growth, name: ltv growth
              %, axisId: ltv_growth}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Days since player start
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#8BC34A",
        line_value: '1'}]
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: [events.average_iap_revenue_per_user, events.average_ad_revenue_per_user,
      total, prev_day]
    note_state: expanded
    note_display: hover
    note_text: How long does it take to make $1? (for all users)
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 30
    col: 0
    width: 12
    height: 6
  - title: "% Spenders"
    name: "% Spenders"
    model: gaming
    explore: events
    type: single_value
    fields: [events.percent_spenders]
    limit: 500
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 30
    col: 12
    width: 4
    height: 6
  - title: Revenue Breadkdown
    name: Revenue Breadkdown
    model: gaming
    explore: events
    type: looker_bar
    fields: [events.total_iap_revenue, events.total_ad_revenue]
    limit: 500
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
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
    stacking: normal
    limit_displayed_rows: false
    hide_legend: false
    legend_position: center
    font_size: '12'
    point_style: none
    series_labels:
      events.total_ad_revenue: Ad Revenue
      events.total_iap_revenue: IAP revenue
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 30
    col: 16
    width: 8
    height: 6
  - title: Daily Installs
    name: Daily Installs
    model: gaming
    explore: events
    type: single_value
    fields: [events.event_date, events.number_of_new_users]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: daily_installs
      label: Daily Installs
      expression: mean(${events.number_of_new_users})
      value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0'
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    note_state: expanded
    note_display: hover
    note_text: Average daily new players
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 6
    col: 0
    width: 4
    height: 3
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 2023/01/01 to 2023/03/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.event_date
  - name: Drill Down
    title: Drill Down
    type: field_filter
    default_value: device^_platform
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.drill_by
  - name: Platform
    title: Platform
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.device_platform
  - name: Install Source
    title: Install Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.install_source
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.country
  - name: Game
    title: Game
    type: field_filter
    default_value: Lookerwood Farm
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gaming
    explore: events
    listens_to_filters: []
    field: events.game_name

---
- dashboard: dashboard
  title: dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: 2Hz7NdMekbp2btUSL83qgr
  elements:
  - title: dashboard
    name: dashboard
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_gross_margin, users.gender]
    pivots: [users.gender]
    fill_fields: [order_items.created_date]
    filters: {}
    sorts: [users.gender, order_items.created_date desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    y_axes: []
    listen:
      Created Month: order_items.created_month
    row: 0
    col: 0
    width: 18
    height: 7
  filters:
  - name: Created Month
    title: Created Month
    type: field_filter
    default_value: 3 weeks
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_month

---
- dashboard: dashboard_for_top_calvin_kleins_customers__to_be_monitored_daily
  title: dashboard for top Calvin Klein's customers - to be monitored daily
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: VSnfnsC0QrChFT0jjxT853
  elements:
  - title: dashboard for top Calvin Klein's customers - to be monitored daily
    name: dashboard for top Calvin Klein's customers - to be monitored daily
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.email, products.brand, order_items.total_sale_price, order_items.created_date]
    filters: {}
    sorts: [order_items.total_sale_price desc 0]
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
      Brand: products.brand
      Total Sale Price: order_items.total_sale_price
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Total Sale Price
    title: Total Sale Price
    type: field_filter
    default_value: ">100"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.total_sale_price
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: dashboard_with_look_1
  title: Dashboard with Look 1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8yFBG4hU4V9bqHtIRPkoce
  elements:
  - name: Timeseries Look
    title: Timeseries Look
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.created_date desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 11
    height: 6

---
- dashboard: dashboard_with_look_2
  title: Dashboard with Look 2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Izz0HCDY8LWpFWTLGuZJw6
  elements:
  - name: Timeseries Look
    title: Timeseries Look
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.created_date desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 15
    height: 7
  - title: Test non Look
    name: Test non Look
    model: thelook
    explore: order_items
    type: looker_scatter
    fields: [order_items.total_sale_price, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.created_date desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 0
    col: 15
    width: 8
    height: 6
  - title: test
    name: test
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, users.gender, users.age_tier]
    filters:
      order_items.created_date: 7 days
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    trend_lines: []
    advanced_vis_config: |-
      {
        "chart": {
          "backgroundColor": "#008000",
          "inverted": false,
          "style": {
            "fontFamily": "inherit",
            "fontSize": "12px"
          },
          "type": "column"
        },
        "series": [{
          "name": "Total Sale Price",
          "color": "#1A73E8",
          "id": "order_items.total_sale_price",
          "type": "column",
          "visible": true
        }],
        "xAxis": {
          "type": "category"
        },
        "yAxis": [{
          "type": "linear"
        }]
      }
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    title_hidden: true
    listen: {}
    row: 7
    col: 0
    width: 13
    height: 6

---
- dashboard: dashboardepic
  title: DashboardEpic
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: XiU1pcWGWUtzcc8NZ1ZOCQ
  elements:
  - title: DashboardEpic
    name: DashboardEpic
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_margin, products.department, user_order_facts.repeat_customer]
    pivots: [user_order_facts.repeat_customer]
    fill_fields: [user_order_facts.repeat_customer]
    sorts: [user_order_facts.repeat_customer, order_items.total_gross_margin desc
        0]
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: data_day
  title: Data Day
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: pmYKwzc1btjMexjnoxU7fV
  elements:
  - title: Average Shipping Time
    name: Average Shipping Time
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_shipping_time]
    filters: {}
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
    x_axis_zoom: true
    y_axis_zoom: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 6
    height: 2
  - title: Average Shipping Time by Month
    name: Average Shipping Time by Month
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.average_shipping_time, order_items.created_month]
    filters: {}
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 2
    col: 0
    width: 24
    height: 6
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: data_day_2
  title: Data Day 2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: xSln8Jk7Gi4OC3AoYXf06o
  elements:
  - title: Average Shipping Time
    name: Average Shipping Time
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_shipping_time]
    filters: {}
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
    x_axis_zoom: true
    y_axis_zoom: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 6
    height: 2
  - title: Average Shipping Time by Month
    name: Average Shipping Time by Month
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.average_shipping_time, order_items.created_month]
    filters: {}
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 2
    col: 0
    width: 24
    height: 6
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: data_science__bqml
  title: Data Science - BQML
  layout: newspaper
  description: ''
  preferred_slug: cLWKFGVLm5NLqGYzRIgJyn
  elements:
  - title: "% Anomalies by Avg Min in Wait Room"
    name: "% Anomalies by Avg Min in Wait Room"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, claims.average_distance_bene_doctor]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Avg Min in Wait Room
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 6
  - title: "% Anomalies by % Patients on Medicare"
    name: "% Anomalies by % Patients on Medicare"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, claims.percent_opioid_claims]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: "% Patients on Medicare"
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 0
    width: 6
    height: 6
  - title: "% Anomalies by Patient Volume"
    name: "% Anomalies by Patient Volume"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, events_MED.count_events]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: "# Patients Admitted / Hour"
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 6
  - title: "% Anomalies by Patient / Staff"
    name: "% Anomalies by Patient / Staff"
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [doctor.npi, stats_by_doctor_combined.risk_score_dimension, claims.average_opioid_supply_length]
    filters:
      stats_by_doctor_combined.risk_score_dimension: "[-.4, .4],NOT NULL"
    sorts: [stats_by_doctor_combined.risk_score_dimension desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: "% Anomalies", orientation: left, series: [{axisId: stats_by_doctor_combined.risk_score_dimension,
            id: stats_by_doctor_combined.risk_score_dimension, name: 1 - Risk Score}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Patient / Staff
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    show_null_points: true
    hidden_fields: [doctor.npi]
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 6
  - name: 1 - Input Variables
    type: text
    title_text: 1 - Input Variables
    row: 0
    col: 0
    width: 24
    height: 2
  - name: 2 - Train the Model
    type: text
    title_text: 2 - Train the Model
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Training Detail
    name: Training Detail
    model: opioid
    explore: machine_learning_raw
    type: table
    fields: [machine_learning_raw.iteration, machine_learning_raw.learning_rate, machine_learning_raw.loss]
    sorts: [machine_learning_raw.iteration]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 10
    col: 4
    width: 8
    height: 6
  - title: Training Loss
    name: Training Loss
    model: opioid
    explore: machine_learning_raw
    type: looker_area
    fields: [machine_learning_raw.iteration, machine_learning_raw.total_loss]
    sorts: [machine_learning_raw.iteration]
    limit: 500
    stacking: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    label_color: [black]
    font_size: 14px
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      machine_learning_raw.total_loss: "#1f78b4"
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: machine_learning_raw.total_loss,
            name: Total Loss, axisId: machine_learning_raw.total_loss}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [machine_learning_raw.iteration]
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 6
  - title: "# Iterations"
    name: "# Iterations"
    model: opioid
    explore: machine_learning_raw
    type: single_value
    fields: [machine_learning_raw.count_iterations]
    limit: 500
    column_limit: 50
    listen: {}
    row: 10
    col: 0
    width: 4
    height: 6
  - name: 3 - Assess Model's Predictive Power
    type: text
    title_text: 3 - Assess Model's Predictive Power
    row: 16
    col: 0
    width: 24
    height: 2
  - title: Model Performance
    name: Model Performance
    model: opioid
    explore: predictive_power_raw
    type: looker_single_record
    fields: [predictive_power_raw.r_squared, predictive_power_raw.mean_absolute_error,
      predictive_power_raw.median_absolute_error, predictive_power_raw.mean_squared_error,
      predictive_power_raw.median_squared_error]
    sorts: [predictive_power_raw.r_squared]
    limit: 500
    show_view_names: false
    listen: {}
    row: 18
    col: 0
    width: 4
    height: 6
  - title: Historical Actual vs Predicted
    name: Historical Actual vs Predicted
    model: opioid
    explore: claims
    type: looker_scatter
    fields: [applied_model_results.actual_risk_score, applied_model_results.average_actual_risk_score,
      applied_model_results.average_predicted_risk_score]
    filters:
      applied_model_results.actual_risk_score: "[-.4, .4],NOT NULL"
    sorts: [applied_model_results.actual_risk_score]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Predicted % Anomalies, orientation: left, series: [{axisId: applied_model_results.average_actual_risk_score,
            id: applied_model_results.average_actual_risk_score, name: Actual}, {
            axisId: applied_model_results.average_predicted_risk_score, id: applied_model_results.average_predicted_risk_score,
            name: Predicted}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Actual % Anomalies
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
    series_colors:
      applied_model_results.average_actual_risk_score: "#1ea8df"
      applied_model_results.average_predicted_risk_score: "#ed6168"
    series_labels:
      applied_model_results.average_actual_risk_score: Actual
      applied_model_results.average_predicted_risk_score: Predicted
    series_point_styles:
      applied_model_results.average_predicted_risk_score: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: [{color: "#cccccc", label_position: right, period: 7, regression_type: linear,
        show_label: false, series_index: 1}]
    show_null_points: true
    hidden_fields:
    listen: {}
    row: 18
    col: 4
    width: 10
    height: 6
  - title: Residuals
    name: Residuals
    model: opioid
    explore: claims
    type: looker_column
    fields: [applied_model_results.actual_risk_score, applied_model_results.average_residual]
    filters:
      applied_model_results.actual_risk_score: "[-.4, .4],NOT NULL"
    sorts: [applied_model_results.actual_risk_score]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: "% Anomalies"
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
    series_colors:
      applied_model_results.average_actual_risk_score: "#1ea8df"
      applied_model_results.average_predicted_risk_score: "#ed6168"
      applied_model_results.average_residual: "#b3a0dd"
    series_labels:
      applied_model_results.average_actual_risk_score: Actual
      applied_model_results.average_predicted_risk_score: Predicted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: Actual}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    hidden_fields:
    listen: {}
    row: 18
    col: 14
    width: 10
    height: 6

---
- dashboard: database_performance
  title: Database Performance
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: bNmCnHS2tQYDCqIlPo0dEY
  elements:
  - name: Performance Details (Last 7 Days)
    type: text
    title_text: Performance Details (Last 7 Days)
    subtitle_text: Identify and optimize underperforming content
    row: 52
    col: 0
    width: 24
    height: 2
  - name: PDT Overview (Last 7 Days)
    type: text
    title_text: PDT Overview (Last 7 Days)
    subtitle_text: Identify unsuccessful and slow building PDTs
    row: 60
    col: 0
    width: 24
    height: 2
  - title: Explore Performance
    name: Explore Performance
    model: system__activity
    explore: history
    type: looker_grid
    fields: [query.view, query.model, history.average_runtime]
    filters:
      query.view: "-NULL"
      history.created_date: 7 days
    sorts: [history.average_runtime desc]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_cell_visualizations:
      history.average_runtime:
        is_active: true
        palette:
          palette_id: c66d6394-1b71-9037-8af4-a8afad3d3679
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - yellow
          - orange
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: less than, value: 10, background_color: !!null '',
        font_color: green, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}, {type: between, value: [10, 60], background_color: !!null '',
        font_color: orange, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}, {type: greater than, value: 60, background_color: !!null '',
        font_color: red, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    truncate_column_names: false
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 54
    col: 0
    width: 8
    height: 6
  - title: Look Performance
    name: Look Performance
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.average_runtime, look.title]
    filters:
      look.id: NOT NULL
      history.created_date: 7 days
    sorts: [history.average_runtime desc]
    limit: 50
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      look.title: Look Title
    series_cell_visualizations:
      history.average_runtime:
        is_active: true
        palette:
          palette_id: 2da7cc47-3bbe-4a65-3fd6-f853c6c96385
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - yellow
          - orange
          - red
        value_display: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: greater than, value: 60, background_color: !!null '',
        font_color: red, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}, {type: between, value: [10, 60], background_color: !!null '',
        font_color: orange, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}, {type: less than, value: 10, background_color: !!null '',
        font_color: green, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_value_format:
      history.average_runtime:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
    hide_totals: false
    hide_row_totals: false
    truncate_column_names: false
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 54
    col: 8
    width: 8
    height: 6
  - title: Dashboard Performance
    name: Dashboard Performance
    model: system__activity
    explore: history
    type: looker_grid
    fields: [dashboard.title, query.count]
    filters:
      history.is_single_query: 'Yes'
      history.real_dash_id: "-NULL"
      history.created_date: 7 days
      history.status: complete
      history.runtime: ">30"
    sorts: [query.count desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - table_calculation: total_runtime
      label: Total Runtime
      expression: "${history.total_runtime}"
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      query.count: Distinct Queries Over 30s
      dashboard.title: Dashboard Title
    series_cell_visualizations:
      query.count:
        is_active: true
        palette:
          palette_id: 73d1ef93-b985-1b44-34cd-fbfdcb055c8c
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - Yellow
          - Orange
          - Red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 54
    col: 16
    width: 8
    height: 6
  - name: Concurrency Timelines (Last 7 Days - UTC)
    type: text
    title_text: Concurrency Timelines (Last 7 Days - UTC)
    subtitle_text: Spread automation across off peak concurrency hours to enhance
      performance
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 2
  - title: PDT Build Activity
    name: PDT Build Activity
    model: system__activity
    explore: pdt_event_log
    type: looker_grid
    fields: [pdt_event_log.view_name, pdt_event_log.connection, pdt_event_log.pdt_create_failures,
      pdt_event_log.pdt_trigger_failures, pdt_event_log.successful_pdt_builds]
    filters:
      pdt_event_log.view_name: "-NULL"
      pdt_event_log.created_date: 7 days
    sorts: [pdt_event_log.pdt_trigger_failures desc]
    limit: 500
    color_application:
      collection_id: 592616d0-58e4-4968-9030-928ef38b7b50
      palette_id: e7303a54-e53e-4cf0-abc9-2f175c1128e0
    column_order: [pdt_event_log.view_name, pdt_event_log.connection, pdt_event_log.percent_successful_builds,
      pdt_event_log.pdt_trigger_failures, pdt_event_log.pdt_create_failures, pdt_event_log.successful_pdt_builds]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      pdt_event_log.pdt_create_failures: Create Failures
      pdt_event_log.pdt_trigger_failures: Trigger Failures
      pdt_event_log.successful_pdt_builds: Successful Builds
    series_column_widths:
      pdt_event_log.view_name: 170
      pdt_event_log.connection: 170
      pdt_event_log.pdt_create_failures: 128
      pdt_event_log.pdt_trigger_failures: 170
      pdt_event_log.successful_pdt_builds: 183
    series_cell_visualizations:
      pdt_event_log.pdt_create_failures:
        is_active: true
        palette:
          palette_id: e7a0cd98-8098-6e8b-19f2-e8fde8acdae3
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - yellow
          - orange
          - red
      pdt_event_log.successful_pdt_builds:
        is_active: true
      pdt_event_log.pdt_trigger_failures:
        is_active: true
        palette:
          palette_id: 93a687d7-f079-7a3d-8325-d7c1464e146a
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - yellow
          - orange
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: greater than, value: 0, background_color: !!null '',
        font_color: red, palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: [pdt_event_log.pdt_create_failures, pdt_event_log.pdt_trigger_failures]},
      {type: greater than, value: 0, background_color: !!null '', font_color: "#4FBC89",
        palette: {name: Red to Yellow to Green, colors: ["#F36254", "#FCF758", "#4FBC89"]},
        bold: false, italic: false, strikethrough: false, fields: [pdt_event_log.successful_pdt_builds]},
      {type: along a scale..., value: !!null '', background_color: "#3EB0D5", font_color: !!null '',
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, custom: {
            id: bea390f0-e01a-28a5-7748-aa53baeba45b, label: Custom, type: continuous,
            stops: [{color: "#4FBC89", offset: 0}, {color: "#FCF758", offset: 50},
              {color: "#F36254", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0.999}, max: {type: maximum}},
            mirror: false, reverse: true, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    truncate_column_names: false
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 62
    col: 0
    width: 12
    height: 6
  - title: Hourly Users & Queries
    name: Hourly Users & Queries
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.created_hour_of_day, history.query_run_count, user.count, history.cache_result_query_count]
    fill_fields: [history.created_hour_of_day]
    filters:
      history.is_single_query: 'Yes'
      history.created_date: 7 days
    sorts: [history.created_hour_of_day]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: from_cache
      label: "% From Cache"
      expression: "${history.cache_result_query_count} / ${history.query_run_count}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: user.count, name: User Count,
            axisId: user.count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{id: history.query_run_count, name: History Query Run Count, axisId: history.query_run_count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: right, series: [
          {id: from_cache, name: "% From Cache", axisId: from_cache}], showLabels: true,
        showValues: true, maxValue: 1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Created Hour of Day - UTC
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: [history.query_run_count]
    legend_position: center
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_types:
      from_cache: line
      user.count: area
    point_style: none
    series_colors: {}
    series_labels:
      user.count: User Count
      from_cache: "% Queries From Cache"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [history.cache_result_query_count]
    listen: {}
    row: 19
    col: 0
    width: 24
    height: 6
  - title: Query Runtimes by Issuer Source (Last 30 Days)
    name: Query Runtimes by Issuer Source (Last 30 Days)
    model: system__activity
    explore: history
    type: looker_donut_multiples
    fields: [history.issuer_source, history.query_run_count, history.runtime_tiers]
    pivots: [history.runtime_tiers]
    filters:
      history.is_single_query: 'Yes'
      history.runtime_tiers: "-Undefined,-Below 0"
      history.issuer_source: "-Other"
      history.completed_date: 30 days
    sorts: [history.issuer_source desc, history.runtime_tiers 0]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors:
      0 to 4 - 1 - history.query_run_count: "#75E2E2"
      5 to 9 - 2 - history.query_run_count: "#72D16D"
      10 to 29 - 3 - history.query_run_count: "#C2DD67"
      30 to 119 - 4 - history.query_run_count: "#FFD95F"
      120 to 299 - 5 - history.query_run_count: "#E57947"
      300 or Above - 6 - history.query_run_count: "#B32F37"
    series_labels:
      0 to 4 - 1 - history.query_run_count: 0 to 4s
      5 to 9 - 2 - history.query_run_count: 5 to 9s
      10 to 29 - 3 - history.query_run_count: 10 to 29s
      30 to 119 - 4 - history.query_run_count: 30 to 119s
      120 to 299 - 5 - history.query_run_count: 120 to 299s
      300 or Above - 6 - history.query_run_count: 300s or Above
    value_labels: legend
    label_type: per
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    note_state: collapsed
    note_display: below
    note_text: |-
      Click here to expand source details...

      User Sources: dashboards, drill downs, explores, looks, private/public embeds,  sql_runner, suggest_filters, merge_queries, renderer.

      System Sources: scheduled_tasks, pdt_regenerator, data_download_api (csv downloads).

      Action Hub Sources: authenticated_download.

      API sources: API 3.0, dashboard_prefetch.
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 7
    width: 17
    height: 6
  - title: Results from Cache
    name: Results from Cache
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.cache_result_query_count, history.created_date]
    fill_fields: [history.created_date]
    filters:
      history.is_single_query: 'Yes'
      history.created_date: 60 days
    sorts: [history.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: from_cache_last_30
      label: "% From Cache last 30"
      expression: sum(if(row() < 30, ${history.cache_result_query_count}, 0)) / sum(if(row()
        < 30, ${history.query_run_count}, 0))
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: prior_30
      label: "% Prior 30"
      expression: sum(if(row() > 30 AND row() <= 60, ${history.cache_result_query_count},
        0)) / sum(if(row() > 30 AND row() <= 60, ${history.query_run_count}, 0))
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: from_last_period
      label: From Last Period
      expression: "${from_cache_last_30} - ${prior_30}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    hidden_fields: [history.query_run_count, history.created_date, history.cache_result_query_count,
      prior_30]
    note_state: collapsed
    note_display: hover
    note_text: Percentage of total queries returned from Looker cache.
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 7
    height: 6
  - title: PDT Average Build Time
    name: PDT Average Build Time
    model: system__activity
    explore: pdt_builds
    type: looker_grid
    fields: [pdt_builds.view_name, pdt_builds.connection, pdt_builds.model_name, pdt_builds.average_build_time_minutes]
    filters:
      pdt_builds.start_date: 7 days
    sorts: [pdt_builds.average_build_time_minutes desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      pdt_builds.average_build_time_seconds: Avg Build Seconds
      pdt_builds.average_build_time_minutes: Avg Build Minutes
    series_cell_visualizations:
      pdt_builds.average_build_time_minutes:
        is_active: true
        palette:
          palette_id: 175d5ab4-cb7c-69cc-970a-5ef98d345ba2
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - yellow
          - orange
          - red
    truncate_column_names: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 62
    col: 12
    width: 12
    height: 6
  - title: Top 15 Users by Query Count (last 7 days)
    name: Top 15 Users by Query Count (last 7 days)
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, history.created_day_of_week, user_query_rank.user_name]
    pivots: [user_query_rank.user_name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, user_query_rank.user_name desc]
    limit: 500
    column_limit: 15
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      history.created_day_of_week: Created
      zz_user_query_rank.user_query_rank: Rank
      user_query_rank.user_query_rank: Rank
      history.query_run_count: Queries Ran
    series_column_widths:
      history.created_day_of_week: 83
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 85ebde76-7c6b-6970-071e-79fda2ac49b3,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    truncate_column_names: false
    subtotals_at_bottom: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Hourly PDT Builds by Connection
    name: Hourly PDT Builds by Connection
    model: system__activity
    explore: pdt_event_log
    type: looker_area
    fields: [pdt_event_log.count, pdt_event_log.connection, pdt_event_log.created_hour_of_day]
    pivots: [pdt_event_log.connection]
    fill_fields: [pdt_event_log.created_hour_of_day]
    filters:
      pdt_event_log.action: create begin
      pdt_event_log.created_date: 7 days
    sorts: [pdt_event_log.connection, pdt_event_log.created_hour_of_day]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: PDT Builds, orientation: left, showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Created Hour of Day - UTC
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    ordering: asc
    show_null_labels: false
    note_state: collapsed
    note_display: hover
    note_text: ''
    hidden_fields: []
    defaults_version: 1
    listen: {}
    row: 31
    col: 0
    width: 24
    height: 6
  - title: Hourly Schedules
    name: Hourly Schedules
    model: system__activity
    explore: scheduled_plan
    type: looker_column
    fields: [scheduled_job.count, scheduled_job.created_hour_of_day, scheduled_plan.count]
    fill_fields: [scheduled_job.created_hour_of_day]
    filters:
      scheduled_job.created_date: 7 days
    sorts: [scheduled_job.created_hour_of_day]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    y_axes: [{label: Schedules, orientation: left, series: [{axisId: scheduled_job.count,
            id: scheduled_job.count, name: Scheduled Job Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: scheduled_plan.count,
            id: scheduled_plan.count, name: Scheduled Plan Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Hour of Day
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    series_labels: {}
    note_state: collapsed
    note_display: below
    note_text: Total schedule counts over the last 7 days for each hour of the day.
      The scheduled plan count is the number of unique schedules set to send that
      hour. One scheduled plan can run multiple times per hour and the scheduled job
      count is the cumulative number of scheduled jobs run per hour.
    hidden_fields: []
    defaults_version: 1
    listen: {}
    row: 25
    col: 0
    width: 24
    height: 6
  - title: Top 10 Sources by Query Count (last 7 days)
    name: Top 10 Sources by Query Count (last 7 days)
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, history.created_day_of_week, source_query_rank.sorted_source]
    pivots: [source_query_rank.sorted_source]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, source_query_rank.sorted_source desc]
    limit: 500
    column_limit: 10
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      zz_source_rank.source_rank: Rank
      zz_source_query_rank.source_query_rank: Rank
      history.source: Source
      history.created_day_of_week: Created
      source_query_rank.source_query_rank: Rank
      history.query_run_count: Queries Ran
    series_column_widths:
      history.created_day_of_week: 85
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 95f8f710-092a-a7e2-9207-021d209d7377,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true, stepped: false}}}]
    truncate_column_names: true
    subtotals_at_bottom: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 12
    col: 0
    width: 24
    height: 5

---
- dashboard: david_test
  title: David Test
  layout: newspaper
  preferred_slug: NYVbu0NwCTzuoO6TEkhZ3P

---
- dashboard: dbrd1
  title: dbrd1
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: MeJruKIVHSrFJnJlyIhvtt
  elements:
  - title: dbrd1
    name: dbrd1
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [user_order_facts.first_order_date, user_order_facts.user_id]
    sorts: [user_order_facts.first_order_date desc 0]
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
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: dbrd2
  title: dbrd2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: CfHh6fakQoTO4B9INVpJr6
  elements:
  - title: dbrd2
    name: dbrd2
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.email, order_items.total_sale_price]
    filters: {}
    sorts: [order_items.total_sale_price desc 0]
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
      Total Sale Price: order_items.total_sale_price
      Brand: products.brand
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Total Sale Price
    title: Total Sale Price
    type: field_filter
    default_value: ">100"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.total_sale_price

---
- dashboard: demand_gen_marketing_pulse
  title: Demand Gen Marketing Pulse
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: SR7DTkIgcXWglfKoeb18Go
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
      sessions.traffic_source: Adwords
      adevents.adevent_id: NOT NULL
    sorts: [sessions.session_start_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: adevents.total_cost, name: Total
              Spend, axisId: adevents.total_cost}, {id: session_purchase_facts.revenue,
            name: Revenue, axisId: session_purchase_facts.revenue}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', valueFormat: "$#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 11, type: linear}]
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
    hidden_series: [user_session_fact.average_engagement, user_session_fact.average_loyalty]
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: true
    show_silhouette: false
    ordering: none
    show_null_labels: false
    hidden_fields: []
    listen: {}
    row: 7
    col: 0
    width: 14
    height: 7
  - title: First Touch -  Acquisition Referrer
    name: First Touch -  Acquisition Referrer
    model: thelook_adwords
    explore: events
    type: looker_pie
    fields: [user_session_fact.count, user_session_fact.site_acquisition_source]
    filters:
      user_session_fact.site_acquisition_source: "-NULL"
    sorts: [user_session_fact.site_acquisition_source]
    limit: 500
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    inner_radius: 50
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 24
    col: 0
    width: 6
    height: 6
  - title: Conversion by Acquisition Referrer
    name: Conversion by Acquisition Referrer
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [user_session_fact.site_acquisition_source, sessions.all_sessions, sessions.count_cart_or_later,
      sessions.count_purchase]
    filters:
      user_session_fact.site_acquisition_source: "-NULL"
    sorts: [sessions.all_sessions desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: []
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
    hidden_series: [sessions.count_product_or_later]
    legend_position: center
    point_style: none
    series_colors: {}
    series_labels:
      sessions.all_sessions: Visits
      sessions.count_browse_or_later: Browse Visits
      sessions.count_cart_or_later: Add to Cart Visits
      sessions.count_purchase: Purchases
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    hidden_fields: []
    listen: {}
    row: 30
    col: 6
    width: 18
    height: 7
  - title: User Acquisition Trends
    name: User Acquisition Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [user_session_fact.first_visit_month, user_session_fact.count, user_session_fact.site_acquisition_source]
    pivots: [user_session_fact.site_acquisition_source]
    filters:
      user_session_fact.first_visit_month: 12 months ago for 12 months
    sorts: [user_session_fact.first_visit_month desc, user_session_fact.site_acquisition_source]
    limit: 500
    column_limit: 50
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    inner_radius: 50
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 17
    col: 12
    width: 12
    height: 6
  - title: Repeat Visits
    name: Repeat Visits
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [sessions.session_rank, user_session_fact.count]
    filters:
      sessions.session_rank: "<11"
      user_session_fact.first_visit_date: 12 months ago for 12 months
    sorts: [sessions.session_rank]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: return_rate
      label: Return rate
      expression: "${user_session_fact.count}/index(${user_session_fact.count},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: Retention, orientation: left, series: [{axisId: return_rate,
            id: return_rate, name: Return rate}], showLabels: false, showValues: true,
        maxValue: !!null '', minValue: !!null '', valueFormat: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Visit Number
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    show_null_points: true
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [user_acquisition.count, user_session_fact.count]
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 30
    col: 0
    width: 6
    height: 7
  - title: Customer LTV
    name: Customer LTV
    model: thelook_adwords
    explore: events
    type: looker_line
    fields: [sessions.months_since_first_session, session_purchase_facts.revenue,
      user_session_fact.site_acquisition_source, user_session_fact.count]
    pivots: [user_session_fact.site_acquisition_source]
    filters:
      sessions.months_since_first_session: "[0, 18]"
    sorts: [sessions.months_since_first_session, user_session_fact.site_acquisition_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: salesuser
      label: Sales/User
      expression: "${session_purchase_facts.revenue}/index(${user_session_fact.count},\
        \ 1)"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cumulative_salesuser
      label: Cumulative Sales/User
      expression: running_total(${salesuser})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Lifetime Sales/User, maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: Adwords, name: Adwords, axisId: cumulative_salesuser}, {id: Email,
            name: Email, axisId: cumulative_salesuser}, {id: Facebook, name: Facebook,
            axisId: cumulative_salesuser}, {id: Organic, name: Organic, axisId: cumulative_salesuser},
          {id: YouTube, name: YouTube, axisId: cumulative_salesuser}]}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Months since acquisition
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [session_purchase_facts.total_sale_price, user_acquisition.count,
      salesuser, session_purchase_facts.revenue, user_session_fact.count]
    listen: {}
    row: 23
    col: 12
    width: 12
    height: 7
  - title: Total Spend
    name: Total Spend
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [adevents.total_cost, adevents.created_quarter]
    fill_fields: [adevents.created_quarter]
    filters:
      adevents.created_quarter: 3 quarters ago for 3 quarters
    sorts: [adevents.created_quarter desc]
    limit: 500
    dynamic_fields:
    - table_calculation: prior_month
      label: Prior Month
      expression: "${adevents.total_cost}/offset(${adevents.total_cost}, 1)-1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    hidden_fields: []
    comparison_label: Prior Quarter
    single_value_title: Total Spend
    value_format: "$#,##0"
    y_axes: []
    listen: {}
    row: 3
    col: 9
    width: 4
    height: 4
  - title: Revenue
    name: Revenue
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [session_attribution.total_attribution, sessions.session_start_quarter]
    fill_fields: [sessions.session_start_quarter]
    filters:
      session_attribution.attribution_source: Adwords
      sessions.session_start_quarter: 3 quarters ago for 3 quarters
    sorts: [sessions.session_start_quarter desc]
    limit: 500
    dynamic_fields:
    - table_calculation: prior_period
      label: Prior Period
      expression: "${session_attribution.total_attribution}/offset(${session_attribution.total_attribution},1)-1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    single_value_title: Adwords Revenue
    value_format: "$#,##0"
    comparison_label: Prior Quarter
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Attribution Source: session_attribution.attribution_filter
      Acquisition Date: adevents.created_date
    row: 3
    col: 0
    width: 5
    height: 4
  - title: Purchases
    name: Purchases
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [sessions.count_with_purchase, session_attribution.last_session_end_quarter]
    fill_fields: [session_attribution.last_session_end_quarter]
    filters:
      session_attribution.attribution_source: Adwords
      session_attribution.last_session_end_month: 2 quarters ago for 2 quarters
    sorts: [session_attribution.last_session_end_quarter desc]
    limit: 500
    dynamic_fields:
    - table_calculation: prior_period
      label: Prior Period
      expression: "${sessions.count_with_purchase}/offset(${sessions.count_with_purchase},1)-1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    single_value_title: Purchases
    comparison_label: Prior Quarter
    hidden_fields: []
    y_axes: []
    listen:
      Attribution Source: session_attribution.attribution_filter
    row: 3
    col: 13
    width: 4
    height: 4
  - title: Users Acquired
    name: Users Acquired
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [user_session_fact.count, user_session_fact.first_visit_quarter]
    fill_fields: [user_session_fact.first_visit_quarter]
    filters:
      session_attribution.attribution_source: Adwords
      user_session_fact.first_visit_quarter: 2 quarters ago for 2 quarters
    sorts: [user_session_fact.first_visit_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: prior_period
      label: Prior Period
      expression: "${user_session_fact.count}/offset( ${user_session_fact.count},1)-1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    single_value_title: Users Acquired
    value_format: "###,###"
    comparison_label: Prior Quarter
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: First purchase
    listen:
      Attribution Source: session_attribution.attribution_filter
    row: 3
    col: 5
    width: 4
    height: 4
  - title: Last Touch Conversion Referrer
    name: Last Touch Conversion Referrer
    model: thelook_adwords
    explore: sessions
    type: looker_pie
    fields: [session_attribution.attribution_source, session_attribution.total_attribution]
    filters:
      session_attribution.attribution_filter: Last Touch
      session_attribution.attribution_source: "-NULL"
    sorts: [session_attribution.attribution_source]
    limit: 500
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    inner_radius: 50
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 24
    col: 6
    width: 6
    height: 6
  - name: "<span class='fa fa-dollar'> Revenue Attribution</span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Revenue Attribution</span>"
    subtitle_text: How much are we spending and making from our campaigns?
    body_text: "**Recommended Action** Drill deeper into our campaigns with the highest\
      \ spend to make any necessary adjustments"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: First Touch to Last Touch Analysis
    name: First Touch to Last Touch Analysis
    model: thelook_adwords
    explore: events
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [user_session_fact.site_acquisition_source, sessions.traffic_source, session_purchase_facts.revenue]
    filters:
      user_session_fact.site_acquisition_source: "-NULL"
    sorts: [session_purchase_facts.revenue desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    y_axes: []
    defaults_version: 0
    listen: {}
    row: 17
    col: 0
    width: 12
    height: 7
  - name: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    subtitle_text: Where are our customers coming from and when do they drop off?
    row: 14
    col: 0
    width: 24
    height: 3
  - title: ROI by Channel
    name: ROI by Channel
    model: thelook_adwords
    explore: sessions
    type: looker_pie
    fields: [session_attribution.attribution_source, session_attribution.total_attribution]
    filters:
      session_attribution.attribution_source: "-NULL"
    sorts: [session_attribution.total_attribution desc, session_attribution.attribution_source]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: Revenue, orientation: bottom, series: [{axisId: Adwords - session_attribution.total_attribution,
            id: Adwords - session_attribution.total_attribution, name: Adwords}, {
            axisId: Email - session_attribution.total_attribution, id: Email - session_attribution.total_attribution,
            name: Email}, {axisId: Facebook - session_attribution.total_attribution,
            id: Facebook - session_attribution.total_attribution, name: Facebook},
          {axisId: Organic - session_attribution.total_attribution, id: Organic -
              session_attribution.total_attribution, name: Organic}, {axisId: YouTube
              - session_attribution.total_attribution, id: YouTube - session_attribution.total_attribution,
            name: YouTube}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    label_value_format: '[>=1000000000]$#,##0.0,,," B";[>=1000000]$#0.0,," M";$#0.0,"
      K"'
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    hidden_fields: []
    listen:
      Attribution Source: session_attribution.attribution_filter
    row: 3
    col: 17
    width: 7
    height: 4
  - title: Highest Spending Campaigns
    name: Highest Spending Campaigns
    model: thelook_adwords
    explore: sessions
    type: looker_grid
    fields: [campaigns.campaign_name, adevents.total_cost, session_attribution.ROI,
      session_attribution.total_attribution]
    sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    sessions.session_start_date: 3 months
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
    session_attribution.total_attribution: Revenue
    campaigns.campaign_name: 237
    adevents.total_cost:
    session_attribution.ROI:
    series_cell_visualizations:
    is_active: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [session_attribution.ROI]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [session_attribution.total_attribution]}]
    format_string: "#,##0%"
    label: Percent (0)
    defaults_version: 1
    listen: {}
    row: 7
    col: 14
    width: 10
    height: 7
  filters:
  - name: Attribution Source
    title: Attribution Source
    type: field_filter
    default_value: Last Touch
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: thelook_adwords
    explore: sessions
    listens_to_filters: []
    field: session_attribution.attribution_filter
  - name: Acquisition Date
    title: Acquisition Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline

---
- dashboard: demito
  title: Demito
  layout: newspaper
  description: ''
  preferred_slug: rkvekMYzwBnDVgju3v42Jt
  elements:
  - title: Stock & Ventas
    name: Stock & Ventas
    model: thelook
    explore: order_items
    type: looker_column
    fields: [inventory_items.number_on_hand, order_items.total_sale_price, products.item_name]
    filters:
      order_items.created_date: last month
    sorts: [inventory_items.number_on_hand desc 0]
    limit: 10
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
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Untitled
    name: Untitled
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.state]
    filters:
      order_items.created_date: 7 days
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    row: 0
    col: 8
    width: 8
    height: 6

---
- dashboard: demo
  title: Demo
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: uSQu3PZJrWiEpjL36GHAr3
  elements:
  - title: Demo
    name: Demo
    model: thelook
    explore: order_items
    type: looker_column
    fields: [products.brand, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    filters: {}
    sorts: [order_items.created_year desc, order_items.total_sale_price desc 0]
    limit: 10
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
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: this year, last year
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: demo_
  title: 'Demo '
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: D1KBAp3D53qUqU3xVwPN3r
  embed_style:
    background_color: "#f7f7f7"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: "#ffffff"
  elements:
  - title: Number of First Purchasers
    name: Number of First Purchasers
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.count]
    filters:
      users.created_date: 7 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal
      label: Goal
      expression: '10000'
      value_format:
      value_format_name: decimal_0
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: medium
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    text_color: black
    single_value_title: New Users Acquired
    custom_color: forestgreen
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 0
    width: 4
    height: 4
  - title: Average Order Sale Price
    name: Average Order Sale Price
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    sorts: [orders.average_profit desc, order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: date
      label: date
      expression: now()
      value_format:
      value_format_name:
      _kind_hint: dimension
      is_disabled: true
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    show_view_names: true
    font_size: medium
    text_color: black
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
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
    note_state: expanded
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 4
    width: 4
    height: 4
  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: thelook
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.count, order_items.created_date]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    filters:
      products.category: Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies &
        Sweatshirts,Accessories
    sorts: [products.category, order_items.created_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Number of Orders, orientation: left, series: [{id: Accessories
              - order_items.count, name: Accessories, axisId: order_items.count},
          {id: Blazers & Jackets - order_items.count, name: Blazers &amp; Jackets,
            axisId: order_items.count}, {id: Fashion Hoodies & Sweatshirts - order_items.count,
            name: Fashion Hoodies &amp; Sweatshirts, axisId: order_items.count}, {
            id: Pants - order_items.count, name: Pants, axisId: order_items.count},
          {id: Shorts - order_items.count, name: Shorts, axisId: order_items.count},
          {id: Sweaters - order_items.count, name: Sweaters, axisId: order_items.count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: ["# Order Items"]
    hide_legend: false
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    series_colors: {}
    x_axis_datetime_tick_count: 4
    x_axis_datetime: true
    hide_points: true
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 6
    col: 0
    width: 16
    height: 6
  - title: Website Visit Volume vs Conversion Rate
    name: Website Visit Volume vs Conversion Rate
    model: thelook
    explore: events
    type: looker_column
    fields: [events.event_day_of_week, events.sessions_count, events.unique_visitors,
      sessions.overall_conversion]
    sorts: [events.event_day_of_week]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: events.unique_visitors,
            name: Unique Visitors}, {id: events.sessions_count, name: Sessions Count}]},
      {label: '', maxValue: !!null '', minValue: !!null '', orientation: right, showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Conversion Rate}]}]
    colors: ["#1EA8DF", "#8ED3EF", "#B1A8C4", "#635189"]
    series_types:
      events.unique_visitors: line
      events.sessions_count: line
    series_colors: {}
    series_labels:
      sessions.overall_conversion: Conversion Rate
      events.sessions_count: Total Visitors
    label_color: ["#EA8A2F", "#e9b404"]
    y_axis_orientation: [left, right]
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: events.event_date
      Country: users.country
    row: 26
    col: 0
    width: 10
    height: 7
  - title: Percent of Cohort Still Active by Traffic Source
    name: Percent of Cohort Still Active by Traffic Source
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [order_items.months_since_signup, users.age_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: pct_cohort_still_active
      label: Pct Cohort Still Active
      expression: "${users.count} / max(${users.count})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Percent of Cohort still Active, orientation: left, series: [
          {axisId: pct_cohort_still_active, id: Display - pct_cohort_still_active,
            name: Display}, {axisId: pct_cohort_still_active, id: Email - pct_cohort_still_active,
            name: Email}, {axisId: pct_cohort_still_active, id: Facebook - pct_cohort_still_active,
            name: Facebook}, {axisId: pct_cohort_still_active, id: Organic - pct_cohort_still_active,
            name: Organic}, {axisId: pct_cohort_still_active, id: Search - pct_cohort_still_active,
            name: Search}], showLabels: true, showValues: true, maxValue: !!null '',
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_max: ['50']
    y_axis_labels: [Percent of Cohort still Active]
    y_axis_value_format: "#\\%"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    series_colors: {}
    swap_axes: false
    discontinuous_nulls: false
    hidden_fields: [cumulative_lifetime_spend, order_items.total_sale_price, users.count]
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 33
    col: 10
    width: 14
    height: 7
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_month_name, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_month_name]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc 0, order_items.created_month_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: '2018', name: '2018', axisId: order_items.total_sale_price},
          {id: '2017', name: '2017', axisId: order_items.total_sale_price}, {id: '2016',
            name: '2016', axisId: order_items.total_sale_price}, {id: '2015', name: '2015',
            axisId: order_items.total_sale_price}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear, valueFormat: "$0,\\\
          K\\"}]
    y_axis_value_format: "$#,##0"
    x_axis_label: Month of Year
    colors: ["#635189", "#B1A8C4", "#1EA8DF", "#8ED3EF"]
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [calculation_1]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 16
    width: 8
    height: 10
  - title: Highest Spending Users
    name: Highest Spending Users
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [users.approx_location, users.gender, order_items.total_sale_price, order_items.average_spend_per_user]
    pivots: [users.gender]
    sorts: [users.gender 0, order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: [orders.count, order_items.total_sale_price]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: traffic_day
    map_position: custom
    map_latitude: 37.57941251343841
    map_longitude: -99.31640625000001
    map_zoom: 4
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle_and_icon
    map_marker_icon_name: person
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_max: 15
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    map_marker_color: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    show_legend: true
    map_value_colors: [white, purple]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 200
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    loading: false
    map: usa
    map_projection: ''
    quantize_colors: false
    colors: [whitesmoke, "#64518A"]
    outer_border_color: "#64518A"
    inner_border_color: ''
    inner_border_width: 0.6
    outer_border_width: 2
    empty_color: ''
    y_axes: []
    defaults_version: 0
    note_state: collapsed
    note_display: hover
    note_text: Bubble size corresponds to average user spend
    hidden_pivots: {}
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 14
    col: 10
    width: 14
    height: 9
  - title: User Behaviors by Traffic Source
    name: User Behaviors by Traffic Source
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.average_sale_price, user_order_facts.average_lifetime_orders]
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: order_items.average_sale_price,
            name: Average Sale Price, axisId: order_items.average_sale_price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: user_order_facts.average_lifetime_orders,
            name: Average Lifetime Orders, axisId: user_order_facts.average_lifetime_orders}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: [Average Sale Price ($)]
    y_axis_value_format: '0'
    hide_legend: false
    colors: ["#1ea8df", "#a2dcf3", "#929292", "#9fdee0", "#1f3e5a", "#90c8ae", "#92818d",
      "#c5c6a6", "#82c2ca", "#cee0a0", "#928fb4", "#9fc190"]
    font_size: '13'
    series_colors: {}
    y_axis_orientation: [left, right]
    hidden_fields: [percent_repeat_customers]
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 33
    col: 0
    width: 10
    height: 7
  - title: User Basic Demographic Profile
    name: User Basic Demographic Profile
    model: thelook
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, users.traffic_source, order_items.count]
    pivots: [users.traffic_source]
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source, order_items.count
        desc 0]
    limit: 500
    column_limit: 15
    show_value_labels: true
    font_size: 15
    hide_legend: false
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_colors: {}
    show_view_names: true
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 14
    col: 0
    width: 10
    height: 9
  - title: 30 Day Repeat Purchase Rate
    name: 30 Day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate]
    sorts: [repeat_purchase_facts.30_day_repeat_purchase_rate desc, order_items.30_day_repeat_purchase_rate
        desc]
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: ''
    single_value_title: Repeat Purchase Rate
    conditional_formatting: [{type: greater than, value: 0.1, background_color: "#ffffe5",
        font_color: "#FBB555", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.13,
        background_color: '', font_color: "#C2DD67", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.15,
        background_color: '', font_color: "#72D16D", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size: medium
    text_color: black
    colors: ["#1f78b4", "#a6cee3", "#33a02c", "#b2df8a", "#e31a1c", "#fb9a99", "#ff7f00",
      "#fdbf6f", "#6a3d9a", "#cab2d6", "#b15928", "#edbc0e"]
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: What percent of orders are followed by a repeat purchase by the same
      user within 30 days?
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 8
    width: 4
    height: 4
  - title: Total Order Count
    name: Total Order Count
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.count, order_items.created_year]
    fill_fields: [order_items.created_year]
    filters:
      order_items.created_year: 2 years
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${order_items.count}/offset(${order_items.count},1) - 1"
      value_format:
      value_format_name: percent_0
      is_disabled: true
    - args:
      - order_items.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: order_items.count
      label: Percent change from previous - Order Items Count
      source_field: order_items.count
      table_calculation: percent_change_from_previous_order_items_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - order_items.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: order_items.count
      label: Percent change from previous - Order Items Count
      source_field: order_items.count
      table_calculation: percent_change_from_previous_order_items_count_2
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    single_value_title: Orders This Year
    hidden_fields: [order_items.reporting_period, order_items.created_year]
    comparison_label: vs Same Period Last Year
    custom_color: forestgreen
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    hidden_pivots: {}
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 12
    width: 4
    height: 4
  - name: "<span class='fa fa-users'> </span> Customer Demographics"
    type: text
    title_text: "<span class='fa fa-users'> </span> Customer Demographics"
    subtitle_text: Who are our customers?
    row: 12
    col: 0
    width: 24
    height: 2
  - title: Most Viewed Brands Online
    name: Most Viewed Brands Online
    model: thelook
    explore: sessions
    type: looker_grid
    fields: [product_viewed.brand, sessions.count, sessions.cart_to_checkout_conversion,
      product_viewed.department]
    pivots: [product_viewed.department]
    filters:
      product_viewed.brand: "-NULL"
    sorts: [sessions.count desc 0, product_viewed.department]
    limit: 10
    column_limit: 50
    row_total: right
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sessions.cart_to_checkout_conversion: Cart Conversion
    series_cell_visualizations:
      sessions.count:
        is_active: true
        palette:
          palette_id: google-sequential-0
          collection_id: google
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: [sessions.cart_to_checkout_conversion]}]
    conditional_formatting_ignored_fields: []
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    truncate_column_names: true
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      Country: users.country
    row: 26
    col: 10
    width: 14
    height: 7
  - name: "<span class='fa fa-laptop'> </span> Web Analytics"
    type: text
    title_text: "<span class='fa fa-laptop'> </span> Web Analytics"
    subtitle_text: What are customers doing on our website?
    body_text: "**Recommended Action** Dive into successful brands to see what they're\
      \ doing that's working, drill by category or head to the Brand Analytics report"
    row: 23
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    subtitle_text: Are we headed in the right direction?
    row: 0
    col: 0
    width: 24
    height: 2
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.count]
    filters:
      users.state: ''
      users.city: ''
      users.traffic_source: ''
      users.gender: ''
      order_items.created_date: 90 days
      distribution_centers.location: ''
      users.country: ''
      order_items.created_year: 1 years
    sorts: [users.traffic_source, order_items.count desc]
    limit: 500
    column_limit: 15
    dynamic_fields:
    - category: table_calculation
      label: Percent of all orders
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: percent_of_all_orders
      args:
      - order_items.count
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    font_size: 15
    hide_legend: false
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_colors: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    hidden_pivots: {}
    listen: {}
    row: 40
    col: 0
    width: 10
    height: 7
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: [Country]
    field: users.state
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: [State, Country]
    field: users.city
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.traffic_source
  - name: User Gender
    title: User Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.gender
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: distribution_centers.location
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.country

---
- dashboard: demo
  title: demo
  layout: newspaper
  preferred_slug: lHG2aJVzC9SvednDrC9CvI
