---
- dashboard: ceo_dashboard
  title: CEO dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: cbfRjoQ12VuTz1hotK19lj
  elements:
  - title: CEO dashboard
    name: CEO dashboard
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.email, user_order_facts.lifetime_revenue]
    filters: {}
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
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
    default_value: 6 months
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
- dashboard: chain_details
  title: Chain Details
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: RZbF4ReRz00O3655QMLfG7
  elements:
  - title: Market Details
    name: Market Details
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.id, market_data.symbol, market_data.market_cap, market_data.market_cap_change_percentage_24h,
      market_data.market_cap_change_24h, market_data.fully_diluted_valuation]
    limit: 500
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
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 25
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap Change % 24hrs
      market_data.market_cap_change_24h: Market Cap Change 24hrs
    header_font_color: "#fffefa"
    header_background_color: "#1A73E8"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [market_data.id]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ticker symbol, market cap, market cap change percentage in the last
      24 hours, actual market cap change in the last 24 hours, and fully diluted valuation
    listen:
      ID: market_data.id
    row: 12
    col: 6
    width: 16
    height: 4
  - title: 24hr High
    name: 24hr High
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.id, market_data.high_24h, market_data.ath]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: All-time High
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#0F9D58",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [market_data.id]
    show_view_names: false
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: highest price in the last 24 hours compared with the all time highest
      price
    listen:
      ID: market_data.id
    row: 0
    col: 10
    width: 6
    height: 5
  - title: Current Price
    name: Current Price
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.current_price]
    sorts: [market_data.current_price]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    comparison_label: All-time High
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F4B400",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
    defaults_version: 1
    hidden_fields: []
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
    note_state: collapsed
    note_display: hover
    note_text: current price
    listen:
      ID: market_data.id
    row: 5
    col: 16
    width: 6
    height: 2
  - title: 24hr Low
    name: 24hr Low
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.id, market_data.low_24h, market_data.atl]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: All-time Low
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [market_data.id]
    show_view_names: false
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Lowest price in the last 24 hours compared with the all time low price.
    listen:
      ID: market_data.id
    row: 0
    col: 16
    width: 6
    height: 5
  - title: Supply
    name: Supply
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.id, market_data.name, market_data.total_volume, market_data.circulating_supply,
      market_data.total_supply, market_data.max_supply]
    sorts: [market_data.total_volume]
    limit: 500
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
    enable_conditional_formatting: false
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
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
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
    hidden_fields: [market_data.id]
    note_state: collapsed
    note_display: hover
    note_text: information about the cryptocurrency supply including the cryptocurrency
      name, total volume, total supply, circulating supply, and max supply.
    listen:
      ID: market_data.id
    row: 16
    col: 6
    width: 16
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: "---"
    row: 29
    col: 0
    width: 22
    height: 1
  - name: " (2)"
    type: text
    title_text: ''
    body_text: ''
    row: 0
    col: 22
    width: 2
    height: 46
  - name: " (3)"
    type: text
    title_text: ''
    body_text: '[{"type":"h3","children":[{"text":"Documentation Resources:"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 30
    col: 0
    width: 22
    height: 2
  - title: 1hr
    name: 1hr
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.price_change_percentage_1h_in_currency]
    sorts: [market_data.price_change_percentage_1h_in_currency]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#DB4437",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#0F9D58", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0, background_color: '', font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: percent price change in the last hour
    listen:
      ID: market_data.id
    row: 12
    col: 0
    width: 6
    height: 4
  - title: 24hrs
    name: 24hrs
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.price_change_percentage_24h_in_currency]
    sorts: [market_data.price_change_percentage_24h_in_currency]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#DB4437",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#0F9D58", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0, background_color: '', font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: percent price change in the last 24 hours
    listen:
      ID: market_data.id
    row: 16
    col: 0
    width: 3
    height: 4
  - title: 7 Days
    name: 7 Days
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.price_change_percentage_7d_in_currency]
    sorts: [market_data.price_change_percentage_7d_in_currency]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#DB4437",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#0F9D58", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0, background_color: '', font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: percent price change in the last 7 days
    listen:
      ID: market_data.id
    row: 16
    col: 3
    width: 3
    height: 4
  - title: Average Price
    name: Average Price
    model: portfolio
    explore: market_data
    type: looker_line
    fields: [history_with_date_crossjoin.history_date_month, average_of_price]
    fill_fields: [history_with_date_crossjoin.history_date_month]
    filters:
      history_with_date_crossjoin.coin_id: ''
    sorts: [history_with_date_crossjoin.history_date_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: history_with_date_crossjoin.price
      expression: ''
      label: Average of Price
      measure: average_of_price
      type: average
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
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Line chart displaying the average price by month over time.
    listen:
      ID: market_data.id
    row: 21
    col: 0
    width: 12
    height: 8
  - title: Max - Avg - Min Price Comparison
    name: Max - Avg - Min Price Comparison
    model: portfolio
    explore: market_data
    type: looker_area
    fields: [history_with_date_crossjoin.history_date_month, max_of_price, average_of_price,
      min_of_price]
    fill_fields: [history_with_date_crossjoin.history_date_month]
    filters:
      history_with_date_crossjoin.coin_id: ''
    sorts: [history_with_date_crossjoin.history_date_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: history_with_date_crossjoin.price
      expression: ''
      label: Max of Price
      measure: max_of_price
      type: max
    - _kind_hint: measure
      _type_hint: number
      based_on: history_with_date_crossjoin.price
      expression: ''
      label: Average of Price
      measure: average_of_price
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: history_with_date_crossjoin.price
      expression: ''
      label: Min of Price
      measure: min_of_price
      type: min
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
    series_colors: {}
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: area chart displaying the max, average, and min prices by month.
    title_hidden: true
    listen:
      ID: market_data.id
    row: 21
    col: 12
    width: 10
    height: 8
  - type: button
    name: button_2922
    rich_content_json: '{"text":"go/crypto-docs","description":"Go link for project
      documentation","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/document/d/174luN1cBlKDsWAwxJ-iWQlcfu9VvmluxuGXjbxeCJBo/edit?usp=sharing&resourcekey=0-lHgn7xfc58ETpklp9xzgNA"}'
    row: 32
    col: 0
    width: 22
    height: 1
  - name: Price Change Information
    type: text
    title_text: Price Change Information
    body_text: ''
    row: 11
    col: 0
    width: 6
    height: 1
  - name: Market & Supply Information
    type: text
    title_text: Market & Supply Information
    body_text: ''
    row: 11
    col: 6
    width: 16
    height: 1
  - name: Price Trends
    type: text
    title_text: Price Trends
    body_text: ''
    row: 20
    col: 0
    width: 22
    height: 1
  - title: Market Cap Rank
    name: Market Cap Rank
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.id, market_data.market_cap_rank]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: "#000", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [market_data.id]
    show_view_names: false
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Market Cap Rank
    listen:
      ID: market_data.id
    row: 7
    col: 16
    width: 6
    height: 2
  - title: Logo
    name: Logo
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.image]
    sorts: [market_data.image]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
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
    note_state: collapsed
    note_display: hover
    note_text: icon image
    listen:
      ID: market_data.id
    row: 5
    col: 10
    width: 6
    height: 6
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 10
    height: 11
  - title: name tile
    name: name tile
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.name]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
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
    note_state: collapsed
    note_display: above
    note_text: Cryptocurrency name
    listen:
      ID: market_data.id
    row: 9
    col: 16
    width: 6
    height: 2
  filters:
  - name: ID
    title: ID
    type: field_filter
    default_value: bitcoin
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: popover
    model: portfolio
    explore: market_data
    listens_to_filters: []
    field: market_data.id

