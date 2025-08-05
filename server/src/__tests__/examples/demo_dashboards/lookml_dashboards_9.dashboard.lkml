---
- dashboard: enosta_dashboard
  title: Enosta dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Z9Mes207sX8VoN8F8l7fT8
  elements:
  - title: top 10 spending customers
    name: top 10 spending customers
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
    width: 12
    height: 7
  - title: line chart last 6 months top customer
    name: line chart last 6 months top customer
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
    col: 12
    width: 9
    height: 7

---
- dashboard: equity_insights
  title: Equity Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: W8b8wacUnIY9GLXVwWDy60
  elements:
  - title: Income Statement
    name: Income Statement
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.revenue_per_share, stock_info.revenue_growth, stock_info.ebitda,
      stock_info.earnings_quarterly_growth]
    sorts: [stock_info.earnings_quarterly_growth desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 42
    col: 2
    width: 20
    height: 3
  - title: Management Effectiveness
    name: Management Effectiveness
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.return_on_assets, stock_info.return_on_equity]
    sorts: [stock_info.return_on_assets]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 39
    col: 2
    width: 20
    height: 3
  - title: Profitability
    name: Profitability
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.profit_margins, stock_info.operating_margins]
    sorts: [stock_info.operating_margins desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 36
    col: 2
    width: 20
    height: 3
  - name: Financial Highlights
    type: text
    title_text: Financial Highlights
    body_text: ''
    row: 32
    col: 2
    width: 20
    height: 1
  - title: Fiscal Year
    name: Fiscal Year
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.last_fiscal_year_end, stock_info.most_recent_q, stock_info.upcoming_fye]
    sorts: [stock_info.last_fiscal_year_end desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 33
    col: 2
    width: 20
    height: 3
  - title: Balance Sheet
    name: Balance Sheet
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.total_cash, stock_info.total_cash_per_share, stock_info.total_debt,
      stock_info.current_ratio, stock_info.book_value]
    sorts: [stock_info.total_cash]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 45
    col: 2
    width: 20
    height: 3
  - name: ''
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 0
    width: 2
    height: 117
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "   "
    row: 0
    col: 22
    width: 2
    height: 117
  - title: Analyst Targets
    name: Analyst Targets
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::target_prices
    fields: [stock_info.target_low_price, stock_info.current_price, stock_info.target_average_price,
      stock_info.target_median_price, stock_info.target_high_price]
    filters: {}
    sorts: [stock_info.target_low_price]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 13
    col: 11
    width: 11
    height: 6
  - title: Average Trends
    name: Average Trends
    model: portfolio
    explore: stock_info
    type: looker_column
    fields: [stock_history_with_date_crossjoin.date_selection_month, average_of_open,
      average_of_low, average_of_high, average_of_close]
    fill_fields: [stock_history_with_date_crossjoin.date_selection_month]
    sorts: [stock_history_with_date_crossjoin.date_selection_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.volume
      expression: ''
      label: Average of Volume
      measure: average_of_volume
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.open
      expression: ''
      label: Average of Open
      measure: average_of_open
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.low
      expression: ''
      label: Average of Low
      measure: average_of_low
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.high
      expression: ''
      label: Average of High
      measure: average_of_high
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.close
      expression: ''
      label: Average of Close
      measure: average_of_close
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
      custom:
        id: f9eac9ef-7d33-f68f-6c8b-4fd0dbd62794
        label: Custom
        type: discrete
        colors:
        - "#4285F4"
        - "#EA4335"
        - "#34A853"
        - "#FBBC04"
      options:
        steps: 5
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [average_of_volume]
    series_colors: {}
    series_labels: {}
    reference_lines: []
    trend_lines: []
    hidden_fields: []
    hidden_points_if_no: []
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 13
    col: 2
    width: 9
    height: 6
  - name: Price Information
    type: text
    title_text: Price Information
    body_text: ''
    row: 5
    col: 2
    width: 20
    height: 1
  - title: Valuation Measures
    name: Valuation Measures
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.market_cap, stock_info.enterprise_value, stock_info.trailing_pe,
      stock_info.forward_pe, stock_info.peg_ratio, stock_info.price_to_sales_trailing12_months,
      stock_info.price_to_book, stock_info.enterprise_to_revenue, stock_info.enterprise_to_ebitda]
    sorts: [stock_info.market_cap]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
    minimum_column_width: 75
    header_font_color: "#FFFF"
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
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 19
    col: 2
    width: 20
    height: 3
  - title: companyinfo
    name: companyinfo
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::company_info
    fields: [stock_info.short_name, stock_info.long_business_summary, stock_info.website,
      stock_info.full_time_employees, stock_info.sector, stock_info.upcoming_fye,
      stock_info.industry]
    sorts: [stock_info.upcoming_fye desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    primary_color: "#1A73E8"
    secondary_color: "#1A73E8"
    use_background: true
    background_color: "#e4eff5"
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
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    minimum_column_width: 75
    series_column_widths:
      stock_info.website: 158
    title_hidden: true
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 22
    col: 2
    width: 14
    height: 10
  - title: candlesticktest
    name: candlesticktest
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::candlestick
    fields: [stock_history_with_date_crossjoin.date_selection_date, stock_history_with_date_crossjoin.high,
      stock_history_with_date_crossjoin.low, stock_history_with_date_crossjoin.open,
      stock_history_with_date_crossjoin.close]
    filters:
      stock_history_with_date_crossjoin.date_selection_date: 3 months
    sorts: [stock_history_with_date_crossjoin.date_selection_date]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    title_hidden: true
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 6
    col: 2
    width: 20
    height: 7
  - title: comparison
    name: comparison
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::equity-metric-comparison
    fields: [stock_info.trailing_eps, stock_info.forward_eps]
    filters: {}
    sorts: [stock_info.trailing_eps]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_title: EPS Comparison
    background_color: "#4285F4"
    text_color: "#FFF"
    corner_style: 16px
    metric_name: ''
    ttm_color: "#3498db"
    forward_color: "#2ecc71"
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
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 6
    width: 4
    height: 5
  - title: comparison
    name: comparison (2)
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::equity-metric-comparison
    fields: [stock_info.trailing_pe, stock_info.forward_pe]
    filters: {}
    sorts: [stock_info.trailing_pe]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_title: P/E Ratio Comparison
    background_color: "#00BB72"
    text_color: "#FFF"
    corner_style: 16px
    ttm_color: "#c8ccc9"
    forward_color: "#c8ccc9"
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
    defaults_version: 0
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 10
    width: 4
    height: 5
  - title: recommendation
    name: recommendation
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::buy_sell_hold
    fields: [stock_info.recommendation_key, stock_info.recommendation_mean, stock_info.number_of_analyst_opinions]
    sorts: [stock_info.recommendation_key]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_title: 'Analysts 💡:'
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 18
    width: 4
    height: 5
  - title: 52weekchange
    name: 52weekchange
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::twonumflex
    fields: [stock_info.52_week_change, stock_info.sandp_52_week_change]
    sorts: [stock_info.52_week_change]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_title: 52 Week Change Comparison
    background_color: "#F4B400"
    text_color: "#FFF"
    corner_style: 16px
    left_subtitle: Selected
    right_subtitle: S&P
    use_percentage: true
    decimal_places: 2
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
    defaults_version: 0
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 14
    width: 4
    height: 5
  - title: stocktile
    name: stocktile
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::stockvisualizationcard
    fields: [stock_info.short_name, stock_info.symbol, stock_info.current_price, stock_info.previous_close]
    sorts: [stock_info.short_name]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    style: colorful
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
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 2
    width: 4
    height: 5
  - title: Risk Analysis
    name: Risk Evaluation
    model: portfolio
    explore: stock_info
    type: genai_extensions::query_insights
    fields: [stock_info.id, stock_info.audit_risk, stock_info.board_risk, stock_info.compensation_risk,
      stock_info.share_holder_rights_risk, stock_info.overall_risk]
    filters: {}
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    temperature: 0.2
    prompt: summarize
    insightImage: https://img.icons8.com/ios/50/light-on--v1.png
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
    defaults_version: 0
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 22
    col: 16
    width: 6
    height: 10
  filters:
  - name: ID
    title: ID
    type: field_filter
    default_value: goog
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    model: portfolio
    explore: stock_info
    listens_to_filters: []
    field: stock_info.id
  - name: Historic Month
    title: Historic Month
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: portfolio
    explore: stock_info
    listens_to_filters: []
    field: stock_history_with_date_crossjoin.date_selection_month

---
- dashboard: er
  title: ER
  layout: newspaper
  preferred_slug: X7jmaL5rSL8ja4KnzLgwWS

---
- dashboard: eric
  title: eric
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Qwa0BSgMnjEfGBUlD7MSBf
  elements:
  - title: eric
    name: eric
    model: i__looker
    explore: history
    type: single_value
    fields: [history.source]
    fill_fields: [history.source]
    sorts: [history.source]
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
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6

---
- dashboard: ericcooltest
  title: ericcooltest
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: 5n8Cd6ERVVF0PMpThrZrXc
  elements:
  - title: ericcooltest
    name: ericcooltest
    model: thelook
    explore: order_items
    type: table
    fields: [users.count, user_order_facts.first_order_month, order_items.total_sale_price]
    pivots: [user_order_facts.first_order_month]
    filters: {}
    sorts: [users.count desc 0]
    limit: 500
    column_limit: 50
    listen:
      Created Month: order_items.created_month
    row:
    col:
    width:
    height:
  filters:
  - name: Created Month
    title: Created Month
    type: field_filter
    default_value: September
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
- dashboard: example
  title: Example
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 0Ix0bbTHzwC338QbTWc8VK
  elements:
  - title: Example
    name: Example
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [products.brand, order_items.repeat_orders_within_30d]
    sorts: [products.brand]
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
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: example5
  title: Example5
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: f3TKu8UXeCYMPBFEAmb2vH
  elements:
  - title: Example5
    name: Example5
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_month_name, order_items.created_year, order_items.total_sale_price]
    pivots: [order_items.created_year]
    filters: {}
    sorts: [order_items.created_year]
    limit: 5000
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Created Date: order_items.created_date
      Created Year: order_items.created_year
    row: 0
    col: 0
    width: 7
    height: 7
  - title: View
    name: View
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.average_sale_price, products.category]
    sorts: [order_items.average_sale_price desc 0]
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
    listen:
      Created Date: order_items.created_date
      Created Year: order_items.created_year
    row: 0
    col: 7
    width: 6
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: before 0 months ago
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: 4 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_year