---
- dashboard: chain_trends
  title: Chain Trends
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DIELmk76yWyHWn5EyIT9Lm
  elements:
  - title: Avg Transaction Count per Block -  3 Mo
    name: Avg Transaction Count per Block -  3 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, full_public_dataset.avg_transaction_count]
    filters:
      full_public_dataset.real_block_timestamp_month: 3 months
    sorts: [full_public_dataset.avg_transaction_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    hidden_pivots: {}
    listen: {}
    row: 42
    col: 2
    width: 7
    height: 4
  - title: Average Block Size - Last 6 Months
    name: Average Block Size - Last 6 Months
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [average_of_block_size, full_public_dataset.coin_id]
    filters:
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [average_of_block_size desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    listen: {}
    row: 26
    col: 9
    width: 7
    height: 5
  - title: Average Block Size - Last 9 Months
    name: Average Block Size - Last 9 Months
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [average_of_block_size, full_public_dataset.coin_id]
    filters:
      full_public_dataset.real_block_timestamp_month: 9 months
    sorts: [average_of_block_size desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    listen: {}
    row: 26
    col: 16
    width: 6
    height: 5
  - title: Avg Transaction Count per Block -  6 Mo
    name: Avg Transaction Count per Block -  6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, full_public_dataset.avg_transaction_count]
    filters:
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.avg_transaction_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    hidden_pivots: {}
    listen: {}
    row: 42
    col: 9
    width: 6
    height: 4
  - title: Avg Transaction Count per Block -  9 Mo
    name: Avg Transaction Count per Block -  9 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, full_public_dataset.avg_transaction_count]
    filters:
      full_public_dataset.real_block_timestamp_month: 9 months
    sorts: [full_public_dataset.avg_transaction_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    hidden_pivots: {}
    listen: {}
    row: 42
    col: 15
    width: 7
    height: 4
  - title: Count of No-Fee Transactions - 6 Mo
    name: Count of No-Fee Transactions - 6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, sum_of_transaction_count]
    filters:
      full_public_dataset.fee: '0'
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.coin_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_count
      expression: ''
      label: Sum of Transaction Count
      measure: sum_of_transaction_count
      type: sum
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sum_of_transaction_count: Total Transaction Count
    series_cell_visualizations:
      sum_of_transaction_count:
        is_active: true
    series_value_format:
      sum_of_transaction_count:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 49
    col: 2
    width: 6
    height: 4
  - title: Total Transaction Count - Fee Incurred -  6 Mo
    name: Total Transaction Count - Fee Incurred -  6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, sum_of_transaction_count]
    filters:
      full_public_dataset.fee: not 0
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.coin_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_count
      expression: ''
      label: Sum of Transaction Count
      measure: sum_of_transaction_count
      type: sum
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sum_of_transaction_count: Total Transaction Count
    series_cell_visualizations:
      sum_of_transaction_count:
        is_active: true
    series_value_format:
      sum_of_transaction_count:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 49
    col: 8
    width: 7
    height: 4
  - title: Fee Comparison -  6 Mo
    name: Fee Comparison -  6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, sum_of_fee, average_of_fee]
    filters:
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.coin_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_count
      expression: ''
      label: Sum of Transaction Count
      measure: sum_of_transaction_count
      type: sum
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.fee
      expression: ''
      label: Sum of Fee
      measure: sum_of_fee
      type: sum
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.fee
      expression: ''
      label: Average of Fee
      measure: average_of_fee
      type: average
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sum_of_transaction_count: Total Transaction Count
      average_of_fee: Average Fee Paid
      sum_of_fee: Total Fee Paid
    series_cell_visualizations:
      sum_of_transaction_count:
        is_active: true
    series_value_format:
      sum_of_fee:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      average_of_fee:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 49
    col: 15
    width: 7
    height: 4
  - title: Average Transaction Size - Comparison
    name: Average Transaction Size - Comparison
    model: portfolio
    explore: full_public_dataset
    type: looker_line
    fields: [full_public_dataset.coin_id, average_of_transaction_size, full_public_dataset.block_timestamp_year]
    pivots: [full_public_dataset.coin_id]
    fill_fields: [full_public_dataset.block_timestamp_year]
    sorts: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_size
      expression: ''
      label: Average of Transaction Size
      measure: average_of_transaction_size
      type: average
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
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    y_axes: [{label: Average Transaction Size (Bytes), orientation: left, series: [
          {axisId: average_of_transaction_size, id: bitcoin - average_of_transaction_size,
            name: bitcoin}, {axisId: average_of_transaction_size, id: bitcoin-cash
              - average_of_transaction_size, name: bitcoin-cash}, {axisId: average_of_transaction_size,
            id: dogecoin - average_of_transaction_size, name: dogecoin}, {axisId: average_of_transaction_size,
            id: litecoin - average_of_transaction_size, name: litecoin}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Year
    x_axis_zoom: true
    y_axis_zoom: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 2
    col: 2
    width: 20
    height: 10
  - title: Average Transaction Count per Block - Comparison
    name: Average Transaction Count per Block - Comparison
    model: portfolio
    explore: full_public_dataset
    type: looker_line
    fields: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year,
      full_public_dataset.avg_transaction_count]
    pivots: [full_public_dataset.coin_id]
    fill_fields: [full_public_dataset.block_timestamp_year]
    sorts: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_size
      expression: ''
      label: Average of Transaction Size
      measure: average_of_transaction_size
      type: average
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
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    y_axes: [{label: Average Count of Transactions per Block, orientation: left, series: [
          {axisId: full_public_dataset.avg_transaction_count, id: bitcoin - full_public_dataset.avg_transaction_count,
            name: bitcoin}, {axisId: full_public_dataset.avg_transaction_count, id: bitcoin-cash
              - full_public_dataset.avg_transaction_count, name: bitcoin-cash}, {
            axisId: full_public_dataset.avg_transaction_count, id: dogecoin - full_public_dataset.avg_transaction_count,
            name: dogecoin}, {axisId: full_public_dataset.avg_transaction_count, id: litecoin
              - full_public_dataset.avg_transaction_count, name: litecoin}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Year
    x_axis_zoom: true
    y_axis_zoom: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 34
    col: 2
    width: 20
    height: 8
  - name: ''
    type: text
    title_text: ''
    body_text: "---"
    row: 31
    col: 2
    width: 20
    height: 1
  - title: Average Block Size - Comparison
    name: Average Block Size - Comparison
    model: portfolio
    explore: full_public_dataset
    type: looker_line
    fields: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year,
      average_of_block_size]
    pivots: [full_public_dataset.coin_id]
    fill_fields: [full_public_dataset.block_timestamp_year]
    sorts: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_size
      expression: ''
      label: Average of Transaction Size
      measure: average_of_transaction_size
      type: average
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
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    y_axes: [{label: Average Size of Blocks (Bytes), orientation: left, series: [
          {axisId: average_of_block_size, id: bitcoin - average_of_block_size, name: bitcoin},
          {axisId: average_of_block_size, id: bitcoin-cash - average_of_block_size,
            name: bitcoin-cash}, {axisId: average_of_block_size, id: dogecoin - average_of_block_size,
            name: dogecoin}, {axisId: average_of_block_size, id: litecoin - average_of_block_size,
            name: litecoin}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Year
    x_axis_zoom: true
    y_axis_zoom: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 15
    col: 2
    width: 20
    height: 11
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Average Transaction Size","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 2
    width: 20
    height: 2
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    body_text: '[{"type":"h1","children":[{"text":"Average Block Size","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 2
    width: 20
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "---"
    row: 46
    col: 2
    width: 20
    height: 1
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "---"
    row: 12
    col: 2
    width: 20
    height: 1
  - name: " (5)"
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Transaction Fees","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 47
    col: 2
    width: 20
    height: 2
  - name: " (Copy 3)"
    type: text
    title_text: " (Copy 3)"
    body_text: '[{"type":"h1","children":[{"text":"Average Transaction Count Per Block","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 32
    col: 2
    width: 20
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 2
    height: 69
  - name: " (7)"
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 22
    width: 2
    height: 69
  - name: " (8)"
    type: text
    title_text: ''
    body_text: "###Learn more about this project, the data sources, architecture,\
      \ and how to best use this and other related dashboards:"
    row: 53
    col: 9
    width: 5
    height: 5
  - type: button
    name: button_2834
    rich_content_json: '{"text":"go/crypto-docs","description":"Internal project documentation
      go-link","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/document/d/174luN1cBlKDsWAwxJ-iWQlcfu9VvmluxuGXjbxeCJBo/edit?usp=sharing&resourcekey=0-lHgn7xfc58ETpklp9xzgNA"}'
    row: 53
    col: 15
    width: 5
    height: 5
  - name: " (9)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"imocu"},{"type":"h1","children":[{"text":"Note:","fontSize":"10.5pt","backgroundColor":"transparent","color":"rgb(38,
      45, 51)","bold":true},{"text":" To dig further into a single chain, click on
      the three dots to the right of the chain name in a chart to navigate to a dashboard
      filtered on that specific chain.","fontSize":"10.5pt","backgroundColor":"transparent","color":"rgb(38,
      45, 51)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 53
    col: 2
    width: 7
    height: 6
  - title: Average Block Size - Last 3 Months
    name: Average Block Size - Last 3 Months
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [average_of_block_size, full_public_dataset.coin_id]
    filters:
      full_public_dataset.real_block_timestamp_month: 3 months
    sorts: [average_of_block_size desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_column_widths:
      full_public_dataset.coin_id: 156
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    defaults_version: 1
    listen: {}
    row: 26
    col: 2
    width: 7
    height: 5

---
- dashboard: chat_support
  title: Chat Support
  layout: newspaper
  description: ''
  preferred_slug: j1bAzAQWwRyGCZt1ZjojT5
  elements:
  - name: Chatter KPIs
    type: text
    title_text: Chatter KPIs
    row: 0
    col: 0
    width: 24
    height: 2
  - title: "[Team] Average Tickets / Week"
    name: "[Team] Average Tickets / Week"
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.average_tickets_per_week, assignee.count]
    filters:
      ticket.created_date: 1 years
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: average_number_of_tickets_per_chatter
      label: Average Number of Tickets per Chatter
      expression: "${ticket.average_tickets_per_week}/${assignee.count}"
      value_format:
      value_format_name: decimal_1
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
    custom_color: "#f8fffc"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [ticket.average_tickets_per_week, assignee.count]
    note_state: collapsed
    note_display: hover
    note_text: The average number of tickets, per chatter, across the whole team this
      year
    listen: {}
    row: 6
    col: 6
    width: 6
    height: 2
  - title: Average Tickets per Week
    name: Average Tickets per Week
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.average_tickets_per_week, tickets_last_7_days]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: tickets_last_7_days
      based_on: ticket.count
      type: count_distinct
      label: Tickets Last 7 Days
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: 'diff_days(${ticket.created_date},now()) <= 7 '
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Tickets, Last 7 Days
    defaults_version: 1
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
    hidden_fields: [ticket.count]
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Average CSAT
    name: Average CSAT
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [satisfaction_ratings.average_csat, satisfaction_ratings.percent_tickets_with_rating]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Tickets with Ratings
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 12
    width: 6
    height: 4
  - title: FCR Rate
    name: FCR Rate
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.first_contact_resolution, fcr_goal]
    sorts: [ticket.first_contact_resolution desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - dimension: fcr_goal
      label: FCR Goal
      expression: 95/100
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: 95% FCR Goal
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: First Contract Resolution Rate - was the issue resolved on the first
      contact with a customer
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 18
    width: 6
    height: 4
  - title: "[Team] Average CSAT"
    name: "[Team] Average CSAT"
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [satisfaction_ratings.average_csat]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 12
    width: 6
    height: 2
  - title: "[Team] FCR Rate"
    name: "[Team] FCR Rate"
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.first_contact_resolution]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 18
    width: 6
    height: 2
  - name: Tickets
    type: text
    title_text: Tickets
    row: 8
    col: 0
    width: 24
    height: 3
  - title: Unresolved Tickets
    name: Unresolved Tickets
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.urgent_tickets]
    filters:
      ticket.status: open,pending,new
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E57947"
    defaults_version: 1
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 0
    width: 6
    height: 6
  - name: Quality
    type: text
    title_text: Quality
    row: 25
    col: 0
    width: 24
    height: 3
  - name: Recent Bugs / Feature Requests
    type: text
    title_text: Recent Bugs / Feature Requests
    row: 36
    col: 0
    width: 24
    height: 3
  - title: Tickets by Topic Category
    name: Tickets by Topic Category
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [ticket.count, tags.topic_category, ticket.created_week]
    pivots: [tags.topic_category]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_week: 8 weeks
    sorts: [ticket.count desc 0, tags.topic_category]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: admin - ticket.count,
            id: admin - ticket.count, name: admin}, {axisId: authentication - ticket.count,
            id: authentication - ticket.count, name: authentication}, {axisId: dev
              - ticket.count, id: dev - ticket.count, name: dev}, {axisId: front-end
              - ticket.count, id: front-end - ticket.count, name: front-end}, {axisId: sharing
              - ticket.count, id: sharing - ticket.count, name: sharing}, {axisId: system
              - ticket.count, id: system - ticket.count, name: system}, {axisId: unknown
              - ticket.count, id: unknown - ticket.count, name: unknown}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [unknown - ticket.count]
    series_colors:
      unknown - ticket.count: "#9E9E9E"
      system - ticket.count: "#FBB555"
    defaults_version: 1
    listen:
      Chatter Name: assignee.name
    row: 18
    col: 0
    width: 9
    height: 7
  - title: Ticket Request Reason
    name: Ticket Request Reason
    model: sfdc_demo
    explore: ticket
    type: looker_donut_multiples
    fields: [ticket.reason, ticket.count]
    pivots: [ticket.reason]
    filters:
      ticket.created_week: 8 weeks
      ticket.reason: "-Not a Support Request,-Unknown,-Other"
    sorts: [ticket.count desc 0, ticket.reason]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 9
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_colors:
      Bug - ticket.count: "#E57947"
      Why isn't this working? - ticket.count: "#FBB555"
      Feature Request - ticket.count: "#2196F3"
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
      Chatter Name: assignee.name
    row: 18
    col: 9
    width: 6
    height: 7
  - title: FCR and Chat Duration by Complexity Type
    name: FCR and Chat Duration by Complexity Type
    model: sfdc_demo
    explore: ticket
    type: looker_bar
    fields: [ticket.first_contact_resolution, ticket.issue_complexity, ticket.average_chat_duration]
    filters:
      ticket.created_date: 8 weeks
      ticket.issue_complexity: "-NULL"
    sorts: [ticket.issue_complexity, ticket.first_contact_resolution desc]
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
    point_style: circle
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
    y_axes: [{label: '', orientation: top, series: [{axisId: ticket.first_contact_resolution,
            id: ticket.first_contact_resolution, name: FCR Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: bottom, series: [{axisId: ticket.average_chat_duration,
            id: ticket.average_chat_duration, name: Average Chat Duration}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ticket.average_chat_duration
    hidden_series: [ticket.issue_complexity___null - ticket.issue_complexity_sort___null
        - ticket.first_contact_resolution]
    series_types:
      ticket.average_chat_duration: scatter
    series_labels: {}
    show_null_points: true
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Chatter Name: assignee.name
    row: 18
    col: 15
    width: 9
    height: 7
  - title: Number of Tickets for Each Chatter
    name: Number of Tickets for Each Chatter
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [assignee.name, ticket.count, assignee.is_chatter]
    pivots: [assignee.is_chatter]
    fill_fields: [assignee.is_chatter]
    filters:
      ticket.created_week: 8 weeks
      assignee.name: "-NULL"
    sorts: [ticket.count desc 2, assignee.is_chatter 0]
    limit: 500
    column_limit: 50
    row_total: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: No - ticket.count, id: No
              - ticket.count, name: 'No'}, {axisId: Yes - ticket.count, id: Yes -
              ticket.count, name: 'Yes'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_colors:
      Yes - ticket.count: "#2196F3"
      No - ticket.count: "#b6cbf0"
    defaults_version: 1
    listen:
      Chatter Name: assignee.chatter_filter
    row: 11
    col: 0
    width: 12
    height: 7
  - title: Average Duration for Each Chatter
    name: Average Duration for Each Chatter
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [assignee.name, assignee.is_chatter, ticket.average_chat_duration]
    pivots: [assignee.is_chatter]
    fill_fields: [assignee.is_chatter]
    filters:
      ticket.created_week: 8 weeks
      assignee.name: "-NULL"
    sorts: [assignee.is_chatter 0, ticket.average_chat_duration desc 2]
    limit: 500
    column_limit: 50
    row_total: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: No - ticket.count, id: No
              - ticket.count, name: 'No'}, {axisId: Yes - ticket.count, id: Yes -
              ticket.count, name: 'Yes'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_colors:
      Yes - ticket.count: "#2196F3"
      No - ticket.count: "#b6cbf0"
      Yes - ticket.average_chat_duration: "#2196F3"
      No - ticket.average_chat_duration: "#b6cbf0"
    defaults_version: 1
    listen:
      Chatter Name: assignee.chatter_filter
    row: 11
    col: 12
    width: 12
    height: 7
  - title: Satisfaction Rating & Response Rate
    name: Satisfaction Rating & Response Rate
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [satisfaction_ratings.average_csat, satisfaction_ratings.percent_tickets_with_rating,
      ticket.created_week]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_week: 8 weeks
    sorts: [ticket.created_week]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
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
    y_axes: [{label: '', orientation: left, series: [{axisId: satisfaction_ratings.average_csat,
            id: satisfaction_ratings.average_csat, name: Average CSAT}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: satisfaction_ratings.percent_tickets_with_rating,
            id: satisfaction_ratings.percent_tickets_with_rating, name: Percent Tickets
              with Rating}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      satisfaction_ratings.percent_tickets_with_rating: line
    series_colors:
      satisfaction_ratings.percent_tickets_with_rating: "#b6cbf0"
    series_labels:
      satisfaction_ratings.percent_tickets_with_rating: Response Rate
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Tickets with Ratings
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Chatter Name: assignee.name
    row: 28
    col: 0
    width: 9
    height: 8
  - title: Rent Satisfaction Ratings
    name: Rent Satisfaction Ratings
    model: sfdc_demo
    explore: ticket
    type: looker_grid
    fields: [ticket.id, ticket.created_date, account.account_name, submitter.email,
      satisfaction_ratings.score, satisfaction_ratings.comment]
    filters:
      ticket.created_week: 8 weeks
      satisfaction_ratings.score: "-NULL"
    sorts: [ticket.created_date desc]
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
    listen:
      Chatter Name: assignee.name
    row: 28
    col: 9
    width: 15
    height: 8
  - title: JIRA Issues
    name: JIRA Issues
    model: sfdc_demo
    explore: ticket
    type: looker_grid
    fields: [issue.key, issue.description, ticket.count, issue.is_issue_resolved,
      issue.created_date, jira_user.name]
    filters:
      ticket.action: feature request submitted,bug submitted
      ticket.created_date: this year
      issue.key: "-NULL"
    sorts: [ticket.count desc]
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
    series_labels:
      user.name: Assignee Name
      issue.key: Issue Key
      issue.description: Description
      ticket.count: Number Support Tickets Submitted
    series_column_widths:
      issue.description: 514
      issue.key: 140
      issue.is_issue_resolved: 87
      issue.created_date: 154
    series_cell_visualizations:
      ticket.count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    title_hidden: true
    listen: {}
    row: 39
    col: 0
    width: 24
    height: 11
  filters:
  - name: Chatter Name
    title: Chatter Name
    type: field_filter
    default_value: Tonya Koop
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: sfdc_demo
    explore: ticket
    listens_to_filters: []
    field: assignee.name

---
- dashboard: chen_demo
  title: chen demo
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: HHWrwvQNg6exxYhycxyBHh
  elements:
  - title: chen demo
    name: chen demo
    model: thelook
    explore: order_items
    type: looker_column
    fields: [products.category, order_items.total_sale_price, order_items.total_gross_margin]
    filters: {}
    sorts: [order_items.total_sale_price desc 0]
    limit: 2
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
    default_value: last year
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
- dashboard: chentest
  title: Chen-test
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kEzsw5TNlBORYdg8MrqHZ3
  elements:
  - title: Chen-test
    name: Chen-test
    model: thelook
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.order_count, order_items.average_sale_price]
    sorts: [order_items.average_sale_price desc]
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
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.average_sale_price,
            id: order_items.average_sale_price, name: Average Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_items.order_count,
            id: order_items.order_count, name: Order Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: clinic_data
  title: clinic data
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ZI3gJwIh9S53BUBoW15ENH
  elements:
  - title: top 10 customers
    name: top 10 customers
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.email, user_order_facts.lifetime_revenue]
    sorts: [user_order_facts.lifetime_revenue desc 0]
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
    listen: {}
    row: 0
    col: 0
    width: 13
    height: 8
  - title: last 6 month customers
    name: last 6 month customers
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.email, user_order_facts.lifetime_revenue]
    filters:
      user_order_facts.latest_order_date: 6 months
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
    listen: {}
    row: 0
    col: 13
    width: 9
    height: 8

---
- dashboard: cluster_analysis_overview
  title: Cluster Analysis Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: SOTSlKZmWPwanDQPN1V4ZP
  elements:
  - title: Spending Behavior by Clusters
    name: Spending Behavior by Clusters
    model: thelook
    explore: kmeans_model5
    type: looker_grid
    fields: [kmeans_model5.feature, kmeans_model5.centroid_id, kmeans_model5.avg_qty]
    pivots: [kmeans_model5.feature]
    filters:
      kmeans_model5.feature: -"add_to_cart",-email,-"event_usage",-"avg_unit_price",-"avg_quantity_per_order",-"sock_avg_qty",-"maternity_avg_qty",-"leggings_avg_qty",-"jumpsuits_and_rompers_avg_qty",-"home_visits",-"clothing_sets_avg_qty",-purchases
    sorts: [kmeans_model5.feature, kmeans_model5.centroid_id]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns: {}
    column_order: [kmeans_model5.centroid_id, accessories_kmeans_model5.avg_qty, active_kmeans_model5.avg_qty,
      jeans_kmeans_model5.avg_qty, pants_kmeans_model5.avg_qty, shorts_kmeans_model5.avg_qty,
      skirts_kmeans_model5.avg_qty, sleepwear_kmeans_model5.avg_qty, sweaters_kmeans_model5.avg_qty,
      swim_kmeans_model5.avg_qty, tops_and_tees_kmeans_model5.avg_qty, underwear_kmeans_model5.avg_qty,
      capris_kmeans_model5.avg_qty, dresses_kmeans_model5.avg_qty, fashion_kmeans_model5.avg_qty,
      jackets_kmeans_model5.avg_qty, outerwear_kmeans_model5.avg_qty, cancel_kmeans_model5.avg_qty]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      kmeans_model5.centroid_id: 97
      kmeans_model5.avg_qty: 74
    series_cell_visualizations:
      kmeans_model5.numerical_value:
        is_active: false
    series_text_format:
      kmeans_model5.avg_qty:
        align: left
    conditional_formatting: [{type: along a scale..., value: 30, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: faee8ca0-9727-fd3f-fa2c-0b2f94c103f3, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#DB4437", offset: 100}]},
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: number, value: 0.1}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          kmeans_model5.avg_qty]}]
    series_value_format:
      kmeans_model5.avg_qty:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 12
    col: 0
    width: 24
    height: 6
  - title: "# of Customers Per Cluster"
    name: "# of Customers Per Cluster"
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [ecomm_predict.centroid_id, ecomm_predict.count]
    sorts: [ecomm_predict.centroid_id]
    limit: 500
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
    point_style: circle_outline
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ecomm_predict.count,
            id: ecomm_predict.count, name: Num of Customers}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_label: Clusters
    size_by_field: ecomm_predict.count
    hide_legend: true
    series_colors:
      ecomm_predict.count: "#4285F4"
    series_labels:
      ecomm_predict.count: Num of Customers
    label_color: ["#0000ff"]
    show_null_points: true
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
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 11
    height: 8
  - title: Orders vs Web Events
    name: Orders vs Web Events
    model: thelook
    explore: ecomm_predict
    type: looker_column
    fields: [ecomm_predict.centroid_id, ecomm_predict.event_usage, ecomm_predict.purchases]
    sorts: [ecomm_predict.centroid_id]
    limit: 500
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
    point_style: circle_outline
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ecomm_predict.purchases,
            id: ecomm_predict.purchases, name: 'Avg # of Orders'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}, {label: !!null '', orientation: right, series: [{axisId: ecomm_predict.event_usage,
            id: ecomm_predict.event_usage, name: 'Avg # of Web Events'}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_label: Clusters
    size_by_field: ecomm_predict.count
    series_types:
      ecomm_predict.event_usage: line
    series_colors:
      ecomm_predict.event_usage: "#0F9D58"
      ecomm_predict.purchases: "#DB4437"
    series_labels:
      ecomm_predict.count: Num of Customers
    show_null_points: true
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
    defaults_version: 1
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 4
    col: 11
    width: 13
    height: 8
  - title: 'Cluster #2'
    name: 'Cluster #2'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '2'
    limit: 500
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: greater than, value: 30, background_color: "#98aee8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    y_axes: []
    listen: {}
    row: 2
    col: 8
    width: 4
    height: 2
  - title: 'Cluster #1'
    name: 'Cluster #1'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '1'
    limit: 500
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: greater than, value: 40, background_color: "#518ce8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    y_axes: []
    listen: {}
    row: 2
    col: 4
    width: 4
    height: 2
  - title: 'Cluster #3'
    name: 'Cluster #3'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '3'
    limit: 500
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: less than, value: 42, background_color: "#6d90e8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    y_axes: []
    listen: {}
    row: 2
    col: 12
    width: 4
    height: 2
  - title: 'Cluster #4'
    name: 'Cluster #4'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '4'
    limit: 500
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: greater than, value: 50, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    y_axes: []
    listen: {}
    row: 2
    col: 16
    width: 4
    height: 2
  - title: 'Cluster #5'
    name: 'Cluster #5'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '5'
    limit: 500
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: less than, value: 34, background_color: "#c1cde8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    y_axes: []
    listen: {}
    row: 2
    col: 20
    width: 4
    height: 2
  - name: Avg Unit Price by Cluster
    type: text
    title_text: Avg Unit Price by Cluster
    body_text: ''
    row: 2
    col: 0
    width: 4
    height: 2
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #4285F4;">
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards-next/thelook::cohort_analysis_overview">Cohort Analysis</a>
        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;"  href="/dashboards-next/thelook::cluster_analysis_overview">Cluster Analysis</a>
        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards-next/thelook::training_evaluation_overview">
      Training Evaluation</a>
      </nav>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Age Distribution
    name: Age Distribution
    model: thelook
    explore: ecomm_predict
    type: looker_donut_multiples
    fields: [ecomm_predict.centroid_id, users.gender, users.count]
    pivots: [users.gender]
    sorts: [users.gender 0, ecomm_predict.centroid_id]
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: 'concat("Cluster #", ${ecomm_predict.centroid_id})'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    show_value_labels: true
    font_size: 16
    charts_across: 5
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors:
      Female - users.count: "#4285F4"
      Male - users.count: "#F4B400"
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    value_labels: legend
    label_type: labPer
    interpolation: linear
    hidden_fields: [ecomm_predict.centroid_id]
    y_axes: []
    listen: {}
    row: 30
    col: 0
    width: 24
    height: 9
  - title: 'Age Distribution '
    name: 'Age Distribution '
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [ecomm_predict.centroid_id, users.age_tier, users.count]
    pivots: [users.age_tier]
    sorts: [users.age_tier 0, ecomm_predict.centroid_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: 'concat("Cluster #", ${ecomm_predict.centroid_id})'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
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
    trellis: row
    stacking: percent
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: 10 to 19 - 02 - users.count,
            id: 10 to 19 - 02 - users.count, name: 10 to 19}, {axisId: 20 to 29 -
              03 - users.count, id: 20 to 29 - 03 - users.count, name: 20 to 29},
          {axisId: 30 to 39 - 04 - users.count, id: 30 to 39 - 04 - users.count, name: 30
              to 39}, {axisId: 40 to 49 - 05 - users.count, id: 40 to 49 - 05 - users.count,
            name: 40 to 49}, {axisId: 50 to 59 - 06 - users.count, id: 50 to 59 -
              06 - users.count, name: 50 to 59}, {axisId: 60 to 69 - 07 - users.count,
            id: 60 to 69 - 07 - users.count, name: 60 to 69}, {axisId: 70 or Above
              - 08 - users.count, id: 70 or Above - 08 - users.count, name: 70 or
              Above}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    trellis_rows: 3
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      users.count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 11, mirror: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          users.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    hidden_fields: [ecomm_predict.centroid_id]
    listen: {}
    row: 18
    col: 0
    width: 24
    height: 12

---
- dashboard: cohort_analysis_overview
  title: Cohort Analysis Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NgsPNmeGerMStFviLn5g5M
  elements:
  - title: Spend by Region
    name: Spend by Region
    model: thelook
    explore: ecomm_predict
    type: looker_map
    fields: [users.count, users.state]
    filters:
      users.country: USA
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: outdoors
    map_position: custom
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
    map_latitude: 40.439822964501055
    map_longitude: -64.9281692504883
    map_zoom: 3
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
    trellis: row
    stacking: percent
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
    trellis_rows: 3
    column_group_spacing_ratio:
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      users.count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 11, mirror: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          users.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 7
    col: 5
    width: 6
    height: 6
  - title: Top 5 Categories
    name: Top 5 Categories
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [products.category, order_items.count]
    sorts: [order_items.count desc]
    limit: 5
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
    series_colors:
      order_items.count: "#4285F4"
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 7
    col: 11
    width: 5
    height: 6
  - title: "#1 Brand"
    name: "#1 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_1
      label: Top 1
      expression: row() = 1
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_1]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 9
    col: 0
    width: 5
    height: 2
  - title: "#2 Brand"
    name: "#2 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_2
      label: Top 2
      expression: row() = 2
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_2]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 11
    col: 0
    width: 5
    height: 2
  - title: "#3 Brand"
    name: "#3 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_3
      label: Top 3
      expression: row() = 3
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_3]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 13
    col: 0
    width: 5
    height: 2
  - name: ''
    type: text
    title_text: ''
    body_text: '<h1 style="text-align: center;">Top 5 Brands 🔥</h1>'
    row: 7
    col: 0
    width: 5
    height: 2
  - title: Total Sales
    name: Total Sales
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: this_month_vs_last_month
      label: This Month vs Last Month
      expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    comparison_label: vs Last Month
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Total Dollars Returned
    name: Total Dollars Returned
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.total_sale_price]
    filters:
      order_items.is_returned: 'Yes'
    sorts: [order_items.created_month desc]
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)\
        \ -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: []
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
    hidden_fields: []
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 12
    width: 6
    height: 4
  - title: New Users
    name: New Users
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [users.created_month, users.count]
    sorts: [users.created_month desc]
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${users.count}/offset(${users.count},1) -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    custom_color: "#000000"
    single_value_title: ''
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 1000, background_color: "#8fd43f",
        font_color: "#fdfff5", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    y_axes: []
    listen:
      Created Month: users.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Avg Unit Price
    name: Avg Unit Price
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.average_sale_price]
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${order_items.average_sale_price}/offset(${order_items.average_sale_price},1)\
        \ -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 30, background_color: "#7CB342",
        font_color: "#fdfffc", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 18
    width: 6
    height: 4
  - title: Top Spenders 💵
    name: Top Spenders 💵
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [users.name, users.email, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 10
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      users.name: 126
      users.email: 196
      order_items.total_sale_price: 190
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
        palette:
          palette_id: b77623f6-c652-b489-fb6d-21142e7af226
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Last Month
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 13
    col: 16
    width: 8
    height: 6
  - title: Best Sellers 🎽
    name: Best Sellers 🎽
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.brand, products.item_name, products.count]
    sorts: [products.count desc]
    limit: 10
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
    column_order: ["$$$_row_numbers_$$$", products.brand, products.item_name, products.count]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      products.count: 125
      products.item_name: 360
      products.brand: 208
    series_cell_visualizations:
      products.count:
        is_active: true
        palette:
          palette_id: af6ff122-5760-5a1e-4731-877e0d72883a
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 13
    col: 5
    width: 11
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "\n<div style=\"border-bottom: solid 1px #4285F4;\">\n\n<nav style=\"\
      font-size: 18px; padding: 5px 10px 0 10px; height: 60px\">\n\n  <a style=\"\
      padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4;\
      \ border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left;\
      \ line-height: 40px; font-weight: bold; background-color: #eaf1fe;\"  \n href=\"\
      /dashboards-next/thelook::cohort_analysis_overview\">Cohort Analysis</a>\n\n\
      \  <a style=\"padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left;\
      \ line-height: 40px;\" href=\"/dashboards-next/thelook::cluster_analysis_overview\"\
      >Cluster Analysis</a>\n\n  <a style=\"padding: 5px 15px; border-bottom: solid\
      \ 1px #4285F4; float: left; line-height: 40px;\" href=\"/dashboards-next/thelook::training_evaluation_overview\"\
      >\n\nTraining Evaluation</a>\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: "#4 Brand"
    name: "#4 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_1
      label: Top 1
      expression: row() = 4
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_1]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 15
    col: 0
    width: 5
    height: 2
  - title: "#5 Brand"
    name: "#5 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_5
      label: Top 5
      expression: row() = 5
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_2, top_5]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 17
    col: 0
    width: 5
    height: 2
  - title: New Arrivals
    name: New Arrivals
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.item_name, inventory_items.created_date, ecomm_predict.centroid_label]
    filters:
      order_items.created_month: 6 months ago for 6 months
    sorts: [inventory_items.created_date desc]
    limit: 10
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
    hidden_fields: [inventory_items.created_date]
    column_order: ["$$$_row_numbers_$$$", ecomm_predict.centroid_label, products.brand,
      products.item_name, products.category, products.count]
    y_axes: []
    listen:
      Cohorts: ecomm_predict.centroid_label
    row: 7
    col: 16
    width: 8
    height: 6
  filters:
  - name: Cohorts
    title: Cohorts
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: ecomm_predict.centroid_label
  - name: Created Month
    title: Created Month
    type: field_filter
    default_value: 2 month ago for 2 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: order_items.created_month

---
- dashboard: cohort_analysis_overview_copy
  title: Cohort Analysis Overview (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: CcPdGSnGmBINZpYlwCSQNN
  elements:
  - title: Spend by Region
    name: Spend by Region
    model: thelook
    explore: ecomm_predict
    type: looker_map
    fields: [users.count, users.state]
    filters:
      users.country: USA
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: outdoors
    map_position: custom
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
    map_latitude: 40.439822964501055
    map_longitude: -64.9281692504883
    map_zoom: 3
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
    trellis: row
    stacking: percent
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
    trellis_rows: 3
    column_group_spacing_ratio:
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      users.count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 11, mirror: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          users.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Top 5 Categories
    name: Top 5 Categories
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [products.category, order_items.count]
    sorts: [order_items.count desc]
    limit: 5
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
    series_colors:
      order_items.count: "#4285F4"
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 4
    width: 4
    height: 3
  - title: "#1 Brand"
    name: "#1 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_1
      label: Top 1
      expression: row() = 1
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_1]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 8
    width: 4
    height: 3
  - title: "#2 Brand"
    name: "#2 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_2
      label: Top 2
      expression: row() = 2
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_2]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 12
    width: 4
    height: 3
  - title: "#3 Brand"
    name: "#3 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_3
      label: Top 3
      expression: row() = 3
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_3]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 16
    width: 4
    height: 3
  - name: ''
    type: text
    title_text: ''
    body_text: '<h1 style="text-align: center;">Top 5 Brands 🔥</h1>'
    row: 0
    col: 20
    width: 4
    height: 3
  - title: Total Sales
    name: Total Sales
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: this_month_vs_last_month
      label: This Month vs Last Month
      expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    comparison_label: vs Last Month
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 0
    width: 4
    height: 3
  - title: Total Dollars Returned
    name: Total Dollars Returned
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.total_sale_price]
    filters:
      order_items.is_returned: 'Yes'
    sorts: [order_items.created_month desc]
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)\
        \ -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: []
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
    hidden_fields: []
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 4
    width: 4
    height: 3
  - title: New Users
    name: New Users
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [users.created_month, users.count]
    sorts: [users.created_month desc]
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${users.count}/offset(${users.count},1) -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    custom_color: "#000000"
    single_value_title: ''
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 1000, background_color: "#8fd43f",
        font_color: "#fdfff5", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    y_axes: []
    listen:
      Created Month: users.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 8
    width: 4
    height: 3
  - title: Avg Unit Price
    name: Avg Unit Price
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.average_sale_price]
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${order_items.average_sale_price}/offset(${order_items.average_sale_price},1)\
        \ -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 30, background_color: "#7CB342",
        font_color: "#fdfffc", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 12
    width: 4
    height: 3
  - title: Top Spenders 💵
    name: Top Spenders 💵
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [users.name, users.email, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 10
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      users.name: 126
      users.email: 196
      order_items.total_sale_price: 190
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
        palette:
          palette_id: b77623f6-c652-b489-fb6d-21142e7af226
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Last Month
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 16
    width: 4
    height: 3
  - title: Best Sellers 🎽
    name: Best Sellers 🎽
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.brand, products.item_name, products.count]
    sorts: [products.count desc]
    limit: 10
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
    column_order: ["$$$_row_numbers_$$$", products.brand, products.item_name, products.count]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      products.count: 125
      products.item_name: 360
      products.brand: 208
    series_cell_visualizations:
      products.count:
        is_active: true
        palette:
          palette_id: af6ff122-5760-5a1e-4731-877e0d72883a
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    defaults_version: 1
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 20
    width: 4
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "\n<div style=\"border-bottom: solid 1px #4285F4;\">\n\n<nav style=\"\
      font-size: 18px; padding: 5px 10px 0 10px; height: 60px\">\n\n  <a style=\"\
      padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4;\
      \ border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left;\
      \ line-height: 40px; font-weight: bold; background-color: #eaf1fe;\"  \n href=\"\
      /dashboards-next/thelook::cohort_analysis_overview\">Cohort Analysis</a>\n\n\
      \  <a style=\"padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left;\
      \ line-height: 40px;\" href=\"/dashboards-next/thelook::cluster_analysis_overview\"\
      >Cluster Analysis</a>\n\n  <a style=\"padding: 5px 15px; border-bottom: solid\
      \ 1px #4285F4; float: left; line-height: 40px;\" href=\"/dashboards-next/thelook::training_evaluation_overview\"\
      >\n\nTraining Evaluation</a>\n\n</nav>\n\n</div>"
    row: 6
    col: 0
    width: 4
    height: 3
  - title: "#4 Brand"
    name: "#4 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_1
      label: Top 1
      expression: row() = 4
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_1]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 6
    col: 4
    width: 4
    height: 3
  - title: "#5 Brand"
    name: "#5 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    dynamic_fields:
    - table_calculation: top_5
      label: Top 5
      expression: row() = 5
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_2, top_5]
    y_axes: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 6
    col: 8
    width: 4
    height: 3
  - title: New Arrivals
    name: New Arrivals
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.item_name, inventory_items.created_date, ecomm_predict.centroid_label]
    filters:
      order_items.created_month: 6 months ago for 6 months
    sorts: [inventory_items.created_date desc]
    limit: 10
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
    hidden_fields: [inventory_items.created_date]
    column_order: ["$$$_row_numbers_$$$", ecomm_predict.centroid_label, products.brand,
      products.item_name, products.category, products.count]
    y_axes: []
    listen:
      Cohorts: ecomm_predict.centroid_label
    row: 6
    col: 12
    width: 4
    height: 3
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 6
    col: 16
    width: 6
    height: 7
  filters:
  - name: Cohorts
    title: Cohorts
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: ecomm_predict.centroid_label
  - name: Created Month
    title: Created Month
    type: field_filter
    default_value: 2 month ago for 2 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: order_items.created_month