---
- dashboard: extension_test
  title: Extension Test
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Uolnyqg8BcK84Byzg2LgvA
  elements:
  - title: Extension Test
    name: Extension Test
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [users.state, order_items.total_gross_margin]
    filters: {}
    sorts: [order_items.total_gross_margin desc]
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    y_axes: []
    listen:
      Created: inventory_items.created_date
      Total Gross Margin: order_items.total_gross_margin
      Country: users.country
    row: 0
    col: 0
    width: 24
    height: 12
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 12
    col: 0
    width: 24
    height: 13
  filters:
  - name: Created
    title: Created
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: inventory_items.created_date
  - name: Total Gross Margin
    title: Total Gross Margin
    type: field_filter
    default_value: ">=10000"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.total_gross_margin
  - name: Country
    title: Country
    type: field_filter
    default_value: USA
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.country

---
- dashboard: favorite_dash_for_location_goals
  title: favorite dash for location goals
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: tHl7OlK5mRabXxVhAL2otB
  elements:
  - title: favorite dash for location goals
    name: favorite dash for location goals
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.count, distribution_centers.location]
    filters: {}
    sorts: [users.count desc 0]
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
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
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
      Created: users.created_date
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      Gender: users.gender
      Created Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created
    title: Created
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.created_date
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
    listens_to_filters: []
    field: users.state
  - name: City
    title: City
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
  - name: Gender
    title: Gender
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
    field: users.gender
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 14 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
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
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.country