---
- dashboard: cohort_analysis_silky
  title: Cohort Analysis Silky
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: f4tUrp83zzXVQjb37TPLcJ
  elements:
  - title: Spend by Region
    name: Spend by Region
    model: thelook
    explore: ecomm_predict
    type: looker_map
    fields: [users.count, users.state]
    filters:
      users.country: USA
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: outdoors
    map_position: custom
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
    map_latitude: 40.439822964501055
    map_longitude: -64.9281692504883
    map_zoom: 3
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
    trellis: row
    stacking: percent
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
    trellis_rows: 3
    column_group_spacing_ratio:
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      users.count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 11, mirror: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          users.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 10
    col: 6
    width: 7
    height: 6
  - title: Top 5 Categories
    name: Top 5 Categories
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [products.category, order_items.count]
    sorts: [order_items.count desc]
    limit: 5
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
    series_colors:
      order_items.count: "#4285F4"
    defaults_version: 1
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 4
    col: 11
    width: 5
    height: 6
  - title: Total Sales
    name: Total Sales
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - table_calculation: this_month_vs_last_month
      label: This Month vs Last Month
      expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)-1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    comparison_label: vs Last Month
    defaults_version: 1
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Total Dollars Returned
    name: Total Dollars Returned
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.total_sale_price]
    filters:
      order_items.is_returned: 'Yes'
    sorts: [order_items.created_month desc]
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)\
        \ -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: []
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
    hidden_fields: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 12
    width: 6
    height: 4
  - title: New Users
    name: New Users
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [users.created_month, users.count]
    sorts: [users.created_month desc]
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${users.count}/offset(${users.count},1) -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    custom_color: "#000000"
    single_value_title: ''
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 1000, background_color: "#8fd43f",
        font_color: "#fdfff5", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      Created Month: users.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Avg Unit Price
    name: Avg Unit Price
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.average_sale_price]
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${order_items.average_sale_price}/offset(${order_items.average_sale_price},1)\
        \ -1 "
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 30, background_color: "#7CB342",
        font_color: "#fdfffc", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Best Sellers 🎽
    name: Best Sellers 🎽
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.brand, products.item_name, products.count]
    sorts: [products.count desc]
    limit: 10
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
    column_order: ["$$$_row_numbers_$$$", products.brand, products.item_name, products.count]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      products.count: 125
      products.item_name: 360
      products.brand: 208
    series_cell_visualizations:
      products.count:
        is_active: true
        palette:
          palette_id: af6ff122-5760-5a1e-4731-877e0d72883a
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    defaults_version: 1
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 10
    col: 13
    width: 11
    height: 6
  - title: New Arrivals
    name: New Arrivals
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.item_name, inventory_items.created_date, ecomm_predict.centroid_label]
    filters:
      order_items.created_month: 6 months ago for 6 months
    sorts: [inventory_items.created_date desc]
    limit: 10
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
    hidden_fields: [inventory_items.created_date]
    column_order: ["$$$_row_numbers_$$$", ecomm_predict.centroid_label, products.brand,
      products.item_name, products.category, products.count]
    listen:
      Cohorts: ecomm_predict.centroid_label
    row: 4
    col: 16
    width: 8
    height: 6
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 16
    col: 3
    width: 17
    height: 7
  - title: Top Categories Insights
    name: Top Categories Insights
    model: thelook
    explore: ecomm_predict
    type: genai_extensions::query_insights
    fields: [products.category, order_items.count, users.age_tier]
    pivots: [users.age_tier]
    filters:
      users.age_tier: "-Below 0,-0 to 9"
    sorts: [users.age_tier, order_items.count desc 0]
    limit: 10
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      order_items.count: "#4285F4"
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 4
    col: 0
    width: 11
    height: 6
  - title: dfdfsda
    name: dfdfsda
    model: retail_banking
    explore: account
    type: genai_extensions::query_insights
    fields: [loan.number_of_loans, loan.grant_year, district.city]
    filters:
      district.city: ''
    sorts: [loan.grant_year]
    limit: 5000
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    temperature: 0.2
    prompt: summarize
    insightImage: https://img.icons8.com/ios/50/light-on--v1.png
    listen: {}
    row: 23
    col: 0
    width: 8
    height: 6
  - title: cokolwiek
    name: cokolwiek
    model: thelook
    explore: order_items
    type: genai_extensions::query_insights
    fields: [order_items.order_count, order_items.created_year, users.city]
    pivots: [users.city]
    fill_fields: [order_items.created_year]
    filters:
      users.city: ''
    sorts: [users.city, order_items.created_year desc]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    hidden_pivots: {}
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
    temperature: 0.2
    prompt: summarize
    insightImage: https://img.icons8.com/ios/50/light-on--v1.png
    listen:
      Created Month: order_items.created_month
    row: 23
    col: 8
    width: 8
    height: 6
  filters:
  - name: Cohorts
    title: Cohorts
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: ecomm_predict.centroid_label
  - name: Created Month
    title: Created Month
    type: field_filter
    default_value: 2 month ago for 2 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: order_items.created_month

---
- dashboard: condition_lookup
  title: Condition Lookup
  layout: newspaper
  description: ''
  preferred_slug: xSz6jOn1TbIAdYc8qny3tP
  elements:
  - title: Condition Name
    name: Condition Name
    model: healthcare
    explore: condition_extended
    type: single_value
    fields: [condition__code__coding.display]
    sorts: [condition__code__coding.display]
    limit: 20
    custom_color_enabled: true
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
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      encounter.count:
        is_active: true
        palette:
          palette_id: 695e2dda-14bd-04b2-d088-035a014b4f8a
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
      encounter.repeat_patients:
        is_active: true
        palette:
          palette_id: ef667eaa-c38a-1877-2455-3411c6229e43
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 3
    col: 0
    width: 9
    height: 4
  - title: Number of Cases Over Time
    name: Number of Cases Over Time
    model: healthcare
    explore: condition_extended
    type: looker_line
    fields: [condition.onset_date, encounter.count]
    fill_fields: [condition.onset_date]
    filters:
      condition.onset_date: 1 years ago for 1 years
    sorts: [condition.onset_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: condition.count, id: condition.count,
            name: Number of Conditions}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      condition.count: "#2CA0FA"
      encounter.count: "#2CA0FA"
    trend_lines: [{color: "#000000", label_position: left, period: 7, regression_type: average,
        series_index: 1, show_label: true, label_type: string}]
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 7
    col: 9
    width: 15
    height: 6
  - title: Avg LOS Over Time
    name: Avg LOS Over Time
    model: healthcare
    explore: condition_extended
    type: looker_line
    fields: [condition.onset_date, encounter.average_los]
    fill_fields: [condition.onset_date]
    filters:
      condition.onset_date: 1 years ago for 1 years
    sorts: [condition.onset_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: condition.count, id: condition.count,
            name: Number of Conditions}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      condition.count: "#2CA0FA"
      encounter.average_los: "#2CA0FA"
    trend_lines: [{color: "#000000", label_position: left, period: 7, regression_type: average,
        series_index: 1, show_label: true, label_type: string}]
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 13
    col: 9
    width: 15
    height: 5
  - title: Commonly Prescribed Medications
    name: Commonly Prescribed Medications
    model: healthcare
    explore: condition_extended
    type: looker_column
    fields: [medication_request__medication__codeable_concept__coding.display, medication_request.count]
    filters:
      medication_request__medication__codeable_concept__coding.display: "-NULL"
    sorts: [medication_request.count desc]
    limit: 15
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
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: medication_request.count,
            id: medication_request.count, name: Number of Medication Requests}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      medication_request.count: "#2CA0FA"
      encounter.repeat_patients: "#8214A0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      encounter.count:
        is_active: true
        palette:
          palette_id: 695e2dda-14bd-04b2-d088-035a014b4f8a
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
      encounter.repeat_patients:
        is_active: true
        palette:
          palette_id: ef667eaa-c38a-1877-2455-3411c6229e43
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Condition Code: condition__code__coding.code
    row: 7
    col: 0
    width: 9
    height: 5
  - title: Patient Demographics
    name: Patient Demographics
    model: healthcare
    explore: condition_extended
    type: looker_donut_multiples
    fields: [patient.age_tier, patient.count, patient.gender]
    pivots: [patient.age_tier]
    filters:
      patient.age_tier: "-Below 0"
    sorts: [patient.age_tier, patient.gender]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: patient.count, id: female
              - patient.count, name: female}, {axisId: patient.count, id: male - patient.count,
            name: male}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Condition Code: condition__code__coding.code
    row: 12
    col: 0
    width: 9
    height: 6
  - title: Top Physicians
    name: Top Physicians
    model: healthcare
    explore: condition_extended
    type: looker_grid
    fields: [practitioner.id, encounter.count, encounter.min_los, encounter.med_los,
      encounter.max_los]
    sorts: [encounter.count desc]
    limit: 25
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
    series_labels:
      encounter.count: "# Cases"
      practitioner.id: Practitioner
      encounter.average_los: Avg LOS
    series_cell_visualizations:
      encounter.count:
        is_active: true
      encounter.average_los:
        is_active: true
    defaults_version: 1
    title_hidden: true
    listen:
      Condition Code: condition__code__coding.code
    row: 20
    col: 0
    width: 24
    height: 8
  - name: "<span class='fa fa-stethoscope'> Condition Lookup</span>"
    type: text
    title_text: "<span class='fa fa-stethoscope'> Condition Lookup</span>"
    body_text: "**Recommended Action** Use this dashboard to track OKRs for specific\
      \ departments and conditions, create an alert on readmission rate and length\
      \ of stay to monitor progress"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: 30 Day Readmission Rate
    name: 30 Day Readmission Rate
    model: healthcare
    explore: readmission
    type: single_value
    fields: [readmission.perc_30_day_readmission]
    sorts: [readmission.perc_30_day_readmission desc]
    limit: 500
    dynamic_fields:
    - table_calculation: readmission_national_average
      label: Readmission - National Average
      expression: '0.139'
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 30-Day Readmission Rate
    conditional_formatting: [{type: greater than, value: 0.139, background_color: '',
        font_color: "#7a131e", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields:
    defaults_version: 1
    listen:
      Condition Code: prior_condition__code__coding.code
    row: 3
    col: 14
    width: 5
    height: 4
  - name: "<span class='fa fa-stethoscope'> Physician Performance</span>"
    type: text
    title_text: "<span class='fa fa-stethoscope'> Physician Performance</span>"
    body_text: ''
    row: 18
    col: 0
    width: 24
    height: 2
  - title: Total Patients Treated - Past Complete Year
    name: Total Patients Treated - Past Complete Year
    model: healthcare
    explore: condition_extended
    type: single_value
    fields: [encounter.count_patients]
    filters:
      encounter.period__start_date: 1 years ago for 1 years
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
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 3
    col: 19
    width: 5
    height: 4
  - title: Average LOS (min)
    name: Average LOS (min)
    model: healthcare
    explore: condition_extended
    type: single_value
    fields: [encounter.period__start_year, encounter.average_los]
    fill_fields: [encounter.period__start_year]
    sorts: [encounter.period__start_year desc]
    limit: 500
    dynamic_fields:
    - table_calculation: avg_los_prior_year
      label: Avg LOS Prior Year
      expression: offset(${encounter.average_los},1)
      value_format:
      value_format_name: decimal_2
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
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#5f8017",
        font_color: !!null '', color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 3
    col: 9
    width: 5
    height: 4
  filters:
  - name: Condition Code
    title: Condition Code
    type: field_filter
    default_value: '72892002'
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: condition_extended
    listens_to_filters: []
    field: condition__code__coding.code

---
- dashboard: cool_client_dash
  title: Cool client Dash
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 72qYe6AOvfdgEkZ9fqYEoU
  elements:
  - title: Cool client Dash
    name: Cool client Dash
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_gross_margin, users.age_tier]
    pivots: [users.age_tier]
    fill_fields: [users.age_tier]
    filters: {}
    sorts: [users.age_tier, order_items.created_date desc]
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
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Below 0 - 0 - order_items.total_gross_margin: "#bf2f23"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
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
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Created Date: order_items.created_date
      City: users.city
    row: 0
    col: 0
    width: 12
    height: 7
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
  - name: City
    title: City
    type: field_filter
    default_value: San Francisco,Seattle
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.city

---
- dashboard: cool_dash
  title: Cool Dash
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: IxfZOCx8rx1pznwWG3DMDA
  elements:
  - title: Cool Dash
    name: Cool Dash
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_gross_margin, order_items.status]
    pivots: [order_items.status]
    filters: {}
    sorts: [order_items.status, order_items.created_date desc]
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Cancelled - order_items.total_gross_margin: "#f72a1f"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
      Age: users.age
      Age Tier: users.age_tier
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
  - name: Age Tier
    title: Age Tier
    type: field_filter
    default_value: 40 to 49
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.age_tier
  - name: Age
    title: Age
    type: field_filter
    default_value: ">5"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.age

---
- dashboard: cool_dashboard_4
  title: Cool Dashboard 4
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: IYLVTUYTYOEcjbzE32UCAe
  elements:
  - title: Cool Dashboard 4
    name: Cool Dashboard 4
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_gross_margin, order_items.status]
    pivots: [order_items.status]
    filters: {}
    sorts: [order_items.status, order_items.created_date desc]
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
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Cancelled - order_items.total_gross_margin: "#bf1a1d"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Created Date: order_items.created_date
      Age: users.age
    row: 0
    col: 0
    width: 10
    height: 7
  - title: Cool Dashboard 4 (Copy)
    name: Cool Dashboard 4 (Copy)
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.total_gross_margin, order_items.status]
    pivots: [order_items.status]
    filters: {}
    sorts: [order_items.status, order_items.created_date desc]
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
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Cancelled - order_items.total_gross_margin: "#bf1a1d"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Created Date: order_items.created_date
      Age: users.age
    row: 0
    col: 10
    width: 14
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 30 day ago for 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: Age
    title: Age
    type: field_filter
    default_value: ">40"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.age

---
- dashboard: cool_fun_dash
  title: Cool Fun Dash
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 95MA0GcdH7VgLO698RKdhl
  elements:
  - title: Cool Fun Dash
    name: Cool Fun Dash
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_margin, order_items.created_date, order_items.status]
    pivots: [order_items.status]
    filters: {}
    sorts: [order_items.status, order_items.created_date desc]
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 23
    height: 5
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

---
- dashboard: cool_provider_dash
  title: Cool Provider Dash
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oJjBecUHPG6fzLhU5bdDYe
  elements:
  - title: Cool Provider Dash
    name: Cool Provider Dash
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_gross_margin, order_items.status]
    pivots: [order_items.status]
    filters: {}
    sorts: [order_items.status, order_items.created_date desc]
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
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Cancelled - order_items.total_gross_margin: "#ff2920"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: order_items.created_date
      Age: users.age
    row: 0
    col: 0
    width: 14
    height: 6
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
  - name: Age
    title: Age
    type: field_filter
    default_value: ">20"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.age

---
- dashboard: cool_test_dash
  title: Cool Test dash
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: o5ABjaYydf31qYTdbFma4J
  elements:
  - title: Cool Test dash
    name: Cool Test dash
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_gross_margin, order_items.status]
    pivots: [order_items.status]
    fill_fields: [order_items.created_date]
    filters: {}
    sorts: [order_items.status, order_items.created_date desc]
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Cancelled - order_items.total_gross_margin: "#bf2115"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 9
    height: 8
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