---
- dashboard: filter_test
  title: filter test
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: ilohq6wSRzEEHSC962Ot47
  elements:
  - title: filter test
    name: filter test
    model: thelook
    explore: order_items
    type: looker_scatter
    fields: [order_items.created_hour_of_day, order_items.total_sale_price]
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
    show_null_points: true
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: filter_test_on_dashboard_summary
  title: Filter test on Dashboard Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: qLrptcLGwBXF2XTZeA8Xjo
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
      Country: users.country
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
- dashboard: financial_overview
  title: Financial Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: jVMvy0AeNSe63cYw72Mj4P
  elements:
  - name: 24 Hour Price Change Comparison
    type: text
    title_text: 24 Hour Price Change Comparison
    subtitle_text: ''
    body_text: " "
    row: 21
    col: 2
    width: 20
    height: 1
  - title: Top 10
    name: Top 10
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.symbol, market_data.price_change_percentage_7d_in_currency]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_7d_in_currency desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
    series_labels:
      market_data.id: Currency
      market_data.ath_change_percentage: Price Change %  (7 Days)
      market_data.price_change_percentage_7d_in_currency: Price Change 7d
    series_cell_visualizations:
      market_data.ath_change_percentage:
        is_active: false
      market_data.price_change_percentage_7d_in_currency:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {steps: 6, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 30
    col: 2
    width: 10
    height: 8
  - title: Averages Disburment by by Week
    name: Averages Disburment by by Week
    model: portfolio
    explore: market_data
    type: looker_line
    fields: [history_with_date_crossjoin.history_date_week, average_of_price, history_with_date_crossjoin.coin_id]
    pivots: [history_with_date_crossjoin.coin_id]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [history_with_date_crossjoin.coin_id, history_with_date_crossjoin.history_date_week
        desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap % Change (24hrs)
      market_data.id: Currency
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
    series_cell_visualizations:
      market_data.market_cap_change_percentage_24h:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    column_order: [market_data.name, market_data.symbol, market_data.current_price,
      market_data.high_24h, market_data.low_24h]
    hidden_pivots: {}
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 14
    col: 2
    width: 20
    height: 7
  - type: button
    name: button_3494
    rich_content_json: '{"text":"Check Disbursement Status","description":"Navigate
      to your personal portfolio to view your holdings.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://www.fema.gov/grants/emergency-food-and-shelter-program"}'
    row: 0
    col: 15
    width: 7
    height: 1
  - title: Top 10
    name: Top 10 (2)
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.high_24h, market_data.low_24h, market_data.price_change_percentage_24h]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_24h desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
    series_labels:
      market_data.id: Currency
      market_data.price_change_percentage_24h: Price Change 24h
    series_cell_visualizations:
      market_data.price_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        value_display: true
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: less than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 22
    col: 2
    width: 10
    height: 7
  - title: Bottom 10
    name: Bottom 10
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.price_change_percentage_24h]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_24h]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: true
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
    series_labels:
      market_data.id: Currency
      market_data.price_change_percentage_24h: Price Change 24h
    series_cell_visualizations:
      market_data.price_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        value_display: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: less than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0, background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: google-theme, palette_id: google-theme-sequential-0, options: {
            constraints: {min: {type: minimum}, mid: {type: number, value: 0}, max: {
                type: maximum}}, mirror: true, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 0, background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: google-theme, palette_id: google-theme-sequential-0, options: {
            constraints: {min: {type: minimum}, mid: {type: number, value: 0}, max: {
                type: maximum}}, mirror: true, reverse: false, stepped: false}}, bold: true,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 22
    col: 12
    width: 10
    height: 7
  - name: ''
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 0
    width: 2
    height: 62
  - name: " (2)"
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 22
    width: 2
    height: 62
  - name: 7 Day  Price Change Comparison
    type: text
    title_text: 7 Day  Price Change Comparison
    subtitle_text: ''
    body_text: " "
    row: 29
    col: 2
    width: 20
    height: 1
  - title: Bottom 10
    name: Bottom 10 (2)
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.symbol, market_data.price_change_percentage_7d_in_currency]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_7d_in_currency]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
    series_labels:
      market_data.id: Currency
      market_data.ath_change_percentage: Price Change %  (7 Days)
      market_data.price_change_percentage_7d_in_currency: Price Change 7d
    series_cell_visualizations:
      market_data.ath_change_percentage:
        is_active: false
      market_data.price_change_percentage_7d_in_currency:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {steps: 6, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 30
    col: 12
    width: 10
    height: 8
  - title: " Disbursement by Carrier Segment"
    name: " Disbursement by Carrier Segment"
    model: portfolio
    explore: market_data
    type: finance_portfolio_demo::crypto_heatmap
    fields: [market_data.symbol, market_data.market_cap, market_data.market_cap_change_percentage_24h,
      market_data.current_price]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.market_cap desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap % Change (24hrs)
      market_data.id: Currency
    show_view_names: false
    min_font_size: 8
    positive_color: "#25d4ff"
    neutral_color: "#10789e"
    negative_color: "#0d1566"
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [market_data.name, market_data.symbol, market_data.current_price,
      market_data.high_24h, market_data.low_24h]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      market_data.market_cap_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#fff"
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 38
    col: 2
    width: 20
    height: 9
  - name: "% Cash Disbursments"
    type: text
    title_text: "% Cash Disbursments"
    subtitle_text: ''
    body_text: ''
    row: 1
    col: 14
    width: 8
    height: 1
  - name: Net Written Premium
    type: text
    title_text: Net Written Premium
    subtitle_text: ''
    body_text: ''
    row: 1
    col: 2
    width: 8
    height: 1
  - title: Cash dCrypto
    name: Cash dCrypto
    model: portfolio
    explore: market_data
    type: single_value
    fields: [average_of_price_change_percentage_in_currency_7_days, market_data.market_cap]
    filters: {}
    sorts: [average_of_price_change_percentage_in_currency_7_days]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: market_data.price_change_percentage_7d_in_currency
      expression: ''
      label: Average of Price Change Percentage in currency - 7 days
      measure: average_of_price_change_percentage_in_currency_7_days
      type: average
    - category: table_calculation
      expression: "-(${average_of_price_change_percentage_in_currency_7_days})/100"
      label: Change w.r.t previous year
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: change_wrt_previous_year
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    conditional_formatting: [{type: greater than, value: 0, background_color: "#7CB342",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: "#7CB342", font_color: "#FFF", color_application: {
          collection_id: google-theme, palette_id: google-theme-diverging-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [average_of_price_change_percentage_in_currency_7_days, market_data.market_cap]
    listen:
      WYO Carrier: market_data.coin_highlight
    row: 2
    col: 15
    width: 7
    height: 4
  - name: Net Paid Losses
    type: text
    title_text: Net Paid Losses
    subtitle_text: ''
    body_text: ''
    row: 1
    col: 10
    width: 4
    height: 1
  - title: Consolidated Premium
    name: Consolidated Premium
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, order_items.created_month_name, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_month_name, order_items.created_year]
    filters:
      order_items.created_year: '2023,2024'
    sorts: [order_items.created_month_name, order_items.created_year desc]
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
    y_axes: [{label: Consolidated Written Premium ( in Millions), orientation: left,
        series: [{axisId: order_items.total_sale_price, id: 2024 - order_items.total_sale_price,
            name: '2024'}, {axisId: order_items.total_sale_price, id: 2023 - order_items.total_sale_price,
            name: '2023'}], showLabels: true, showValues: true, valueFormat: "$#",
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 20, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    x_axis_datetime_label: ''
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 6
    col: 2
    width: 11
    height: 8
  - title: 'Consolidated Disbursements by Location '
    name: 'Consolidated Disbursements by Location '
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [distribution_centers.name, users.count_percent_of_total]
    sorts: [distribution_centers.name]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    hidden_pivots: {}
    y_axes: []
    listen: {}
    row: 6
    col: 13
    width: 9
    height: 8
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":" "}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 2
    width: 13
    height: 1
  - title: Untitled
    name: Untitled
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.created_year, order_items.total_sale_price, order_items.created_month_name]
    filters:
      order_items.created_year: 2 years
    sorts: [order_items.created_year, order_items.total_sale_price desc]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: change
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
    hidden_fields: []
    hidden_pivots: {}
    y_axes: []
    listen: {}
    row: 2
    col: 9
    width: 6
    height: 4
  - title: Untitled
    name: Untitled (2)
    model: bqml_genai_blocks
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_year]
    fill_fields: [order_items.created_year]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    comparison_label: w.r.t Previous year
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [order_items.created_year]
    listen: {}
    row: 2
    col: 2
    width: 7
    height: 4
  - title: New Tile
    name: New Tile
    model: retail_banking
    explore: trans
    type: looker_grid
    fields: [trans.transaction_date, trans.trans_id, trans.category, trans.amount,
      trans.balance, trans.type, trans.total_transaction_value]
    filters:
      trans.account_id: ''
      trans.transaction_date: before 0 days ago
      client.client_id: ''
      account.account_id: '7542'
    sorts: [trans.transaction_date desc]
    limit: 20
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
    listen: {}
    row: 47
    col: 2
    width: 20
    height: 7
  filters:
  - name: WYO Carrier
    title: WYO Carrier
    type: field_filter
    default_value: Dash
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: portfolio
    explore: market_data
    listens_to_filters: []
    field: market_data.coin_highlight

---
- dashboard: financial_overview__user_trends
  title: Financial Overview & User Trends
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: AhrYSFKjxVq6kCO90XPnkW
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
- dashboard: finopsdemo
  title: FinOps-Demo
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: x03gkIqkVGDLrlgX4CrXDS
  elements:
  - title: Portfolio Value
    name: Portfolio Value
    model: portfolio
    explore: portfolio
    type: single_value
    fields: [portfolio_history.total_value]
    filters:
      portfolio_history.history_date_date: 1 days
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
    conditional_formatting: [{type: greater than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 2
    width: 6
    height: 4
  - title: Investments by Value
    name: Investments by Value
    model: portfolio
    explore: portfolio
    type: looker_grid
    fields: [portfolio_history.id, portfolio_history.price, portfolio_history.amount,
      portfolio_history.value]
    filters:
      portfolio_history.history_date_date: 1 days
    sorts: [portfolio_history.id]
    limit: 15
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      portfolio.value: Value
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 13
    col: 14
    width: 8
    height: 6
  - title: Investment Value by Sector
    name: Investment Value by Sector
    model: portfolio
    explore: portfolio
    type: looker_pie
    fields: [portfolio.sector, portfolio_history.total_value]
    filters:
      portfolio_history.history_date_date: 1 days
    sorts: [portfolio.sector]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 70
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    hidden_pivots: {}
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
    row: 13
    col: 2
    width: 12
    height: 6
  - title: Investment Type
    name: Investment Type
    model: portfolio
    explore: portfolio
    type: looker_bar
    fields: [portfolio_history.investment_type, portfolio_history.total_value]
    pivots: [portfolio_history.investment_type]
    filters:
      portfolio_history.history_date_date: 1 days
    sorts: [portfolio_history.investment_type]
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
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: left
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
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Crypto Currency -
              portfolio.total_value, id: Crypto Currency - portfolio.total_value,
            name: Crypto Currency}, {axisId: Equity - portfolio.total_value, id: Equity
              - portfolio.total_value, name: Equity}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Equity: "#F9AB00"
      Crypto Currency - portfolio_history.total_value: "#1A73E8"
    value_labels: labels
    label_type: labPer
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 10
    col: 2
    width: 20
    height: 3
  - name: ''
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 0
    width: 2
    height: 91
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "  "
    row: 0
    col: 22
    width: 2
    height: 91
  - name: Portfolio Distribution by Value
    type: text
    title_text: Portfolio Distribution by Value
    body_text: ''
    row: 8
    col: 2
    width: 20
    height: 2
  - type: button
    name: button_3432
    rich_content_json: '{"text":"Market Overview","description":"Take a peek at how
      the market is performing as a whole.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"/dashboards/DrvcA0QMh1n95F4cVNngbT?Coin+Highlight=Bitcoin"}'
    row: 28
    col: 2
    width: 20
    height: 1
  - name: Investment History
    type: text
    title_text: Investment History
    body_text: ''
    row: 19
    col: 2
    width: 20
    height: 2
  - title: Initial Investment
    name: Initial Investment
    model: portfolio
    explore: portfolio
    type: single_value
    fields: [portfolio_history.history_date_date, portfolio_history.total_value]
    fill_fields: [portfolio_history.history_date_date]
    filters:
      portfolio_history.id: "-NULL"
      portfolio_history.history_date_date: before 364 days ago
    sorts: [portfolio_history.history_date_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: list
      based_on: portfolio_history.id
      expression: ''
      label: List of ID
      measure: list_of_id
      type: list
    - _kind_hint: measure
      _type_hint: number
      based_on: portfolio_history.value
      expression: ''
      label: Sum of Available Value
      measure: sum_of_available_value
      type: sum
    - category: table_calculation
      description: The change in the number of shares/coins from the initial investment
        to today's current holdings.
      expression: "${portfolio.amount}-${portfolio_history.amount}"
      label: Change in Quantity
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: change_in_quantity
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Change in value from the initial investment to today's current
        holdings.
      expression: "${portfolio.total_value}-${sum_of_available_value}"
      label: Growth
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: growth
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Initial Investment Date
    conditional_formatting: [{type: greater than, value: 0, background_color: "#F4B400",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      portfolio_history.history_date_date: Orig. Investment Date
      sum_of_available_value: Initial Investment
      portfolio.total_value: Current Investment Value
    show_view_names: false
    show_row_numbers: false
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      sum_of_available_value:
        is_active: false
      growth:
        is_active: true
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    hidden_pivots: {}
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
    listen: {}
    row: 4
    col: 2
    width: 6
    height: 4
  - title: All Account Growth
    name: All Account Growth
    model: portfolio
    explore: portfolio
    type: looker_grid
    fields: [portfolio_history.history_date_date, portfolio_history.total_value]
    fill_fields: [portfolio_history.history_date_date]
    filters:
      portfolio_history.history_date_date: NOT NULL
      portfolio_history.total_value: NOT NULL
    sorts: [portfolio_history.history_date_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${portfolio_history.total_value}/offset(${portfolio_history.total_value},-1)-1"
      label: Percent Change
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: percent_change
      _type_hint: number
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      portfolio_history.history_date_date: Date
    series_cell_visualizations:
      portfolio_history.total_value:
        is_active: true
        palette:
          palette_id: 0c80a097-7fb5-ed98-54d9-684f561732fa
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#e6d80c"
          - "#e86f36"
    header_background_color: "#F9AB00"
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [percent_change]}, {type: less than, value: 0,
        background_color: '', font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [percent_change]}]
    series_value_format:
      percent_change:
        name: percent_2
        decimals: '2'
        format_string: "#,##0.00%"
        label: Percent (2)
        label_prefix: Percent
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
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 21
    col: 6
    width: 12
    height: 7
  - title: Daily Growth
    name: Daily Growth
    model: portfolio
    explore: portfolio
    type: looker_line
    fields: [portfolio_history.total_value, portfolio_history.history_date_date]
    fill_fields: [portfolio_history.history_date_date]
    filters:
      portfolio_history.history_date_month: 3 months
    sorts: [portfolio_history.history_date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${portfolio_history.total_value}/offset(${portfolio_history.total_value},-1)-1"
      label: Percent Change
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: percent_change
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: true
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
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      portfolio_history.total_value: "#E52592"
    series_labels:
      portfolio_history.history_date_date: Date
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_cell_visualizations:
      portfolio_history.total_value:
        is_active: true
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: less than, value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 8
    width: 14
    height: 8

---
- dashboard: first_dashboard
  title: First Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: K1Q2luIKUuE3AhA3lw5FVy
  elements:
  - title: First Dashboard
    name: First Dashboard
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.age_tier, order_items.total_sale_price]
    fill_fields: [users.age_tier]
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
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: for_chunyi
  title: For Chunyi
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: z9HNd0H45DQNGgUd9iNSkl
  elements:
  - title: for marketing team analysis
    name: for marketing team analysis
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
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 12
    height: 6
  - title: New Tile
    name: New Tile
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
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 13
    width: 8
    height: 6
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: for_demo_
  title: 'for demo '
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: fZNcD6iv2EqqDMYzh2zJNw
  elements:
  - title: 'for demo '
    name: 'for demo '
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
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: for_demo_3
  title: for demo 3
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: n7YMjrrIWI2wquEG0zW22B
  elements:
  - title: for demo 3
    name: for demo 3
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
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: for_demo_4
  title: for demo 4
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: BgfZX0l3YZ5Q71Gqpe46nS
  elements:
  - title: for demo 4
    name: for demo 4
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
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 11
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: for_demo_5
  title: for demo 5
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: 2s3JDWm6RVNVaQVvQS58VJ
  elements:
  - title: for demo 5
    name: for demo 5
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
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: for_demo_purpose
  title: for demo purpose
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JkSY20JToHhot8JPTEi4oL
  elements:
  - title: for demo purpose
    name: for demo purpose
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.email, user_order_facts.lifetime_revenue]
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 15
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: for_demo2
  title: for demo2
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: f1ASZnAcNnypQFsg9JZFwQ
  elements:
  - title: for demo2
    name: for demo2
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
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:

---
- dashboard: for_demo22
  title: for demo22
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: aFE6Ie2fWsuO1byYgOjUIm
  elements:
  - title: for demo22
    name: for demo22
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
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 16
    height: 9
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: for_demo33
  title: for demo33
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8q4kE5vrJ2d2MxAs0OdKta
  elements:
  - title: for demo33
    name: for demo33
    model: thelook
    explore: order_items
    type: looker_line
    fields: [products.category, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    filters: {}
    sorts: [order_items.created_year desc, order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 11
    height: 5
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: this year, last year, 2022
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: Created Date (2)
    title: Created Date (2)
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: for_emily
  title: for emily
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: nAPUGeaHWdyfAbUW4Ezh1Y
  elements:
  - title: for emily
    name: for emily
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.email, user_order_facts.lifetime_revenue]
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 11
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