---
- dashboard: credit_card_fraud_overview
  title: Credit Card Fraud Overview
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  preferred_slug: ngxGIfxP8BUMXfQ8BKWsTm
  elements:
  - title: Percent $ Fraud per Card Type
    name: Percent $ Fraud per Card Type
    model: retail_banking
    explore: card_transactions
    type: looker_column
    fields: [card_transactions.total_amount, card.type, card_transactions.is_fraud]
    pivots: [card_transactions.is_fraud]
    fill_fields: [card.type, card_transactions.is_fraud]
    sorts: [card.type, card_transactions.is_fraud 0]
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
    stacking: percent
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.total_amount,
            id: No - card_transactions.total_amount, name: 'No'}, {axisId: Yes - card_transactions.total_amount,
            id: Yes - card_transactions.total_amount, name: 'Yes'}], showLabels: false,
        showValues: true, minValue: 90, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    series_colors:
      No - card_transactions.total_amount: "#72D16D"
      Yes - card_transactions.total_amount: "#FBB555"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: card_transactions_with_zip.state
    row: 7
    col: 0
    width: 12
    height: 8
  - title: Total Value of Fraudulent Transactions
    name: Total Value of Fraudulent Transactions
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.total_amount, card_transactions.reporting_period]
    filters:
      card_transactions.is_fraud: 'Yes'
      card_transactions.reporting_period: "-NULL"
    sorts: [card_transactions.reporting_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${card_transactions.total_amount}/offset(${card_transactions.total_amount},1)\
        \ - 1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
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
    single_value_title: Confirmed Fraud This Month
    comparison_label: vs Same Period Last Month
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
    note_state: collapsed
    note_display: hover
    note_text: Total Amount of $ Reimbursed for fraudulent activity
    listen:
      State: card_transactions_with_zip.state
    row: 3
    col: 0
    width: 5
    height: 4
  - title: Customers w/ Fraud This Month
    name: Customers w/ Fraud This Month
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.reporting_period, client.number_of_clients]
    filters:
      card_transactions.reporting_period: "-NULL"
      card_transactions.is_fraud: 'Yes'
    sorts: [card_transactions.reporting_period desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${client.number_of_clients}/offset(${client.number_of_clients},1)\
        \ - 1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
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
    single_value_title: ''
    comparison_label: vs Same Period Last Month
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of customers with at least one confirmed fraudulent transaction
      this month
    listen:
      State: card_transactions_with_zip.state
    row: 3
    col: 5
    width: 5
    height: 4
  - name: "<span class='fa fa-lock'> Fraud Overview</span>"
    type: text
    title_text: "<span class='fa fa-lock'> Fraud Overview</span>"
    subtitle_text: Where is fraud occurring and how do we stop it?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-building'> Merchant Deep Dive</span>"
    type: text
    title_text: "<span class='fa fa-building'> Merchant Deep Dive</span>"
    subtitle_text: What merchants seem to consistently have fraudulent activity?
    body_text: ''
    row: 15
    col: 0
    width: 24
    height: 3
  - title: Top 10 Merchants by Fraud
    name: Top 10 Merchants by Fraud
    model: retail_banking
    explore: card_transactions
    type: table
    fields: [card_transactions.merchant, card_transactions.percent_fraudulent_amount,
      card_transactions.percent_fraudulent_transactions, card_transactions.total_amount,
      card_transactions.fraud_amount]
    sorts: [card_transactions.fraud_amount desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${card_transactions.count}/offset(${card_transactions.count},1)\
        \ - 1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      card_transactions.percent_fraudulent_amount: "% Fraud Amount"
      card_transactions.percent_fraudulent_transactions: "% Fraud Transactions"
      card_transactions.total_amount: Total Amount
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 516474c6-71f1-5281-ae2c-811db4bb10d6, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#f2ea57", offset: 50},
              {color: "#bf232f", offset: 100}]}, options: {steps: 25, stepped: true,
            mirror: true, constraints: {mid: {type: average}}}}, bold: false, italic: false,
        strikethrough: false, fields: [card_transactions.fraud_amount]}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Fraudulent Transactions This Month
    comparison_label: vs Same Period Last Month
    defaults_version: 1
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
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      State: card_transactions_with_zip.state
    row: 18
    col: 0
    width: 9
    height: 9
  - title: "% Fraud by Spend Category"
    name: "% Fraud by Spend Category"
    model: retail_banking
    explore: card_transactions
    type: looker_bar
    fields: [card_transactions.total_amount, card_transactions.is_fraud, card_transactions.category]
    pivots: [card_transactions.is_fraud]
    fill_fields: [card_transactions.is_fraud]
    filters:
      card_transactions.transaction_date: 30 days
    sorts: [card_transactions.is_fraud 0, card_transactions.total_amount desc 2]
    limit: 500
    column_limit: 50
    row_total: right
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: No - card_transactions.total_amount,
            id: No - card_transactions.total_amount, name: 'No'}, {axisId: Yes - card_transactions.total_amount,
            id: Yes - card_transactions.total_amount, name: 'Yes'}], showLabels: false,
        showValues: false, minValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_colors:
      No - card_transactions.total_amount: "#72D16D"
      Yes - card_transactions.total_amount: "#FBB555"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: card_transactions_with_zip.state
    row: 7
    col: 12
    width: 12
    height: 8
  - title: Risky Merchants
    name: Risky Merchants
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.number_merchants]
    filters:
      merchant_fact.percent_fraudulent_transactions: ">=.02"
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
    custom_color: "#EA4335"
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
    note_state: collapsed
    note_display: below
    note_text: Merchants with >2% of fraud transactions in the Past Month
    listen:
      State: card_transactions_with_zip.state
    row: 3
    col: 15
    width: 4
    height: 4
  - title: Percent of Fraudulent Transactions by Merchant Zip
    name: Percent of Fraudulent Transactions by Merchant Zip
    model: retail_banking
    explore: card_transactions
    type: looker_map
    fields: [card_transactions_with_zip.zip, card_transactions.percent_fraudulent_transactions]
    sorts: [card_transactions.percent_fraudulent_transactions desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    defaults_version: 1
    listen:
      State: card_transactions_with_zip.state
    row: 18
    col: 17
    width: 7
    height: 9
  - title: Number of Merchants by Fraud Risk
    name: Number of Merchants by Fraud Risk
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [merchant_fact.percent_fraudulent_amount_tier, card_transactions.number_merchants]
    filters:
      card_transactions.transaction_date: 30 days
    sorts: [merchant_fact.percent_fraudulent_amount_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      card_transactions.number_merchants: "#FBBC04"
      "> 2%": "#EA4335"
      "< 1 %": "#4285F4"
      "< .5 %": "#34A853"
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
    font_size: 12
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
    note_state: collapsed
    note_display: below
    note_text: Past 30 Days
    listen:
      State: card_transactions_with_zip.state
    row: 18
    col: 9
    width: 8
    height: 9
  - title: Calls for Fraud This Month
    name: Calls for Fraud This Month
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.count, satisfaction_ratings.average_csat]
    filters:
      transcript__messages.issue_topic: Submit a Fraud Alert
      transcript.conversation_start_date: 30 days
    sorts: [transcript.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Average Satisfaction Rating
    defaults_version: 1
    listen: {}
    row: 3
    col: 10
    width: 5
    height: 4
  - name: "<span class='fa fa-users'> Customer Deep Dive</span>"
    type: text
    title_text: "<span class='fa fa-users'> Customer Deep Dive</span>"
    subtitle_text: Which customers consistently experience fraud?
    row: 27
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-credit-card'> Predictive Analytics</span>"
    type: text
    title_text: "<span class='fa fa-credit-card'> Predictive Analytics</span>"
    subtitle_text: Proactively reach out to customers about recent transactions that
      may be fraudulent
    body_text: "See details on choosing training parameters [here](/dashboards/560)\
      \  \nSee details on model performance [here](/dashboards/561)"
    row: 39
    col: 0
    width: 24
    height: 3
  - title: Top 10 Customers by Fraud
    name: Top 10 Customers by Fraud
    model: retail_banking
    explore: card_transactions
    type: table
    fields: [card_transactions.percent_fraudulent_amount, card_transactions.percent_fraudulent_transactions,
      card_transactions.total_amount, card_transactions.fraud_amount, client.client_id,
      client.name]
    sorts: [card_transactions.fraud_amount desc]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${card_transactions.count}/offset(${card_transactions.count},1)\
        \ - 1"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      card_transactions.percent_fraudulent_amount: "% Fraud Amount"
      card_transactions.percent_fraudulent_transactions: "% Fraud Transactions"
      card_transactions.total_amount: Total Amount
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 516474c6-71f1-5281-ae2c-811db4bb10d6, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#f2ea57", offset: 50},
              {color: "#bf232f", offset: 100}]}, options: {steps: 25, stepped: true,
            mirror: true, constraints: {mid: {type: average}}}}, bold: false, italic: false,
        strikethrough: false, fields: [card_transactions.fraud_amount]}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Fraudulent Transactions This Month
    comparison_label: vs Same Period Last Month
    defaults_version: 1
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
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      State: card_transactions_with_zip.state
    row: 30
    col: 0
    width: 9
    height: 9
  - title: Fraud by Customer Demographics
    name: Fraud by Customer Demographics
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.percent_fraudulent_transactions, client.customer_segment,
      card_transactions.transaction_week]
    pivots: [client.customer_segment]
    fill_fields: [card_transactions.transaction_week]
    filters:
      card_transactions.transaction_date: 6 months
    sorts: [card_transactions.transaction_week desc, client.customer_segment]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.percent_fraudulent_transactions,
            id: Middle Age in Rural Areas - card_transactions.percent_fraudulent_transactions,
            name: Middle Age in Rural Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Middle Age in Urban Areas - card_transactions.percent_fraudulent_transactions,
            name: Middle Age in Urban Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Retirees in Rural Areas - card_transactions.percent_fraudulent_transactions,
            name: Retirees in Rural Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Retirees in Urban Areas - card_transactions.percent_fraudulent_transactions,
            name: Retirees in Urban Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Young Adults in Rural Areas - card_transactions.percent_fraudulent_transactions,
            name: Young Adults in Rural Areas}, {axisId: card_transactions.percent_fraudulent_transactions,
            id: Young Adults in Urban Areas - card_transactions.percent_fraudulent_transactions,
            name: Young Adults in Urban Areas}], showLabels: false, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: card_transactions.percent_fraudulent_transactions
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 30
    col: 9
    width: 15
    height: 9
  - title: Transactions by % Difference from the Avg Category Amount
    name: Transactions by % Difference from the Avg Category Amount
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [card_transactions.percent_diff_from_cat_tier, card_transactions.count]
    fill_fields: [card_transactions.percent_diff_from_cat_tier]
    filters:
      card_transactions.is_fraud: 'No'
      card_transactions.transaction_date: 2 weeks
    sorts: [card_transactions.percent_diff_from_cat_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      Yes - card_transactions.count: "#FBBC04"
      1000 or Above: "#EA4335"
      500 to 999: "#FBBC04"
      100 to 499: "#34A853"
      50 to 99: "#4285F4"
      Below 50: "#BDC1C6"
    series_labels:
      Yes - card_transactions.count: Confirmed Fraudulent
      No - card_transactions.count: Not Confirmed Fraudulent
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.count,
            id: No - card_transactions.count, name: 'No'}, {axisId: Yes - card_transactions.count,
            id: Yes - card_transactions.count, name: 'Yes'}], showLabels: false, showValues: true,
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Each tier is the percent deviation from the average amount in the category
      that the transaction occurred - for example, if the average spend in the Shopping
      category is $50 then a transaction of $100 is 100% above the average.
    listen: {}
    row: 42
    col: 0
    width: 8
    height: 7
  - title: Transactions that Occurred in Middle of Night
    name: Transactions that Occurred in Middle of Night
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [card_transactions.count, card_transactions.middle_of_night_transaction]
    fill_fields: [card_transactions.middle_of_night_transaction]
    filters:
      card_transactions.is_fraud: 'No'
      card_transactions.transaction_date: 2 weeks
    sorts: [card_transactions.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      Yes - card_transactions.count: "#FBBC04"
      1000 or Above: "#EA4335"
      500 to 999: "#FBBC04"
      100 to 499: "#34A853"
      50 to 99: "#4285F4"
      Below 50: "#BDC1C6"
    series_labels:
      Yes - card_transactions.count: Confirmed Fraudulent
      No - card_transactions.count: Not Confirmed Fraudulent
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.count,
            id: No - card_transactions.count, name: 'No'}, {axisId: Yes - card_transactions.count,
            id: Yes - card_transactions.count, name: 'Yes'}], showLabels: false, showValues: true,
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Transactions that occurred between 12am and 4am local time
    listen: {}
    row: 42
    col: 8
    width: 8
    height: 7
  - title: Transactions by Distance from Customer Home
    name: Transactions by Distance from Customer Home
    model: retail_banking
    explore: card_transactions
    type: looker_pie
    fields: [card_transactions.count, card_transactions.transaction_distance_tier]
    fill_fields: [card_transactions.transaction_distance_tier]
    filters:
      card_transactions.is_fraud: 'No'
      card_transactions.transaction_date: 2 weeks
    sorts: [card_transactions.transaction_distance_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      Yes - card_transactions.count: "#FBBC04"
      1000 or Above: "#EA4335"
      500 to 999: "#FBBC04"
      100 to 499: "#34A853"
      50 to 99: "#4285F4"
      Below 50: "#BDC1C6"
      100 or Above: "#B31412"
      80 to 99: "#EA4335"
      40 to 59: "#34A853"
      20 to 39: "#4285F4"
      Below 20: "#185ABC"
      60 to 79: "#FBBC04"
    series_labels:
      Yes - card_transactions.count: Confirmed Fraudulent
      No - card_transactions.count: Not Confirmed Fraudulent
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - card_transactions.count,
            id: No - card_transactions.count, name: 'No'}, {axisId: Yes - card_transactions.count,
            id: Yes - card_transactions.count, name: 'Yes'}], showLabels: false, showValues: true,
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Each tier is the percent deviation from the average amount in the category
      that the transaction occurred - for example, if the average spend in the Shopping
      category is $50 then a transaction of $100 is 100% above the average.
    listen: {}
    row: 42
    col: 16
    width: 8
    height: 7
  - title: Flagged Transactions
    name: Flagged Transactions
    model: retail_banking
    explore: card_transactions
    type: single_value
    fields: [card_transactions.total_amount, current_fraud_prediction.predicted_fraud,
      card_transactions.percent_fraudulent_transactions]
    filters:
      card_transactions.transaction_date: 14 days
      current_fraud_prediction.predicted_fraud: 'Yes'
    sorts: [card_transactions.total_amount desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    comparison_label: Transactions
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
    note_state: collapsed
    note_display: hover
    note_text: Transactions from past two weeks that were flagged as potential fraud
      by ML model
    listen: {}
    row: 3
    col: 19
    width: 5
    height: 4
  - title: Customers with Possible Fraud
    name: Customers with Possible Fraud
    model: retail_banking
    explore: card_transactions
    type: looker_grid
    fields: [client.client_id, client.name, client.customer_segment, card.type, card.create_date,
      card_transactions.count, current_fraud_prediction.average_predicted_score, predicted_fraud_amount,
      current_fraud_prediction.number_fraud_predictions]
    filters:
      card_transactions.transaction_date: 14 days
    sorts: [predicted_fraud_amount desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: predicted_fraud_amount
      based_on: card_transactions.total_amount
      label: Predicted Fraud Amount
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${current_fraud_prediction.predicted_fraud}"
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
      card_transactions.count:
        is_active: false
      current_fraud_prediction.number_fraud_predictions:
        is_active: true
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
    listen: {}
    row: 49
    col: 0
    width: 24
    height: 8
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: Colorado,Nebraska,New Mexico,Wyoming
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: card_transactions
    listens_to_filters: []
    field: card_transactions_with_zip.state

---
- dashboard: crypto_com_marketing_dashboard
  title: crypto.com marketing dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: sUQvfmNtvuNP0VkpTgFMB1
  elements:
  - title: cryptocom marketing dashboard
    name: cryptocom marketing dashboard
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.email, user_order_facts.lifetime_revenue]
    filters: {}
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
    listen:
      Latest Orders: user_order_facts.latest_order_date
    row: 0
    col: 0
    width: 13
    height: 7
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_map
    fields: [users.email, users.state, users.age, user_order_facts.lifetime_orders,
      user_order_facts.lifetime_revenue, order_items.30_day_repeat_purchase_rate]
    filters:
      user_order_facts.latest_order_date: 18 months
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 500
    column_limit: 50
    listen: {}
    row: 0
    col: 13
    width: 10
    height: 7
  filters:
  - name: Latest Orders
    title: Latest Orders
    type: field_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: user_order_facts.latest_order_date

---
- dashboard: customer_360
  title: Customer 360
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: g55j041KCzXbPFzdLA8R4n
  elements:
  - title: Transaction Count by Channel
    name: Transaction Count by Channel
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_area
    fields: [omni_channel_transactions.transaction_month, omni_channel_transactions.transaction_count,
      omni_channel_transactions.fulfillment_channel]
    pivots: [omni_channel_transactions.fulfillment_channel]
    filters:
      omni_channel_transactions.transaction_date: 12 months ago for 12 months
    sorts: [omni_channel_transactions.transaction_month desc, omni_channel_transactions.fulfillment_channel]
    limit: 500
    column_limit: 50
    row_total: right
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Assisted Checkout -
              omni_channel_transactions.transaction_count, id: Assisted Checkout -
              omni_channel_transactions.transaction_count, name: Assisted Checkout},
          {axisId: Delivery - omni_channel_transactions.transaction_count, id: Delivery
              - omni_channel_transactions.transaction_count, name: Delivery}, {axisId: In-store
              Pickup - omni_channel_transactions.transaction_count, id: In-store Pickup
              - omni_channel_transactions.transaction_count, name: In-store Pickup},
          {axisId: Self Checkout - omni_channel_transactions.transaction_count, id: Self
              Checkout - omni_channel_transactions.transaction_count, name: Self Checkout}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 12
    height: 9
  - title: In-Store and Online
    name: In-Store and Online
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.customer_count]
    filters:
      c360.customer_type: Both Online and Instore
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
    defaults_version: 1
    listen: {}
    row: 2
    col: 8
    width: 4
    height: 3
  - name: Customer Health
    type: text
    title_text: Customer Health
    body_text: ''
    row: 43
    col: 0
    width: 24
    height: 2
  - name: Customer Acquisition
    type: text
    title_text: Customer Acquisition
    body_text: ''
    row: 25
    col: 0
    width: 24
    height: 2
  - name: Omni-Channel Overview
    type: text
    title_text: Omni-Channel Overview
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Channel Analysis
    type: text
    title_text: Channel Analysis
    body_text: ''
    row: 14
    col: 0
    width: 24
    height: 2
  - title: RFV
    name: RFV
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_scatter
    fields: [c360.customer_count, c360.rfm_rating]
    sorts: [c360.customer_count desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    size_by_field: c360.customer_count
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    hidden_fields: []
    hidden_points_if_no: []
    color_range: ["#4285F4", "#EA4335", "#FBBC04", "#34A853", "#5F6368", "#185ABC",
      "#9AA0A6", "#B31412", "#BDC1C6", "#EA8600", "#E8EAED", "#137333"]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 45
    col: 0
    width: 12
    height: 9
  - title: Recency
    name: Recency
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.high_recency_customers, c360.customer_count, c360.low_recency_customers,
      c360.high_frequency_customers, c360.low_frequency_customers, c360.high_monetary_value_customers,
      c360.low_monetary_value_customers]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: High Recency Customers
    comparison_label: Customers
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 45
    col: 12
    width: 12
    height: 3
  - title: Frequency
    name: Frequency
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.high_recency_customers, c360.low_recency_customers, c360.high_frequency_customers,
      c360.customer_count, c360.low_frequency_customers, c360.high_monetary_value_customers,
      c360.low_monetary_value_customers]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: High Frequency Customers
    comparison_label: Customers
    hidden_fields: [c360.high_recency_customers, c360.low_recency_customers]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 48
    col: 12
    width: 12
    height: 3
  - title: Value
    name: Value
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.high_recency_customers, c360.low_recency_customers, c360.high_frequency_customers,
      c360.low_frequency_customers, c360.high_monetary_value_customers, c360.customer_count,
      c360.low_monetary_value_customers]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: High Value Customers
    comparison_label: Customers
    hidden_fields: [c360.high_recency_customers, c360.low_recency_customers, c360.high_frequency_customers,
      c360.low_frequency_customers]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 51
    col: 12
    width: 12
    height: 3
  - title: Customer Behavior by Acquisition Source
    name: Customer Behavior by Acquisition Source
    model: omni_channel
    explore: omni_channel_events
    type: looker_column
    fields: [delivery_only, in_store_only, in_store_and_online, pickup_only, omni_channel_events.traffic_source]
    sorts: [delivery_only desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: delivery_only
      based_on: c360.customer_count
      type: count_distinct
      label: Delivery Only
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${c360.online_transaction_count} > 0 AND ${c360.instore_transaction_count}\
        \ = 0 AND ${c360.curbside_transaction_count} = 0"
    - measure: in_store_only
      based_on: c360.customer_count
      type: count_distinct
      label: In Store Only
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${c360.curbside_transaction_count} = 0 AND ${c360.instore_transaction_count}\
        \ > 0 AND ${c360.online_transaction_count} = 0"
    - measure: in_store_and_online
      based_on: c360.customer_count
      type: count_distinct
      label: In Store and Online
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${c360.instore_transaction_count} > 0 AND ${c360.online_transaction_count}\
        \ > 0"
    - measure: pickup_only
      based_on: c360.customer_count
      type: count_distinct
      label: Pickup Only
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${c360.online_transaction_count} >0 AND ${c360.curbside_transaction_count}\
        \ >0 AND ${c360.instore_transaction_count} =0"
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
    font_size: '12'
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 35
    col: 0
    width: 12
    height: 8
  - title: Sales YoY
    name: Sales YoY
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_line
    fields: [omni_channel_transactions__transaction_details.total_sales, omni_channel_transactions.transaction_month_name,
      omni_channel_transactions.transaction_year]
    pivots: [omni_channel_transactions.transaction_year]
    fill_fields: [omni_channel_transactions.transaction_month_name, omni_channel_transactions.transaction_year]
    sorts: [omni_channel_transactions.transaction_year 0, omni_channel_transactions.transaction_month_name]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: Assisted Checkout -
              omni_channel_transactions.transaction_count, id: Assisted Checkout -
              omni_channel_transactions.transaction_count, name: Assisted Checkout},
          {axisId: Delivery - omni_channel_transactions.transaction_count, id: Delivery
              - omni_channel_transactions.transaction_count, name: Delivery}, {axisId: In-store
              Pickup - omni_channel_transactions.transaction_count, id: In-store Pickup
              - omni_channel_transactions.transaction_count, name: In-store Pickup},
          {axisId: Self Checkout - omni_channel_transactions.transaction_count, id: Self
              Checkout - omni_channel_transactions.transaction_count, name: Self Checkout}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 5
    col: 12
    width: 12
    height: 9
  - title: New Customers
    name: New Customers
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.customer_count]
    filters:
      c360.first_purchase_date: 90 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal
      label: Goal
      expression: '1000'
      value_format:
      value_format_name: decimal_0
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 3
  - title: Transactions
    name: Transactions
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [omni_channel_transactions.transaction_count, omni_channel_transactions.reporting_period]
    filters:
      omni_channel_transactions.transaction_date: 2 years
    sorts: [omni_channel_transactions.transaction_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: from_last_year
      label: from last year
      expression: "${omni_channel_transactions.transaction_count}/offset(${omni_channel_transactions.transaction_count},1)\
        \ - 1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
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
    defaults_version: 1
    hidden_fields: [omni_channel_transactions.reporting_period]
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 3
  - title: Sales by Channel
    name: Sales by Channel
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_pie
    fields: [c360.customer_type, omni_channel_transactions__transaction_details.total_sales]
    fill_fields: [c360.customer_type]
    limit: 500
    column_limit: 50
    row_total: right
    value_labels: legend
    label_type: labPer
    inner_radius: 45
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Assisted Checkout -
              omni_channel_transactions.transaction_count, id: Assisted Checkout -
              omni_channel_transactions.transaction_count, name: Assisted Checkout},
          {axisId: Delivery - omni_channel_transactions.transaction_count, id: Delivery
              - omni_channel_transactions.transaction_count, name: Delivery}, {axisId: In-store
              Pickup - omni_channel_transactions.transaction_count, id: In-store Pickup
              - omni_channel_transactions.transaction_count, name: In-store Pickup},
          {axisId: Self Checkout - omni_channel_transactions.transaction_count, id: Self
              Checkout - omni_channel_transactions.transaction_count, name: Self Checkout}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen: {}
    row: 16
    col: 0
    width: 8
    height: 9
  - title: Profitability and CLV by Channel
    name: Profitability and CLV by Channel
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_column
    fields: [c360.customer_type, c360.customer_count, omni_channel_transactions__transaction_details.profit_margin,
      retail_clv_predict.average_clv]
    fill_fields: [c360.customer_type]
    sorts: [c360.customer_count desc]
    limit: 500
    column_limit: 50
    row_total: right
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
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: retail_clv_predict.average_clv,
            id: retail_clv_predict.average_clv, name: Average Clv}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: left, series: [{axisId: c360.customer_count,
            id: c360.customer_count, name: Customer Count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: omni_channel_transactions__transaction_details.profit_margin,
            id: omni_channel_transactions__transaction_details.profit_margin, name: Profit
              Margin}], showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_null_points: false
    interpolation: monotone
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    defaults_version: 1
    listen: {}
    row: 16
    col: 8
    width: 8
    height: 9
  - title: In Store Customers
    name: In Store Customers
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.customer_count]
    filters:
      c360.customer_type: Instore Only
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
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 4
    height: 3
  - title: Online Customers
    name: Online Customers
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.customer_count]
    filters:
      c360.customer_type: Online Only
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
    defaults_version: 1
    listen: {}
    row: 2
    col: 4
    width: 4
    height: 3
  - title: LTV by Channel
    name: LTV by Channel
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_line
    fields: [c360.months_since_first_purchase, c360.customer_count, omni_channel_transactions__transaction_details.total_sales,
      c360.customer_type]
    pivots: [c360.customer_type]
    fill_fields: [c360.customer_type]
    filters:
      c360.months_since_first_purchase: ">0"
    sorts: [c360.customer_type 0, c360.months_since_first_purchase]
    limit: 500
    dynamic_fields:
    - table_calculation: average_per_customer_sales
      label: Average Per Customer Sales
      expression: running_total(${omni_channel_transactions__transaction_details.total_sales}/index(${c360.customer_count},1))
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
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
    y_axes: [{label: Average Lifetime Sales, orientation: left, series: [{axisId: average_per_customer_sales,
            id: Online Only - 0 - average_per_customer_sales, name: Online Only},
          {axisId: average_per_customer_sales, id: Instore Only - 1 - average_per_customer_sales,
            name: Instore Only}, {axisId: average_per_customer_sales, id: Both Online
              and Instore - 2 - average_per_customer_sales, name: Both Online and
              Instore}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [c360.customer_count, omni_channel_transactions__transaction_details.total_sales]
    listen: {}
    row: 16
    col: 16
    width: 8
    height: 9
  - title: LTV by Acquisition Source
    name: LTV by Acquisition Source
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_line
    fields: [c360.months_since_first_purchase, c360.customer_count, omni_channel_transactions__transaction_details.total_sales,
      c360.acquisition_source]
    pivots: [c360.acquisition_source]
    filters:
      c360.months_since_first_purchase: ">0"
      c360.acquisition_source: "-EMPTY"
    sorts: [c360.months_since_first_purchase, c360.acquisition_source]
    limit: 500
    dynamic_fields:
    - table_calculation: average_per_customer_sales
      label: Average Per Customer Sales
      expression: running_total(${omni_channel_transactions__transaction_details.total_sales}/index(${c360.customer_count},1))
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [c360.customer_count, omni_channel_transactions__transaction_details.total_sales]
    listen: {}
    row: 27
    col: 12
    width: 12
    height: 8
  - title: Acquisition Source
    name: Acquisition Source
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_donut_multiples
    fields: [c360.acquisition_source, c360.customer_count, c360.customer_type]
    pivots: [c360.acquisition_source]
    fill_fields: [c360.customer_type]
    sorts: [c360.customer_count desc 0, c360.customer_type, c360.acquisition_source]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
    inner_radius: 45
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 27
    col: 0
    width: 12
    height: 8
  - title: Website Activity by Traffic Source
    name: Website Activity by Traffic Source
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_column
    fields: [c360.acquisition_source, session_count, cart_adds, purchases]
    filters:
      c360.acquisition_source: "-Unknown"
    sorts: [session_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: purchases
      based_on: c360.purchases
      type: sum
      label: Purchases
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - measure: cart_adds
      based_on: c360.cart_adds
      type: sum
      label: Cart Adds
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - measure: session_count
      based_on: c360.session_count
      type: sum
      label: Session Count
      expression:
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "${purchases} / ${session_count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
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
    y_axes: [{label: '', orientation: left, series: [{axisId: session_count, id: session_count,
            name: Session Count}, {axisId: cart_adds, id: cart_adds, name: Cart Adds},
          {axisId: purchases, id: purchases, name: Purchases}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: conversion_rate,
            id: conversion_rate, name: Conversion Rate}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types:
      conversion_rate: line
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    defaults_version: 1
    listen: {}
    row: 35
    col: 12
    width: 12
    height: 8

---
- dashboard: customer_account
  title: Customer Account
  layout: newspaper
  description: ''
  preferred_slug: H6a20GawTA4JuU3drz1aCs
  embed_style:
    background_color: "#ffffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Transactions This Month
    name: Transactions This Month
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.total_transaction_value]
    filters:
      trans.account_id: ''
    sorts: [trans.total_transaction_value]
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
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 0
    width: 8
    height: 4
  - title: Latest Balance
    name: Latest Balance
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.trans_id, trans.category, trans.amount, trans.balance, trans.type,
      trans.total_transaction_value, trans.transaction_date]
    filters:
      trans.account_id: ''
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
    hidden_fields: [trans.trans_id, trans.category, trans.amount, trans.account, trans.type,
      trans.total_transaction_value]
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 16
    width: 8
    height: 4
  - title: Recent Transactions
    name: Recent Transactions
    model: retail_banking
    explore: trans
    type: looker_grid
    fields: [trans.transaction_date, trans.trans_id, trans.category, trans.amount,
      trans.balance, trans.type, trans.total_transaction_value]
    filters:
      trans.account_id: ''
      trans.transaction_date: before 0 days ago
    sorts: [trans.transaction_date desc]
    limit: 20
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      value: _
      trans.total_transaction_value: Value
    series_column_widths:
      trans.total_transaction_value: 100
    series_cell_visualizations:
      trans.total_transaction_value:
        is_active: false
        value_display: true
      value:
        is_active: true
        value_display: false
    series_text_format:
      trans.total_transaction_value:
        bold: true
        align: right
      trans.balance:
        bold: true
        align: right
    series_value_format:
      trans.trans_id:
        name: id
        format_string: '0'
        label: ID
    hidden_fields: [trans.trans_id, trans.account]
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 16
    col: 0
    width: 10
    height: 8
  - title: Average Balance
    name: Average Balance
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.average_account_balance_during_transaction]
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
    tile_title: Balance Summary
    highlightColours: ["#31bf4b", "#3EB0D5", "#B1399E", "#592EC2", "#4276BE", "#72D16D",
      "#FFD95F", "#B32F37", "#9174F0", "#E57947", "#75E2E2", "#FBB555"]
    textColour: "#1e9623"
    trans.average_transaction_value: Average Transaction Value
    trans.average_account_balance: Average Account Balance
    trans.number_of_transactions: Number of Transactions
    trans.total_transaction_value: Total Transaction Value
    hidden_fields: []
    y_axes: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 8
    width: 8
    height: 4
  - title: Client Overview
    name: Client Overview
    model: retail_banking
    explore: account
    type: looker_single_record
    fields: [client.client_id, client.district_id, client.age, client.gender, card.number_of_credit_cards,
      account.number_of_accounts, client.client_full_address, loan.number_of_loans]
    sorts: [client.client_id desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 3
    col: 0
    width: 6
    height: 6
  - name: "<span class='fa fa-tachometer'> Account Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Account Overview </span>"
    row: 9
    col: 0
    width: 24
    height: 3
  - title: Balance Over Time
    name: Balance Over Time
    model: retail_banking
    explore: balances_fact
    type: looker_line
    fields: [balances_fact.balance_date, balances_fact.total_balance, trans.total_outflow,
      trans.total_inflow]
    filters:
      balances_fact.balance_date: 6 months
    sorts: [balances_fact.balance_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: trans.total_outflow,
            id: trans.total_outflow, name: Total Outflow}, {axisId: trans.total_inflow,
            id: trans.total_inflow, name: Total Inflow}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: balances_fact.total_balance,
            id: balances_fact.total_balance, name: Total Balance}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      trans.total_outflow: "#B32F37"
      trans.total_inflow: "#72D16D"
      balances_fact.total_balance: "#4276BE"
    series_point_styles:
      balances_fact.total_balance: diamond
    defaults_version: 1
    hidden_fields: []
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 16
    col: 10
    width: 14
    height: 8
  - title: Call Center Conversations by Sentiment
    name: Call Center Conversations by Sentiment
    model: call_center
    explore: transcript
    type: looker_scatter
    fields: [transcript.count, transcript.conversation_start_week, conversation_facts.overall_call_sentiment_category]
    pivots: [conversation_facts.overall_call_sentiment_category]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 24 weeks
    sorts: [transcript.conversation_start_week desc, conversation_facts.overall_call_sentiment_category
        desc]
    limit: 500
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    size_by_field: transcript.count
    series_colors:
      Very Positive - transcript.count: "#72D16D"
      Very Negative - transcript.count: "#B32F37"
      Neutal - transcript.count: "#4276BE"
      Negative - transcript.count: "#E57947"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: banking_client_facts.account_id
    row: 3
    col: 14
    width: 10
    height: 6
  - name: "<span class='fa fa-tachometer'> Card History </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Card History </span>"
    row: 24
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-tachometer'> Customer Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Overview </span>"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Client Location
    name: Client Location
    model: retail_banking
    explore: account
    type: looker_map
    fields: [client.location]
    sorts: [client.location desc]
    limit: 1
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: traffic_day
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 43.01933304739632
    map_longitude: -105.89756011962892
    map_zoom: 5
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 3
    col: 6
    width: 8
    height: 6
  - title: Card Transactions by Time of Day
    name: Card Transactions by Time of Day
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.transaction_time_of_day, card_transactions.amount,
      card_transactions.trans_id]
    sorts: [card_transactions.transaction_time_of_day]
    limit: 5000
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: linear
    y_axis_combined: true
    show_null_points: true
    swap_axes: true
    hidden_fields: [card_transactions.trans_id]
    interpolation: linear
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 27
    col: 0
    width: 12
    height: 10
  - title: Spend Across Cards
    name: Spend Across Cards
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card.card_number, card_transactions.total_amount, card_transactions.transaction_week]
    pivots: [card.card_number]
    fill_fields: [card_transactions.transaction_week]
    sorts: [card.card_number]
    limit: 500
    column_limit: 5
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
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 27
    col: 12
    width: 12
    height: 10
  - title: Fraudulent vs Legitimate Transactions
    name: Fraudulent vs Legitimate Transactions
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card_transactions.number_of_fraudulent_transactions, card_transactions.number_of_legitimate_transactions,
      card_transactions.transaction_date]
    sorts: [card_transactions.transaction_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.number_of_legitimate_transactions,
            id: card_transactions.number_of_legitimate_transactions, name: Number
              of Legitimate Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: card_transactions.number_of_fraudulent_transactions,
            id: card_transactions.number_of_fraudulent_transactions, name: Number
              of Fraudulent Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      card_transactions.number_of_legitimate_transactions: "#72D16D"
      card_transactions.number_of_fraudulent_transactions: "#B32F37"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 37
    col: 0
    width: 16
    height: 8
  - title: Transactions by Location
    name: Transactions by Location
    model: retail_banking
    explore: card_transactions
    type: looker_map
    fields: [card_transactions.merchant_location, card_transactions.count]
    sorts: [card_transactions.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
    map_position: fit_data
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
    map_latitude: 39.60112517872094
    map_longitude: -105.41849613189699
    map_zoom: 7
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 37
    col: 16
    width: 8
    height: 8
  filters:
  - name: Client ID
    title: Client ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: trans
    listens_to_filters: []
    field: client.client_id
  - name: Transaction Date
    title: Transaction Date
    type: field_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: trans
    listens_to_filters: []
    field: trans.transaction_date
  - name: Account ID
    title: Account ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: card_transactions
    listens_to_filters: []
    field: account.account_id

---
- dashboard: customer_account
  title: Customer Account
  layout: newspaper
  description: ''
  preferred_slug: TLWYHprGTN2PudH5DAu9ji
  embed_style:
    background_color: "#ffffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Transactions This Month
    name: Transactions This Month
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.total_transaction_value]
    filters:
      trans.account_id: ''
    sorts: [trans.total_transaction_value]
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
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 0
    width: 8
    height: 4
  - title: Latest Balance
    name: Latest Balance
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.trans_id, trans.category, trans.amount, trans.balance, trans.type,
      trans.total_transaction_value, trans.transaction_date]
    filters:
      trans.account_id: ''
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
    hidden_fields: [trans.trans_id, trans.category, trans.amount, trans.account, trans.type,
      trans.total_transaction_value]
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 16
    width: 8
    height: 4
  - title: Recent Transactions
    name: Recent Transactions
    model: retail_banking
    explore: trans
    type: looker_grid
    fields: [trans.transaction_date, trans.trans_id, trans.category, trans.amount,
      trans.balance, trans.type, trans.total_transaction_value]
    filters:
      trans.account_id: ''
      trans.transaction_date: before 0 days ago
    sorts: [trans.transaction_date desc]
    limit: 20
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      value: _
      trans.total_transaction_value: Value
    series_column_widths:
      trans.total_transaction_value: 100
    series_cell_visualizations:
      trans.total_transaction_value:
        is_active: false
        value_display: true
      value:
        is_active: true
        value_display: false
    series_text_format:
      trans.total_transaction_value:
        bold: true
        align: right
      trans.balance:
        bold: true
        align: right
    series_value_format:
      trans.trans_id:
        name: id
        format_string: '0'
        label: ID
    hidden_fields: [trans.trans_id, trans.account]
    y_axes: []
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 16
    col: 0
    width: 10
    height: 8
  - title: Average Balance
    name: Average Balance
    model: retail_banking
    explore: trans
    type: single_value
    fields: [trans.average_account_balance_during_transaction]
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
    tile_title: Balance Summary
    highlightColours: ["#31bf4b", "#3EB0D5", "#B1399E", "#592EC2", "#4276BE", "#72D16D",
      "#FFD95F", "#B32F37", "#9174F0", "#E57947", "#75E2E2", "#FBB555"]
    textColour: "#1e9623"
    trans.average_transaction_value: Average Transaction Value
    trans.average_account_balance: Average Account Balance
    trans.number_of_transactions: Number of Transactions
    trans.total_transaction_value: Total Transaction Value
    hidden_fields: []
    y_axes: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: trans.transaction_date
      Account ID: account.account_id
    row: 12
    col: 8
    width: 8
    height: 4
  - title: Client Overview
    name: Client Overview
    model: retail_banking
    explore: account
    type: looker_single_record
    fields: [client.client_id, client.district_id, client.age, client.gender, card.number_of_credit_cards,
      account.number_of_accounts, client.client_full_address, loan.number_of_loans]
    sorts: [client.client_id desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 3
    col: 0
    width: 6
    height: 6
  - name: "<span class='fa fa-tachometer'> Account Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Account Overview </span>"
    row: 9
    col: 0
    width: 24
    height: 3
  - title: Balance Over Time
    name: Balance Over Time
    model: retail_banking
    explore: balances_fact
    type: looker_line
    fields: [balances_fact.balance_date, balances_fact.total_balance, trans.total_outflow,
      trans.total_inflow]
    filters:
      balances_fact.balance_date: 6 months
    sorts: [balances_fact.balance_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: trans.total_outflow,
            id: trans.total_outflow, name: Total Outflow}, {axisId: trans.total_inflow,
            id: trans.total_inflow, name: Total Inflow}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: balances_fact.total_balance,
            id: balances_fact.total_balance, name: Total Balance}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      trans.total_outflow: "#B32F37"
      trans.total_inflow: "#72D16D"
      balances_fact.total_balance: "#4276BE"
    series_point_styles:
      balances_fact.total_balance: diamond
    defaults_version: 1
    hidden_fields: []
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 16
    col: 10
    width: 14
    height: 8
  - title: Call Center Conversations by Sentiment
    name: Call Center Conversations by Sentiment
    model: call_center
    explore: transcript
    type: looker_scatter
    fields: [transcript.count, transcript.conversation_start_week, conversation_facts.overall_call_sentiment_category]
    pivots: [conversation_facts.overall_call_sentiment_category]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 24 weeks
    sorts: [transcript.conversation_start_week desc, conversation_facts.overall_call_sentiment_category
        desc]
    limit: 500
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    size_by_field: transcript.count
    series_colors:
      Very Positive - transcript.count: "#72D16D"
      Very Negative - transcript.count: "#B32F37"
      Neutal - transcript.count: "#4276BE"
      Negative - transcript.count: "#E57947"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: banking_client_facts.account_id
    row: 3
    col: 14
    width: 10
    height: 6
  - name: "<span class='fa fa-tachometer'> Card History </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Card History </span>"
    row: 24
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-tachometer'> Customer Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Overview </span>"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Client Location
    name: Client Location
    model: retail_banking
    explore: account
    type: looker_map
    fields: [client.location]
    sorts: [client.location desc]
    limit: 1
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: traffic_day
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 43.01933304739632
    map_longitude: -105.89756011962892
    map_zoom: 5
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Account ID: account.account_id
    row: 3
    col: 6
    width: 8
    height: 6
  - title: Card Transactions by Time of Day
    name: Card Transactions by Time of Day
    model: retail_banking
    explore: card_transactions
    type: looker_scatter
    fields: [card_transactions.transaction_time_of_day, card_transactions.amount,
      card_transactions.trans_id]
    sorts: [card_transactions.transaction_time_of_day]
    limit: 5000
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: linear
    y_axis_combined: true
    show_null_points: true
    swap_axes: true
    hidden_fields: [card_transactions.trans_id]
    interpolation: linear
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 27
    col: 0
    width: 12
    height: 10
  - title: Spend Across Cards
    name: Spend Across Cards
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card.card_number, card_transactions.total_amount, card_transactions.transaction_week]
    pivots: [card.card_number]
    fill_fields: [card_transactions.transaction_week]
    sorts: [card.card_number]
    limit: 500
    column_limit: 5
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
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 27
    col: 12
    width: 12
    height: 10
  - title: Fraudulent vs Legitimate Transactions
    name: Fraudulent vs Legitimate Transactions
    model: retail_banking
    explore: card_transactions
    type: looker_line
    fields: [card_transactions.number_of_fraudulent_transactions, card_transactions.number_of_legitimate_transactions,
      card_transactions.transaction_date]
    sorts: [card_transactions.transaction_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: card_transactions.number_of_legitimate_transactions,
            id: card_transactions.number_of_legitimate_transactions, name: Number
              of Legitimate Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: card_transactions.number_of_fraudulent_transactions,
            id: card_transactions.number_of_fraudulent_transactions, name: Number
              of Fraudulent Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      card_transactions.number_of_legitimate_transactions: "#72D16D"
      card_transactions.number_of_fraudulent_transactions: "#B32F37"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 37
    col: 0
    width: 16
    height: 8
  - title: Transactions by Location
    name: Transactions by Location
    model: retail_banking
    explore: card_transactions
    type: looker_map
    fields: [card_transactions.merchant_location, card_transactions.count]
    sorts: [card_transactions.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
    map_position: fit_data
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
    map_latitude: 39.60112517872094
    map_longitude: -105.41849613189699
    map_zoom: 7
    defaults_version: 1
    listen:
      Client ID: client.client_id
      Transaction Date: card_transactions.transaction_date
      Account ID: account.account_id
    row: 37
    col: 16
    width: 8
    height: 8
  filters:
  - name: Client ID
    title: Client ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: trans
    listens_to_filters: []
    field: client.client_id
  - name: Transaction Date
    title: Transaction Date
    type: field_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: trans
    listens_to_filters: []
    field: trans.transaction_date
  - name: Account ID
    title: Account ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: card_transactions
    listens_to_filters: []
    field: account.account_id

---
- dashboard: customer_deep_dive
  title: Customer Deep Dive
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  preferred_slug: sOeJfnMdaFswnC2tfq3QKY
  elements:
  - title: Customer Location
    name: Customer Location
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_geo_coordinates
    fields: [customers.location, c360.customer_count]
    sorts: [customers.location]
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: false
    point_radius: 10
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_zoom: 8
    map_marker_radius_fixed: 10
    defaults_version: 1
    listen:
      ID: c360.customer_id
    row: 0
    col: 12
    width: 12
    height: 8
  - title: Customer Info
    name: Customer Info
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_single_record
    fields: [customers.id, customers.name, customers.registered_date, customers.email,
      customers.age, customers.gender, customers.city, customers.state, customers.postcode]
    sorts: [customers.registered_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      ID: c360.customer_id
    row: 0
    col: 0
    width: 6
    height: 6
  - title: Lifetime Purchases
    name: Lifetime Purchases
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.transaction_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${c360.purchases} / ${c360.cart_adds}"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Conversion Rate
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
    hidden_fields: []
    listen:
      ID: c360.customer_id
    row: 0
    col: 6
    width: 6
    height: 2
  - title: Lifetime Returns
    name: Lifetime Returns
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.return_count]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: c360.customer_id
    row: 6
    col: 6
    width: 6
    height: 2
  - title: Total Sales
    name: Total Sales
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.total_sales]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: c360.customer_id
    row: 2
    col: 6
    width: 6
    height: 2
  - title: Predicted CLV
    name: Predicted CLV
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.predicted_clv]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: c360.customer_id
    row: 4
    col: 6
    width: 6
    height: 2
  - title: Churn Risk
    name: Churn Risk
    model: omni_channel
    explore: omni_channel_transactions
    type: single_value
    fields: [c360.risk_of_churn]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: c360.customer_id
    row: 6
    col: 0
    width: 6
    height: 2
  - title: Order History
    name: Order History
    model: omni_channel
    explore: omni_channel_transactions
    type: looker_grid
    fields: [omni_channel_transactions.transaction_date, omni_channel_transactions.transaction_id,
      omni_channel_transactions.purchase_channel, omni_channel_transactions.fulfillment_channel,
      omni_channel_transactions.offer_type, omni_channel_transactions.store_name,
      omni_channel_transactions__transaction_details.product_name, omni_channel_transactions__transaction_details.product_sku,
      omni_channel_transactions__transaction_details.sale_price]
    sorts: [omni_channel_transactions.transaction_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
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
    show_totals: false
    show_row_totals: false
    series_labels:
      omni_channel_transactions.transaction_date: Date
      omni_channel_transactions.transaction_id: ID
    defaults_version: 1
    listen:
      ID: omni_channel_transactions.customer_id
    row: 8
    col: 0
    width: 12
    height: 14
  - name: Customer Timeline
    title: Customer Timeline
    merged_queries:
    - model: omni_channel
      explore: omni_channel_transactions
      type: table
      fields: [omni_channel_transactions.transaction_date, omni_channel_transactions.transaction_count]
      fill_fields: [omni_channel_transactions.transaction_date]
      limit: 500
      join_fields: []
    - model: omni_channel
      explore: omni_channel_events
      type: table
      fields: [omni_channel_events.session_count, omni_channel_events.created_date]
      fill_fields: [omni_channel_events.created_date]
      limit: 500
      join_fields:
      - field_name: omni_channel_events.created_date
        source_field_name: omni_channel_transactions.transaction_date
    - model: omni_channel
      explore: omni_channel_support_calls
      type: table
      fields: [omni_channel_support_calls.conversation_start_date, omni_channel_support_calls.count]
      fill_fields: [omni_channel_support_calls.conversation_start_date]
      sorts: [omni_channel_support_calls.conversation_start_date desc]
      limit: 500
      join_fields:
      - field_name: omni_channel_support_calls.conversation_start_date
        source_field_name: omni_channel_transactions.transaction_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: omni_channel_transactions.transaction_count,
            id: omni_channel_transactions.transaction_count, name: Purchases}, {axisId: omni_channel_events.session_count,
            id: omni_channel_events.session_count, name: Web Visits}, {axisId: omni_channel_support_calls.count,
            id: omni_channel_support_calls.count, name: Support Calls}], showLabels: false,
        showValues: false, maxValue: 1, minValue: 1, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: circle
    series_labels:
      omni_channel_transactions.transaction_count: Purchases
      omni_channel_events.session_count: Web Visits
      omni_channel_support_calls.count: Support Calls
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%b-%y"
    y_axis_combined: true
    show_null_points: false
    type: looker_scatter
    column_limit: 50
    listen:
    - ID: c360.customer_id
    - ID: c360.customer_id
    - ID: omni_channel_support_calls.client_id
    row: 8
    col: 12
    width: 12
    height: 7
  filters:
  - name: ID
    title: ID
    type: field_filter
    default_value: '81359'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: omni_channel
    explore: customer_transaction_fact
    listens_to_filters: []
    field: customer_event_fact.customer_id

---
- dashboard: customer_lookup
  title: Customer Lookup
  layout: newspaper
  description: ''
  preferred_slug: MDDG8M9Lvb1S2zq5UuhUND
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: User Info
    name: User Info
    model: thelook
    explore: order_items
    type: looker_single_record
    fields: [users.id, users.email, users.name, users.traffic_source, users.created_month,
      users.age, users.gender, users.city, users.state]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [users.created_month desc]
    limit: 1
    column_limit: 50
    show_view_names: false
    show_null_labels: false
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 0
    col: 0
    width: 7
    height: 6
  - title: Lifetime Orders
    name: Lifetime Orders
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [order_items.order_count desc]
    limit: 500
    show_null_labels: false
    user_access_filters: {}
    hidden_fields: []
    y_axes: []
    listen:
      Email: users.email
    row: 9
    col: 0
    width: 7
    height: 3
  - title: Total Items Returned
    name: Total Items Returned
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.count]
    filters:
      order_items.returned_date: NOT NULL
    sorts: [order_items.count desc]
    limit: 500
    show_null_labels: false
    font_size: medium
    text_color: black
    hidden_fields: []
    y_axes: []
    listen:
      Email: users.email
    row: 6
    col: 0
    width: 7
    height: 3
  - title: Items Order History
    name: Items Order History
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.id, products.item_name, order_items.status, order_items.created_date,
      order_items.shipped_date, order_items.delivered_date, order_items.returned_date,
      distribution_centers.name]
    sorts: [order_items.created_date desc]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    listen:
      Email: users.email
    row: 12
    col: 0
    width: 16
    height: 5
  - title: Favorite Categories
    name: Favorite Categories
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [products.category, order_items.count]
    filters:
      order_items.created_date: 99 years
    sorts: [order_items.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_colors: {}
    show_view_names: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 12
    col: 16
    width: 8
    height: 5
  - title: User Location
    name: User Location
    model: thelook
    explore: order_items
    type: looker_geo_coordinates
    fields: [users.count, users.location]
    sorts: [users.created_month desc]
    limit: 1
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    point_color: "#4285F4"
    point_radius: 10
    font_size: medium
    text_color: "#49719a"
    map_plot_mode: points
    heatmap_gridlines: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    map_latitude: 42.35930500076174
    map_longitude: -71.02283477783203
    map_zoom: 11
    loading: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 3
    col: 7
    width: 17
    height: 9
  - title: Generate Promo Email
    name: Generate Promo Email
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.promo_email]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [users.promo_email]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_null_labels: false
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 0
    col: 7
    width: 17
    height: 3
  filters:
  - name: Email
    title: Email
    type: field_filter
    default_value: aacevedo@yahoo.com
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.email
