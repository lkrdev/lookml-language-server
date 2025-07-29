---
- dashboard: _insurance_account_details
  title: " Insurance Account Details"
  elements:
  - title: Asset Details
    name: Asset Details
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.id, market_data.symbol, market_data.market_cap, market_data.market_cap_change_percentage_24h,
      market_data.market_cap_change_24h]
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
      market_data.market_cap_change_percentage_24h: Change % w.r.t Previous year
      market_data.market_cap_change_24h: Change w.r.t Previous year24hrs
      market_data.symbol: Asset Name
      market_data.market_cap: Total Value
      market_data.fully_diluted_valuation: Net Value
    series_cell_visualizations:
      market_data.market_cap_change_percentage_24h:
        is_active: true
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
    listen: {}
    row: 12
    col: 6
    width: 16
    height: 4
  - title: Net Revenue
    name: Net Revenue
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.id, market_data.high_24h, market_data.ath]
    sorts: [market_data.high_24h desc]
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
    listen: {}
    row: 0
    col: 10
    width: 6
    height: 5
  - title: Net Losses
    name: Net Losses
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.id, market_data.low_24h, market_data.atl]
    sorts: [market_data.low_24h desc]
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
    listen: {}
    row: 0
    col: 16
    width: 6
    height: 5
  - title: Liabilities
    name: Liabilities
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
    listen: {}
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
  - title: Consolidated Net Written Premium
    name: Consolidated Net Written Premium
    model: portfolio
    explore: market_data
    type: single_value
    fields: [market_data.price_change_percentage_1h_in_currency]
    sorts: [market_data.price_change_percentage_1h_in_currency desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: w.r.t Previous year
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
    listen: {}
    row: 12
    col: 0
    width: 6
    height: 4
  - title: Previous Year Change
    name: Previous Year Change
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
    listen: {}
    row: 16
    col: 0
    width: 3
    height: 4
  - title: Change wrt Average
    name: Change wrt Average
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
    listen: {}
    row: 16
    col: 3
    width: 3
    height: 4
  - title: Avg Losses
    name: Avg Losses
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
    listen: {}
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
    listen: {}
    row: 21
    col: 12
    width: 10
    height: 8
  - name: Price Change Information
    type: text
    title_text: Price Change Information
    body_text: ''
    row: 11
    col: 0
    width: 6
    height: 1
  - name: Asset and Liabilities Information
    type: text
    title_text: Asset and Liabilities Information
    subtitle_text: ''
    body_text: ''
    row: 11
    col: 6
    width: 16
    height: 1
  - name: Net LossesTrends
    type: text
    title_text: Net LossesTrends
    subtitle_text: ''
    body_text: ''
    row: 20
    col: 0
    width: 22
    height: 1
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 10
    height: 11

---
- dashboard: 1_cmha__looker_metrics_demo
  title: "(1) CMHA - Looker Metrics Demo"
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: 1Xgejb3ZH5MkWKvu53g6OK
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Canadian Mental Health  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Canadian Mental Health  <br>
    subtitle_text: <font size="3">Looker Dashboard Demo <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Occupancy
      <p>
    row: 14
    col: 3
    width: 18
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 57
    col: 0
    width: 23
    height: 20
  - title: Total Referrals
    name: Total Referrals
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_funnel
    fields: [ortho_procedures.count_cases, ortho_facilities.city, ortho_npi_facts.facility_name]
    filters:
      ortho_procedures.complete: 'Yes'
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.count_cases desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Referrals
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: [ortho_npi_facts.facility_name, ortho_facilities.city]
    show_null_points: true
    up_color: false
    down_color: false
    total_color: false
    hidden_points_if_no: []
    series_labels: {}
    font_size: 12
    listen:
      Region: ortho_facilities.city
    row: 4
    col: 3
    width: 17
    height: 10
  - name: <p><center> <b> <font size="5"> <font color="black"> Waitlist <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Waitlist <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Region to
      Filter<p>
    body_text: ''
    row: 26
    col: 0
    width: 24
    height: 2
  - title: Length of Stay
    name: Length of Stay
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_facilities.facility, ortho_procedures.count_cases, linked_groups,
      ortho_facilities.city]
    pivots: [linked_groups]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [linked_groups, ortho_procedures.count_cases desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Linked Groups
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: linked_groups
      args:
      - ortho_reasons_wait_time.reason_wait_time_description
      - - label: Linked
          filter: Missing or Incomplete Informed Consents,No Recovery Room Available,No
            Wait,Staff Too Busy
      - Not Linked
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: |-
        substring(${ortho_facilities.facility},
          0,
          position(${ortho_facilities.facility},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: "${ortho_procedures.count_cases}*0.05"
      label: Length of Stay
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: length_of_stay
      _type_hint: number
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#F9AB00"}, {reference_type: line, line_value: min, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#12B5CB"}, {reference_type: line, line_value: max,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#EA4335"}]
    trend_lines: []
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    hidden_fields: [ortho_facilities.facility, ortho_facilities.city, ortho_procedures.count_cases]
    listen:
      Region: ortho_facilities.city
    row: 48
    col: 3
    width: 17
    height: 9
  - title: Intakes
    name: Intakes
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city]
    hidden_points_if_no: []
    listen:
      Region: ortho_facilities.city
    row: 39
    col: 3
    width: 17
    height: 7
  - name: <p><center> <b> <font size="5"> <font color="black"> Length of Stay <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Length of Stay
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Region <p>
    body_text: ''
    row: 46
    col: 0
    width: 24
    height: 2
  - title: Rate Monthly Trend by Site
    name: Rate Monthly Trend by Site
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Chattanooga'
        }, {
          name: 'Columbia'
        }, {
          name: 'Cookeville'
        }, {
          name: 'Germantown'
        }, {
          name: 'Hermitage'
        }, {
          name: 'Jackson'
        }, {
          name: 'Johnson City'
        }, {
          name: 'Knoxville'
        }, {
          name: 'Memphis'
        }, {
          name: 'Nashville'
        }]
      }
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Actual Start Month: ortho_procedures.actual_start_month
      Region: ortho_facilities.city
    row: 16
    col: 3
    width: 8
    height: 10
  - title: "# of beds available"
    name: "# of beds available"
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: round(${intakes}*0.00034,0)
      label: Available Beds
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: available_beds
      _type_hint: number
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
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
      available_beds: "#079c98"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city, intakes]
    hidden_points_if_no: []
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
      Region: ortho_facilities.city
    row: 16
    col: 12
    width: 8
    height: 10
  - title: "# People On Waitlist"
    name: "# People On Waitlist"
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: round(${intakes}*0.000034,0)
      label: Number on Waitlist
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: number_on_waitlist
      _type_hint: number
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
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
      available_beds: "#079c98"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    reference_lines: []
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city, intakes]
    hidden_points_if_no: []
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
    show_null_points: true
    interpolation: linear
    listen:
      Region: ortho_facilities.city
    row: 28
    col: 3
    width: 8
    height: 9
  - title: 'Time Spent on Waitlist (Days) '
    name: 'Time Spent on Waitlist (Days) '
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: round(${intakes}*0.0000039,0)
      label: Time Spent on Waitlist
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: time_spent_on_waitlist
      _type_hint: number
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
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
      available_beds: "#079c98"
      time_spent_on_waitlist: "#80868B"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#EA4335"}, {reference_type: line, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#80868B"}, {reference_type: line, line_value: min,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#7CB342"}]
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city, intakes]
    hidden_points_if_no: []
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
    show_null_points: true
    interpolation: linear
    listen:
      Region: ortho_facilities.city
    row: 28
    col: 12
    width: 8
    height: 9
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Referrals
      <p>
    row: 2
    col: 3
    width: 17
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Intakes <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Intakes <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Region to
      Filter<p>
    body_text: ''
    row: 37
    col: 3
    width: 17
    height: 2
  filters:
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_facilities.city
  - name: Actual Start Month
    title: Actual Start Month
    type: field_filter
    default_value: 2020/01/01 to 2021/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_procedures.actual_start_month

---
- dashboard: 1_healthcare_operations__ortho
  title: "(1) Healthcare Operations - Ortho"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Eo0gaawIarD3boofoqUKyS
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
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
    point_style: circle
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
        reverse: false
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 47
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 10
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 10
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 2
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 2
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Number of Cases
    name: Number of Cases
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'Yes'
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
    single_value_title: Total Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 3
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 3
    width: 3
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 18
    width: 3
    height: 4
  - title: Facility Late Start Comparisons
    name: Facility Late Start Comparisons
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_facilities.facility,
      ortho_procedures.count_cases]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.count_cases
        desc 2]
    limit: 10
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Payer: ortho_payer.payer_type
    row: 47
    col: 8
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    defaults_version: 1
    hidden_fields: []
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 0
    width: 8
    height: 9
  - title: Top 10 Facility Volume and Charges
    name: Top 10 Facility Volume and Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases]
    sorts: [ortho_procedures.total_procedural_charges desc]
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      ortho_procedures.total_procedural_charges: scatter
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 16
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    "y": ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
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
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 4
    col: 9
    width: 3
    height: 2
  - title: No Show Rate Monthly Trend by Facility
    name: No Show Rate Monthly Trend by Facility
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 10
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Payer
    title: Payer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_payer.payer_type
  - name: Supplier
    title: Supplier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_supplier_preferences.supplier_name

---
- dashboard: 1_healthcare_operations__ortho
  title: "(1) Healthcare Operations - Ortho"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: nJxCnIQvjAK1IaXaUKLyLd
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
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
    point_style: circle
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
        reverse: false
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 47
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 10
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 10
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 2
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 2
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Number of Cases
    name: Number of Cases
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'Yes'
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
    single_value_title: Total Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 3
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 3
    width: 3
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 18
    width: 3
    height: 4
  - title: Facility Late Start Comparisons
    name: Facility Late Start Comparisons
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_facilities.facility,
      ortho_procedures.count_cases]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.count_cases
        desc 2]
    limit: 10
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Payer: ortho_payer.payer_type
    row: 47
    col: 8
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    defaults_version: 1
    hidden_fields: []
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 0
    width: 8
    height: 9
  - title: Top 10 Facility Volume and Charges
    name: Top 10 Facility Volume and Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases]
    sorts: [ortho_procedures.total_procedural_charges desc]
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      ortho_procedures.total_procedural_charges: scatter
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 16
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    "y": ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
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
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 4
    col: 9
    width: 3
    height: 2
  - title: No Show Rate Monthly Trend by Facility
    name: No Show Rate Monthly Trend by Facility
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 10
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Payer
    title: Payer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_payer.payer_type
  - name: Supplier
    title: Supplier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_supplier_preferences.supplier_name

---
- dashboard: 1_healthcare_operations__ortho_bkp
  title: "(1) Healthcare Operations - Ortho (bkp)"
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: zU4nZAfcIozxWBShiqaxWi
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 4
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
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
    point_style: circle
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
        reverse: false
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen: {}
    row: 68
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 8
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 0
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 40
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen: {}
    row: 40
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 6
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 6
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 27
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 66
    col: 0
    width: 24
    height: 2
  - title: Total Referrals
    name: Total Referrals
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.count_cases, ortho_facilities.city, ortho_npi_facts.facility_name]
    filters:
      ortho_procedures.complete: 'Yes'
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.count_cases desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Referrals
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: [ortho_npi_facts.facility_name, ortho_facilities.city]
    show_null_points: true
    listen:
      Region: ortho_facilities.city
    row: 8
    col: 3
    width: 9
    height: 5
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 38
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 23
    col: 3
    width: 4
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 0
    col: 18
    width: 3
    height: 4
  - title: Length of Stay
    name: Length of Stay
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_facilities.facility, ortho_procedures.count_cases, linked_groups,
      ortho_facilities.city]
    pivots: [linked_groups]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [linked_groups, ortho_procedures.count_cases desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Linked Groups
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: linked_groups
      args:
      - ortho_reasons_wait_time.reason_wait_time_description
      - - label: Linked
          filter: Missing or Incomplete Informed Consents,No Recovery Room Available,No
            Wait,Staff Too Busy
      - Not Linked
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: |-
        substring(${ortho_facilities.facility},
          0,
          position(${ortho_facilities.facility},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: "${ortho_procedures.count_cases}*0.05"
      label: Length of Stay
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: length_of_stay
      _type_hint: number
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#F9AB00"}, {reference_type: line, line_value: min, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#12B5CB"}, {reference_type: line, line_value: max,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#EA4335"}]
    trend_lines: []
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    hidden_fields: [ortho_facilities.facility, ortho_facilities.city, ortho_procedures.count_cases]
    listen:
      Region: ortho_facilities.city
    row: 78
    col: 16
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 68
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    defaults_version: 1
    listen: {}
    row: 68
    col: 0
    width: 8
    height: 9
  - title: Intakes
    name: Intakes
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city]
    hidden_points_if_no: []
    listen:
      Region: ortho_facilities.city
    row: 29
    col: 3
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    "y": ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen: {}
    row: 47
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
    row: 57
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 55
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen: {}
    row: 57
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
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
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen: {}
    row: 57
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 25
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 25
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 23
    col: 9
    width: 3
    height: 2
  - title: Rate Monthly Trend by Site
    name: Rate Monthly Trend by Site
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Chattanooga'
        }, {
          name: 'Columbia'
        }, {
          name: 'Cookeville'
        }, {
          name: 'Germantown'
        }, {
          name: 'Hermitage'
        }, {
          name: 'Jackson'
        }, {
          name: 'Johnson City'
        }, {
          name: 'Knoxville'
        }, {
          name: 'Memphis'
        }, {
          name: 'Nashville'
        }]
      }
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Actual Start Month: ortho_procedures.actual_start_month
      Region: ortho_facilities.city
    row: 13
    col: 3
    width: 8
    height: 10
  - title: "# of beds available"
    name: "# of beds available"
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: round(${intakes}*0.00034,0)
      label: Available Beds
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: available_beds
      _type_hint: number
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
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
      available_beds: "#079c98"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city, intakes]
    hidden_points_if_no: []
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
      Region: ortho_facilities.city
    row: 13
    col: 11
    width: 8
    height: 9
  - title: "# On Waitlist"
    name: "# On Waitlist"
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: round(${intakes}*0.000034,0)
      label: Number on Waitlist
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: number_on_waitlist
      _type_hint: number
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
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
      available_beds: "#079c98"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    reference_lines: []
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city, intakes]
    hidden_points_if_no: []
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
    show_null_points: true
    interpolation: linear
    listen:
      Region: ortho_facilities.city
    row: 77
    col: 0
    width: 8
    height: 9
  - title: 'Time Spent on Waitlist (Days) '
    name: 'Time Spent on Waitlist (Days) '
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases, ortho_facilities.city]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Intakes
      value_format:
      value_format_name: decimal_0
      calculation_type: running_total
      table_calculation: intakes
      args:
      - ortho_procedures.total_procedural_charges
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        substring(
          ${ortho_npi_facts.facility_name},
          0,
          position(${ortho_npi_facts.facility_name},"Facility")-1
        )
      label: Sites
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: sites
      _type_hint: string
    - category: table_calculation
      expression: round(${intakes}*0.0000039,0)
      label: Time Spent on Waitlist
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: time_spent_on_waitlist
      _type_hint: number
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
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
      available_beds: "#079c98"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#EA4335"}, {reference_type: line, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#80868B"}, {reference_type: line, line_value: min,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#7CB342"}]
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases, ortho_procedures.total_procedural_charges,
      ortho_npi_facts.facility_name, ortho_facilities.city, intakes]
    hidden_points_if_no: []
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
    show_null_points: true
    interpolation: linear
    listen:
      Region: ortho_facilities.city
    row: 77
    col: 8
    width: 8
    height: 9
  filters:
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_facilities.city
  - name: Actual Start Month
    title: Actual Start Month
    type: field_filter
    default_value: 2020/01/01 to 2021/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_procedures.actual_start_month

---
- dashboard: 1_healthcare_operations__ortho_copy
  title: "(1) Healthcare Operations - Ortho (copy)"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: zAbJTErhRf2r8b6CgM302y
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
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
    point_style: circle
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
        reverse: false
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 47
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 10
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 10
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 2
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 2
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Number of Cases
    name: Number of Cases
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'Yes'
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
    single_value_title: Total Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 3
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 3
    width: 3
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 18
    width: 3
    height: 4
  - title: Facility Late Start Comparisons
    name: Facility Late Start Comparisons
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_facilities.facility,
      ortho_procedures.count_cases]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.count_cases
        desc 2]
    limit: 10
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Payer: ortho_payer.payer_type
    row: 47
    col: 8
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    defaults_version: 1
    hidden_fields: []
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 0
    width: 8
    height: 9
  - title: Top 10 Facility Volume and Charges
    name: Top 10 Facility Volume and Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases]
    sorts: [ortho_procedures.total_procedural_charges desc]
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      ortho_procedures.total_procedural_charges: scatter
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 16
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    "y": ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
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
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 4
    col: 9
    width: 3
    height: 2
  - title: No Show Rate Monthly Trend by Facility
    name: No Show Rate Monthly Trend by Facility
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 10
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Payer
    title: Payer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_payer.payer_type
  - name: Supplier
    title: Supplier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_supplier_preferences.supplier_name

---
- dashboard: 1_healthcare_operations__ortho_copy
  title: "(1) Healthcare Operations - Ortho (copy)"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bqcoJcNy7opn7wpboeODJa
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
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
    point_style: circle
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
        reverse: false
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 47
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 10
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 10
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 2
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 2
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Number of Cases
    name: Number of Cases
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'Yes'
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
    single_value_title: Total Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 3
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 3
    width: 3
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 18
    width: 3
    height: 4
  - title: Facility Late Start Comparisons
    name: Facility Late Start Comparisons
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_facilities.facility,
      ortho_procedures.count_cases]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.count_cases
        desc 2]
    limit: 10
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Payer: ortho_payer.payer_type
    row: 47
    col: 8
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_google_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    defaults_version: 0
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 0
    width: 8
    height: 9
  - title: Top 10 Facility Volume and Charges
    name: Top 10 Facility Volume and Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases]
    sorts: [ortho_procedures.total_procedural_charges desc]
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      ortho_procedures.total_procedural_charges: scatter
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 16
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    "y": ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
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
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 4
    col: 9
    width: 3
    height: 2
  - title: No Show Rate Monthly Trend by Facility
    name: No Show Rate Monthly Trend by Facility
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 10
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Payer
    title: Payer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_payer.payer_type
  - name: Supplier
    title: Supplier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_supplier_preferences.supplier_name

---
- dashboard: 1_healthcare_operations__ortho_oscar
  title: "(1) Healthcare Operations - Ortho (Oscar)"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: sFJo3UBecd43G5BTR14X9G
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
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
    point_style: circle
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
        reverse: false
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 47
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 10
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 10
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 2
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 2
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Number of Cases
    name: Number of Cases
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'Yes'
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
    single_value_title: Total Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 3
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 3
    width: 3
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 18
    width: 3
    height: 4
  - title: Facility Late Start Comparisons
    name: Facility Late Start Comparisons
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_facilities.facility,
      ortho_procedures.count_cases]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.count_cases
        desc 2]
    limit: 10
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Payer: ortho_payer.payer_type
    row: 47
    col: 8
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    defaults_version: 1
    hidden_fields: []
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 0
    width: 8
    height: 9
  - title: Top 10 Facility Volume and Charges
    name: Top 10 Facility Volume and Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases]
    sorts: [ortho_procedures.total_procedural_charges desc]
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
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      ortho_procedures.total_procedural_charges: scatter
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 16
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    "y": ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
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
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 4
    col: 9
    width: 3
    height: 2
  - title: No Show Rate Monthly Trend by Facility
    name: No Show Rate Monthly Trend by Facility
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 10
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Payer
    title: Payer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_payer.payer_type
  - name: Supplier
    title: Supplier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_supplier_preferences.supplier_name

---
- dashboard: 2_healthcare_operations__ortho_facilities
  title: "(2) Healthcare Operations - Ortho Facilities"
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  preferred_slug: hCAzULJeXdkyDxGYZgJBLx
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <p><center>
      <b>
      <font size="6">
      <font color="black">
      <span class='fa fa-building'></span> Facility Deep Dive
      <p>
      <a href="https://demoexpo.looker.com/dashboards/615" type="button" class="btn btn-primary btn-lg btn-block"><font size="2"><font color="white">Navigate to Back to Overview</font>
    row: 0
    col: 2
    width: 20
    height: 3
  - title: Provider MGMA Ranking Distribution
    name: Provider MGMA Ranking Distribution
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.count, ortho_npi_facts.npi_rank_tier]
    fill_fields: [ortho_npi_facts.npi_rank_tier]
    sorts: [ortho_npi_facts.npi_rank_tier]
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Provider Count, orientation: left, series: [{axisId: ortho_npi_facts.count,
            id: ortho_npi_facts.count, name: Ortho Provider Facts}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: MGMA Provider Ranking
    trellis_rows: 5
    series_colors:
      ortho_npi_facts.count: "#4285F4"
    series_labels:
      ortho_npi.count: Count of Providers
    reference_lines: []
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 9
    col: 12
    width: 10
    height: 8
  - title: Facility Name
    name: Facility Name
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_npi_facts.facility_name]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5F6368"
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
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
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 3
    col: 2
    width: 20
    height: 2
  - title: Provider Count
    name: Provider Count
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_npi_facts.count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_npi_rank
      based_on: ortho_npi_facts.npi_rank
      expression: ''
      label: Average of Npi Rank
      type: average
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
    single_value_title: Number of Providers
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 5
    col: 10
    width: 4
    height: 2
  - title: Case Count
    name: Case Count
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_npi_rank
      based_on: ortho_npi_facts.npi_rank
      expression: ''
      label: Average of Npi Rank
      type: average
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
    single_value_title: Number of Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 5
    col: 2
    width: 4
    height: 2
  - title: Provider MGMA Ranking Detail
    name: Provider MGMA Ranking Detail
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_scatter
    fields: [ortho_npi_facts.npi, ortho_npi_facts.npi_rank, ortho_procedures.total_procedural_charges,
      ortho_encounters.count]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_average_of_w_rvu
      based_on: ortho_npi_facts.average_of_w_rvu
      expression: ''
      label: Average of Average of W Rvu
      type: average
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Total Cases, orientation: left, series: [{axisId: ortho_encounters.count,
            id: ortho_encounters.count, name: Ortho Encounters}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: MGMA Provider Rank
    size_by_field: ortho_procedures.total_procedural_charges
    series_colors:
      average_of_average_of_w_rvu: "#185ABC"
      ortho_procedures.total_procedural_charges: "#EA4335"
      ortho_encounters.count: "#FBBC04"
    series_labels:
      average_of_average_of_w_rvu: w RVUs
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ortho_npi_facts.npi]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 17
    col: 12
    width: 10
    height: 8
  - title: Provider Ranking Metrics (MGMA)
    name: Provider Ranking Metrics (MGMA)
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_npi_facts.npi_rank, average_of_average_of_w_rvu,
      ortho_procedures.total_procedural_charges]
    sorts: [ortho_npi_facts.npi desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_average_of_w_rvu
      based_on: ortho_npi_facts.average_of_w_rvu
      expression: ''
      label: Average of Average of W Rvu
      type: average
      _kind_hint: measure
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
    header_font_size: '16'
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      ortho_npi_facts.npi: Provider ID
      ortho_npi_facts.npi_rank: Provider Rank
      average_of_average_of_w_rvu: Work RVUs
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_cell_visualizations:
      ortho_encounters.count:
        is_active: true
      ortho_procedures.total_procedural_charges:
        is_active: true
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: between, value: [0, 49], background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: [ortho_npi_facts.npi_rank]},
      {type: between, value: [49, 60], background_color: "#FBBC04", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: [ortho_npi_facts.npi_rank]},
      {type: between, value: [60, 150], background_color: "#34A853", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: [ortho_npi_facts.npi_rank]}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 17
    col: 2
    width: 10
    height: 8
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_npi_rank
      based_on: ortho_npi_facts.npi_rank
      expression: ''
      label: Average of Npi Rank
      type: average
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
    single_value_title: Total Procedure Charges
    value_format: "$0.0,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 5
    col: 6
    width: 4
    height: 2
  - title: Wait Reasons Monthly Trend
    name: Wait Reasons Monthly Trend
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.count_cases,
      ortho_procedures.actual_start_month]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_payer.payer_type: ''
      ortho_procedures.actual_start_month: after 2019/09/01
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.is_no_show: 'No'
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Recovery Room\
        \ Available,-Surgeons and Anesthesiologists Arriving Late"
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.actual_start_month]
    limit: 10
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    x_axis_datetime_label: "%b '%y"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 9
    col: 2
    width: 10
    height: 8
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
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
    custom_color: "#EA4335"
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 5
    col: 14
    width: 4
    height: 2
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
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
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 5
    col: 18
    width: 4
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Facility and Provider Performance
      <p>
    row: 7
    col: 2
    width: 20
    height: 2
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: Chattanooga Facility
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Provider Performance Tiers
    title: Provider Performance Tiers
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.provider_rank_status

---
- dashboard: hospital_deep_dive
  title: "*Hospital Deep Dive"
  layout: newspaper
  description: ''
  preferred_slug: dpVoUpPaD9qBxQKxDBCzsm
  elements:
  - title: "# Observations"
    name: "# Observations"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.count]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: diff
      label: diff
      expression: "(${observation_vitals.count}-${offset})/${observation_vitals.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: offset
      label: offset
      expression: offset(${observation_vitals.count},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
    row: 9
    col: 4
    width: 4
    height: 4
  - title: "% Anomalies"
    name: "% Anomalies"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.percent_anomalies]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: diff
      label: diff
      expression: "(${observation_vitals.percent_anomalies}-${offer})/${observation_vitals.percent_anomalies}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: offer
      label: offer
      expression: offset(${observation_vitals.percent_anomalies},1)
      value_format:
      value_format_name:
      is_disabled: false
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
    row: 9
    col: 8
    width: 4
    height: 4
  - title: 15 Nurses to Focus On
    name: 15 Nurses to Focus On
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.percent_anomalies,
      observation_vitals.average_absolute_standard_deviation, practitioner.name]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 15
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", practitioner.name, observation_vitals.percent_anomalies,
      observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.average_absolute_standard_deviation]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: true
        palette:
          palette_id: d32f6a1a-d113-ba78-6775-0ecad4ef7cc5
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
      observation_vitals.count:
        is_active: false
      observation_vitals.average_absolute_standard_deviation:
        is_active: true
        palette:
          palette_id: 4b0586d3-ec97-fc32-b271-d22bd99b330e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
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
    legend_position: center
    point_style: none
    series_colors: {}
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
    listen:
      Anomaly: observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 13
    col: 0
    width: 12
    height: 7
  - title: Stats by Vitals
    name: Stats by Vitals
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.type, observation_vitals.count_anomalies, observation_vitals.count,
      observation_vitals.percent_anomalies, observation_vitals.average_absolute_standard_deviation]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", observation_vitals.type, observation_vitals.percent_anomalies,
      observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.average_absolute_standard_deviation]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
      observation_vitals.count_anomalies: "# Anomaly"
      observation_vitals.count: "# Observations"
      observation_vitals.percent_anomalies: "% Anomaly"
      observation_vitals.average_absolute_standard_deviation: Avg Stand Dev
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: true
        palette:
          palette_id: d32f6a1a-d113-ba78-6775-0ecad4ef7cc5
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
      observation_vitals.count:
        is_active: false
      observation_vitals.average_absolute_standard_deviation:
        is_active: true
        palette:
          palette_id: 4b0586d3-ec97-fc32-b271-d22bd99b330e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
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
    legend_position: center
    point_style: none
    series_colors: {}
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
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 9
    col: 12
    width: 12
    height: 4
  - title: Distribution of Vitals
    name: Distribution of Vitals
    model: healthcare
    explore: observation_vitals
    type: looker_area
    fields: [observation_vitals.type, observation_count_by_vital.percent_of_total_by_vital_type,
      observation_vitals.measurement_standard_deviation_rounded_capped]
    pivots: [observation_vitals.type]
    sorts: [observation_vitals.type 0, observation_vitals.measurement_standard_deviation_rounded_capped]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: brightview
      palette_id: brightview-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Height - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Height}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Mass Index - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Mass Index}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Weight - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Weight}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Diastolic Blood Pressure - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Diastolic Blood Pressure}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Oral temperature - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Oral temperature}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Systolic Blood Pressure - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Systolic Blood Pressure}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
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
    hidden_series: []
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 13
    col: 12
    width: 12
    height: 7
  - name: Historic Trends
    type: text
    title_text: Historic Trends
    row: 7
    col: 0
    width: 24
    height: 2
  - title: Anomalies In Past Day
    name: Anomalies In Past Day
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.count_anomalies]
    filters:
      observation_vitals.issued_hour: 48 hours
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: difff
      label: difff
      expression: "(${patient.count}-${calculation_1})/${patient.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - table_calculation: calculation_1
      label: Calculation 1
      expression: offset(${patient.count},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Anomaly: observation_vitals.anomaly
    row: 2
    col: 0
    width: 4
    height: 5
  - name: Past Day
    type: text
    title_text: Past Day
    row: 0
    col: 0
    width: 24
    height: 2
  - title: 'Error Type 1: Unit Error'
    name: 'Error Type 1: Unit Error'
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.issued_time_of_day, observation_vitals.device_manufacturer,
      observation_vitals.unit, observation_vitals.quantity, vital_fact.average]
    filters:
      observation_vitals.issued_hour: 48 hours
      observation_vitals.is_over_anomaly: 'Yes'
      observation_vitals.absolute_standard_deviation: ">15"
    sorts: [observation_vitals.issued_time_of_day]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      observation_vitals.quantity: Measurement
      vital_fact.average: Expected
      observation_vitals.device_manufacturer: Manufacturer
      observation_vitals.issued_time_of_day: Time
    series_column_widths:
      observation_vitals.unit: 100
      observation_vitals.issued_time_of_day: 100
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    listen:
      Anomaly: observation_vitals.anomaly
    row: 2
    col: 4
    width: 10
    height: 5
  - title: 'Error Type 2: Data Entry Error'
    name: 'Error Type 2: Data Entry Error'
    model: healthcare
    explore: observation_vitals
    type: looker_bar
    fields: [observation_vitals.type, observation_vitals.count_anomalies]
    pivots: [observation_vitals.type]
    filters:
      observation_vitals.issued_hour: 48 hours
      observation_vitals.absolute_standard_deviation: "<15"
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
    series_labels:
      observation_vitals.quantity: Measurement
      vital_fact.average: Expected
      observation_vitals.device_manufacturer: Manufacturer
      observation_vitals.issued_time_of_day: Time
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    listen:
      Anomaly: observation_vitals.anomaly
    row: 2
    col: 14
    width: 10
    height: 5
  - title: "# Patients"
    name: "# Patients"
    model: healthcare
    explore: realtime_observations
    type: single_value
    fields: [realtime_observations.count]
    filters:
      realtime_observations.issued_time: before 0 seconds ago
    limit: 500
    refresh: 5 secs
    listen: {}
    row: 9
    col: 0
    width: 4
    height: 4
  filters:
  - name: Hospital
    title: Hospital
    type: field_filter
    default_value: NORWOOD HOSPITAL
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: organization.name
  - name: Anomaly
    title: Anomaly
    type: field_filter
    default_value: '4'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.anomaly
  - name: Date
    title: Date
    type: field_filter
    default_value: 1 years ago for 1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.issued_year

---
- dashboard: hospital_deep_dive
  title: "*Hospital Deep Dive"
  layout: newspaper
  description: ''
  preferred_slug: P7cq5sakpZtzM0BS6KRfjY
  elements:
  - title: "# Observations"
    name: "# Observations"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.count]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: diff
      label: diff
      expression: "(${observation_vitals.count}-${offset})/${observation_vitals.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: offset
      label: offset
      expression: offset(${observation_vitals.count},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
    row: 9
    col: 4
    width: 4
    height: 4
  - title: "% Anomalies"
    name: "% Anomalies"
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.issued_year, observation_vitals.percent_anomalies]
    fill_fields: [observation_vitals.issued_year]
    filters:
      observation_vitals.issued_year: 2 years ago for 2 years
    sorts: [observation_vitals.issued_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: diff
      label: diff
      expression: "(${observation_vitals.percent_anomalies}-${offer})/${observation_vitals.percent_anomalies}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: offer
      label: offer
      expression: offset(${observation_vitals.percent_anomalies},1)
      value_format:
      value_format_name:
      is_disabled: false
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
    row: 9
    col: 8
    width: 4
    height: 4
  - title: 15 Nurses to Focus On
    name: 15 Nurses to Focus On
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.percent_anomalies,
      observation_vitals.average_absolute_standard_deviation, practitioner.name]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 15
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", practitioner.name, observation_vitals.percent_anomalies,
      observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.average_absolute_standard_deviation]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: true
        palette:
          palette_id: d32f6a1a-d113-ba78-6775-0ecad4ef7cc5
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
      observation_vitals.count:
        is_active: false
      observation_vitals.average_absolute_standard_deviation:
        is_active: true
        palette:
          palette_id: 4b0586d3-ec97-fc32-b271-d22bd99b330e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
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
    legend_position: center
    point_style: none
    series_colors: {}
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
    listen:
      Anomaly: observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 13
    col: 0
    width: 12
    height: 7
  - title: Stats by Vitals
    name: Stats by Vitals
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.type, observation_vitals.count_anomalies, observation_vitals.count,
      observation_vitals.percent_anomalies, observation_vitals.average_absolute_standard_deviation]
    filters:
      observation_vitals.issued_week: 12 months ago for 12 months
    sorts: [observation_vitals.percent_anomalies desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    column_order: ["$$$_row_numbers_$$$", observation_vitals.type, observation_vitals.percent_anomalies,
      observation_vitals.count_anomalies, observation_vitals.count, observation_vitals.average_absolute_standard_deviation]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      Body Height - observation_vitals.count_measurements: Height
      observation_vitals.count_anomalies: "# Anomaly"
      observation_vitals.count: "# Observations"
      observation_vitals.percent_anomalies: "% Anomaly"
      observation_vitals.average_absolute_standard_deviation: Avg Stand Dev
    series_cell_visualizations:
      observation_vitals.count_anomalies:
        is_active: false
      observation_vitals.percent_anomalies:
        is_active: true
        palette:
          palette_id: d32f6a1a-d113-ba78-6775-0ecad4ef7cc5
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
      observation_vitals.count:
        is_active: false
      observation_vitals.average_absolute_standard_deviation:
        is_active: true
        palette:
          palette_id: 4b0586d3-ec97-fc32-b271-d22bd99b330e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - green
          - white
          - red
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.count_measurements,
            id: observation_vitals.count_measurements, name: Number of Measurements}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
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
    legend_position: center
    point_style: none
    series_colors: {}
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
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 9
    col: 12
    width: 12
    height: 4
  - title: Distribution of Vitals
    name: Distribution of Vitals
    model: healthcare
    explore: observation_vitals
    type: looker_area
    fields: [observation_vitals.type, observation_count_by_vital.percent_of_total_by_vital_type,
      observation_vitals.measurement_standard_deviation_rounded_capped]
    pivots: [observation_vitals.type]
    sorts: [observation_vitals.type 0, observation_vitals.measurement_standard_deviation_rounded_capped]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: brightview
      palette_id: brightview-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Height - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Height}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Mass Index - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Mass Index}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Body Weight - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Body Weight}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Diastolic Blood Pressure - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Diastolic Blood Pressure}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Oral temperature - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Oral temperature}, {axisId: observation_count_by_vital.percent_of_total_by_vital_type,
            id: Systolic Blood Pressure - observation_count_by_vital.percent_of_total_by_vital_type,
            name: Systolic Blood Pressure}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
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
    hidden_series: []
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    listen:
      Hospital: organization.name
      Anomaly: observation_vitals.anomaly
      Date: observation_vitals.issued_year
    row: 13
    col: 12
    width: 12
    height: 7
  - name: Historic Trends
    type: text
    title_text: Historic Trends
    row: 7
    col: 0
    width: 24
    height: 2
  - title: Anomalies In Past Day
    name: Anomalies In Past Day
    model: healthcare
    explore: observation_vitals
    type: single_value
    fields: [observation_vitals.count_anomalies]
    filters:
      observation_vitals.issued_hour: 48 hours
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: difff
      label: difff
      expression: "(${patient.count}-${calculation_1})/${patient.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - table_calculation: calculation_1
      label: Calculation 1
      expression: offset(${patient.count},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Anomaly: observation_vitals.anomaly
    row: 2
    col: 0
    width: 4
    height: 5
  - name: Past Day
    type: text
    title_text: Past Day
    row: 0
    col: 0
    width: 24
    height: 2
  - title: 'Error Type 1: Unit Error'
    name: 'Error Type 1: Unit Error'
    model: healthcare
    explore: observation_vitals
    type: looker_grid
    fields: [observation_vitals.issued_time_of_day, observation_vitals.device_manufacturer,
      observation_vitals.unit, observation_vitals.quantity, vital_fact.average]
    filters:
      observation_vitals.issued_hour: 48 hours
      observation_vitals.is_over_anomaly: 'Yes'
      observation_vitals.absolute_standard_deviation: ">15"
    sorts: [observation_vitals.issued_time_of_day]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      observation_vitals.quantity: Measurement
      vital_fact.average: Expected
      observation_vitals.device_manufacturer: Manufacturer
      observation_vitals.issued_time_of_day: Time
    series_column_widths:
      observation_vitals.unit: 100
      observation_vitals.issued_time_of_day: 100
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    listen:
      Anomaly: observation_vitals.anomaly
    row: 2
    col: 4
    width: 10
    height: 5
  - title: 'Error Type 2: Data Entry Error'
    name: 'Error Type 2: Data Entry Error'
    model: healthcare
    explore: observation_vitals
    type: looker_bar
    fields: [observation_vitals.type, observation_vitals.count_anomalies]
    pivots: [observation_vitals.type]
    filters:
      observation_vitals.issued_hour: 48 hours
      observation_vitals.absolute_standard_deviation: "<15"
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
    series_labels:
      observation_vitals.quantity: Measurement
      vital_fact.average: Expected
      observation_vitals.device_manufacturer: Manufacturer
      observation_vitals.issued_time_of_day: Time
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Year
    listen:
      Anomaly: observation_vitals.anomaly
    row: 2
    col: 14
    width: 10
    height: 5
  - title: "# Patients"
    name: "# Patients"
    model: healthcare
    explore: realtime_observations
    type: single_value
    fields: [realtime_observations.count]
    filters:
      realtime_observations.issued_time: before 0 seconds ago
    limit: 500
    refresh: 5 secs
    listen: {}
    row: 9
    col: 0
    width: 4
    height: 4
  filters:
  - name: Hospital
    title: Hospital
    type: field_filter
    default_value: NORWOOD HOSPITAL
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: organization.name
  - name: Anomaly
    title: Anomaly
    type: field_filter
    default_value: '4'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.anomaly
  - name: Date
    title: Date
    type: field_filter
    default_value: 1 years ago for 1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_vitals
    listens_to_filters: []
    field: observation_vitals.issued_year

---
- dashboard: 18th_march
  title: 18th March
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: uCCsbp1WduVTO5grDSFA6X
  elements:
  - title: 18th March
    name: 18th March
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.count, order_items.created_date, order_items.status]
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [Complete - order_items.count]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
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

---
- dashboard: 360_marketing_overview
  title: 360 Marketing Overview
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: G4MiOegHuZcfDWSaGcYZ3U
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
- dashboard: 360_marketing_overview
  title: 360 Marketing Overview
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: FFixLIpO1yaCMe9vjWWWac
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
    query_timezone: user_timezone
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
    y_axes: []
    listen: {}
    row: 7
    col: 14
    width: 10
    height: 7
  - title: CTR over Time
    name: CTR over Time
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [adevents.total_impressions, adevents.created_date, adevents.total_clicks,
      adevents.click_rate, adevents.cost_per_click]
    fill_fields: [adevents.created_date]
    filters:
      adevents.created_date: 30 day ago for 30 day
    sorts: [adevents.created_date desc]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: adevents.total_impressions,
            id: adevents.total_impressions, name: Adevents Total Impressions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: adevents.click_rate,
            id: adevents.click_rate, name: Adevents Click Through Rate (CTR)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_types:
      adevents.click_rate: line
    series_colors:
      adevents.click_rate: "#F9AB00"
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Impressions
    comparison_label: Weekly Change
    hidden_fields: [adevents.total_clicks, adevents.cost_per_click]
    custom_color_enabled: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
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
- dashboard: 360_marketing_overview
  title: 360 Marketing Overview
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: Byd0MNWMsIbKz4HbOlsxD5
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
- dashboard: 360_marketing_overview
  title: 360 Marketing Overview
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: BFo3v4ZYiNVNkShhcuEJt9
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
- dashboard: 360_marketing_overview_copy
  title: 360 Marketing Overview (copy)
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: 44H6HTSa4Gc6VRxmvUlxtu
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
- dashboard: 360_marketing_overview_copy
  title: 360 Marketing Overview (copy)
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: D6yZcAAtf1q5ssSyO1HrLv
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
- dashboard: 360_marketing_overview_rob
  title: 360 Marketing Overview (Rob)
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: utKzg5xGhjQKQuDbUitlwX
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
    listen:
      Category: products.category
      Brand: products.brand
    row: 3
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
    listen:
      Category: products.category
      Brand: products.brand
    row: 26
    col: 13
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
    listen:
      Category: products.category
      Brand: products.brand
    row: 32
    col: 6
    width: 18
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
    row: 10
    col: 5
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
    row: 10
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
    row: 10
    col: 10
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
    col: 14
    width: 4
    height: 7
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
    row: 20
    col: 18
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
    listen:
      Category: products.category
      Brand: products.brand
    row: 20
    col: 0
    width: 12
    height: 7
  - name: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    subtitle_text: Where are our customers coming from and when do they drop off?
    row: 17
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
    col: 18
    width: 5
    height: 7
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
    row: 10
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
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: products.category
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: products.brand

---
- dashboard: 9_feb
  title: 9_Feb
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: CtKUHyYMEaeCrPlQ9OfMI8
  elements:
  - title: 9_Feb
    name: 9_Feb
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_column
    fields: [opportunity.total_amount, opportunity.created_date, opportunity.type]
    pivots: [opportunity.type]
    fill_fields: [opportunity.created_date]
    filters: {}
    sorts: [opportunity.type, opportunity.created_date desc]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Date: opportunity.created_date
    row: 5
    col: 0
    width: 13
    height: 12
  - title: Untitled
    name: Untitled
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.win_rate]
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
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 5
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.count, order_items.status]
    pivots: [order_items.status]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 14 days
      order_items.status: "-Complete"
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [Cancelled - order_items.count, Returned - order_items.count, Shipped
        - order_items.count]
    hidden_pivots: {}
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
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:
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
    model: sfdc_demo
    explore: opportunity_line_item
    listens_to_filters: []
    field: opportunity.created_date

---
- dashboard: account_lookup
  title: Account Lookup
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  preferred_slug: Fkm98FkZqB6mmArf1ftEh1
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Account Details
    name: Account Details
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_single_record
    fields: [account.account_name, account.industry, account.number_of_employees,
      account.start_date, csm.name, sales_rep.name, account.billing_email, account.next_contract_renewal_date]
    sorts: [account.start_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 3
    col: 0
    width: 5
    height: 6
  - title: Events by Type Past 90 Days
    name: Events by Type Past 90 Days
    model: sfdc_demo
    explore: daily_user_count
    type: looker_area
    fields: [daily_client_usage.sum_model_events, daily_client_usage.sum_explore_events,
      daily_client_usage.sum_dashboard_events, daily_user_count.event_date]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 90 days
    sorts: [daily_user_count.event_date desc]
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
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_labels:
      daily_client_usage.sum_model_events: Model Events
      daily_client_usage.sum_explore_events: Explore Events
      daily_client_usage.sum_dashboard_events: Dashboard Events
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 42
    col: 0
    width: 12
    height: 6
  - title: DailyUsers by Type Past 90 Days
    name: DailyUsers by Type Past 90 Days
    model: sfdc_demo
    explore: daily_user_count
    type: looker_area
    fields: [daily_user_count.event_date, daily_client_usage.average_dashboard_users,
      daily_client_usage.average_explore_users, daily_client_usage.average_model_users]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 90 days
    sorts: [daily_user_count.event_date desc]
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
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_labels:
      daily_client_usage.sum_model_events: Model Events
      daily_client_usage.sum_explore_events: Explore Events
      daily_client_usage.sum_dashboard_events: Dashboard Events
      daily_client_usage.average_dashboard_users: Dashboard Users
      daily_client_usage.average_explore_users: Explore Users
      daily_client_usage.average_model_users: Model Users
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 36
    col: 0
    width: 12
    height: 6
  - name: Account Overview
    type: text
    title_text: Account Overview
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Product Usage
    type: text
    title_text: Product Usage
    row: 20
    col: 0
    width: 24
    height: 4
  - title: Daily Sessions (Past 30 Days)
    name: Daily Sessions (Past 30 Days)
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_user_count.event_date, daily_client_sessions.total_sessions, daily_client_sessions.median_session_duration]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 30 days
    sorts: [daily_user_count.event_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_client_sessions.total_sessions,
            id: daily_client_sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: daily_client_sessions.median_session_duration,
            id: daily_client_sessions.median_session_duration, name: Median Session
              Duration}], showLabels: true, showValues: true, minValue: 0, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: daily_client_sessions.median_session_duration
    series_types:
      daily_client_sessions.median_session_duration: scatter
    series_colors:
      daily_client_sessions.median_session_duration: "#75E2E2"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 36
    col: 12
    width: 12
    height: 12
  - title: "% of Named Users Active"
    name: "% of Named Users Active"
    model: sfdc_demo
    explore: daily_user_count
    type: looker_line
    fields: [daily_client_usage.average_percent_active_users, daily_user_count.event_date]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 6 months
    sorts: [daily_client_usage.average_percent_active_users desc]
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    hidden_series: []
    series_point_styles:
      daily_client_usage.average_percent_active_users: auto
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#72D16D",
        range_start: '1', range_end: ".7", label: Good Usage}]
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 24
    col: 0
    width: 24
    height: 12
  - title: Average NPS Score
    name: Average NPS Score
    model: sfdc_demo
    explore: daily_user_count
    type: single_value
    fields: [account.nps_score]
    filters:
      daily_user_count.event_date: 30 days
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
    listen:
      Account Name: account.account_name
    row: 17
    col: 0
    width: 5
    height: 3
  - title: Current ACV
    name: Current ACV
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.total_amount]
    filters:
      opportunity.is_active_contract: 'Yes'
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
    comparison_label: Won Opportunities
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 3
    col: 5
    width: 5
    height: 4
  - title: NRR
    name: NRR
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.closed_won_nrr, opportunity_line_item.number_ps_engagements]
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
    comparison_label: PS Engagements
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
      Account Name: account.account_name
    row: 13
    col: 0
    width: 5
    height: 4
  - title: Open Opportunities
    name: Open Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.count]
    filters:
      opportunity.stage_name: "-Closed Won,-Closed Lost"
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 7
    col: 5
    width: 5
    height: 2
  - title: ARR Growth
    name: ARR Growth
    model: sfdc_demo
    explore: daily_active_accounts
    type: looker_area
    fields: [daily_active_accounts.calendar_date, daily_active_accounts.total_active_arr]
    fill_fields: [daily_active_accounts.calendar_date]
    sorts: [daily_active_accounts.calendar_date desc]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_accounts.total_active_arr,
            id: daily_active_accounts.total_active_arr, name: Total ARR Active Today}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    trend_lines: []
    defaults_version: 1
    ordering: none
    show_null_labels: false
    listen:
      Account Name: account.account_name
    row: 3
    col: 10
    width: 14
    height: 6
  - name: Account Activity
    type: text
    title_text: Account Activity
    row: 9
    col: 0
    width: 24
    height: 4
  - title: Overall Health Score
    name: Overall Health Score
    model: sfdc_demo
    explore: daily_user_count
    type: looker_line
    fields: [daily_user_count.average_health_score, daily_user_count.event_week]
    fill_fields: [daily_user_count.event_week]
    filters:
      daily_user_count.event_date: 6 months
    sorts: [daily_user_count.event_week desc]
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
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_user_count.average_health_score,
            id: daily_user_count.average_health_score, name: Average Health Score}],
        showLabels: false, showValues: false, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        range_start: '0', label: At Risk, range_end: '3'}, {reference_type: range,
        line_value: mean, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#FFD95F", range_start: '3', range_end: '4',
        label: Fair}, {reference_type: range, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#72D16D", line_value: '4',
        label: Good, range_end: '4', range_start: '5'}]
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 13
    col: 10
    width: 14
    height: 7
  - title: Chats Past 30 Days
    name: Chats Past 30 Days
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.urgent_tickets]
    filters:
      ticket.created_date: 30 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Urgent Tickets
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 13
    col: 5
    width: 5
    height: 4
  - title: Average CSAT
    name: Average CSAT
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [satisfaction_ratings.average_csat]
    filters:
      ticket.created_date: 30 days
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
    conditional_formatting: [{type: greater than, value: 3.4, background_color: '',
        font_color: "#72D16D", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 3.1, background_color: '',
        font_color: "#E57947", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 17
    col: 5
    width: 5
    height: 3
  filters:
  - name: Account Name
    title: Account Name
    type: field_filter
    default_value: Schonfeld Financial Services
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: sfdc_demo
    explore: daily_user_count
    listens_to_filters: []
    field: account.account_name

---
- dashboard: action_demo
  title: Action demo
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: WQl2KrHUlbU2mfIPAWzImZ
  elements:
  - title: Action demo
    name: Action demo
    model: thelook
    explore: order_items
    type: looker_bar
    fields: [products.category, order_items.total_gross_margin_percentage]
    filters: {}
    sorts: [order_items.total_gross_margin_percentage desc 0]
    limit: 12
    column_limit: 50
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 11
    width: 13
    height: 9
  - title: Last Month Revenue
    name: Last Month Revenue
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_margin]
    filters: {}
    limit: 5000
    column_limit: 50
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Monthly Revenue last month
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 9
    width: 15
    height: 2
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 11
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: this year
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
- dashboard: activity
  title: activity
  layout: newspaper
  preferred_slug: SsyuYwbVhasXdjbssN9oH9

---
- dashboard: address_deepdive
  title: Address Deep-dive
  layout: newspaper
  description: ''
  preferred_slug: 3OmU04xQdYtSVeq2Kf2GIj
  elements:
  - title: Location
    name: Location
    model: retail_block_model
    explore: transactions
    type: looker_map
    fields: [customers.location]
    filters:
      transactions.transaction_date: 720 days
    sorts: [customers.location]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: traffic_day
    map_position: fit_data
    map_zoom: 20
    map_scale_indicator: metric_imperial
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
    listen:
      Address: customers.address
    row: 4
    col: 0
    width: 8
    height: 6
  - title: Address Street View
    name: Address Street View
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [customers.address_street_view]
    filters:
      transactions.transaction_date: 720 days
    sorts: [customers.address_street_view]
    limit: 500
    column_limit: 50
    listen:
      Address: customers.address
    row: 4
    col: 8
    width: 16
    height: 10
  - title: Registered customers at this address
    name: Registered customers at this address
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [customers.address_comparison, transactions__line_items.number_of_customers_per_address]
    filters:
      transactions.transaction_date: 720 days
    sorts: [customers.address_comparison]
    limit: 500
    dynamic_fields:
    - table_calculation: vs_average
      label: vs Average
      expression: "${transactions__line_items.number_of_customers_per_address}-if(is_null(offset(${transactions__line_items.number_of_customers_per_address},1)),0,offset(${transactions__line_items.number_of_customers_per_address},1))"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs Average
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#5A30C2",
        font_color: !!null '', color_application: {collection_id: retailer-scheme,
          palette_id: retailer-scheme-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [customers.address_comparison]
    listen:
      Address: customers.address_comparison_filter
    row: 10
    col: 0
    width: 8
    height: 4
  - title: Order Pattern
    name: Order Pattern
    model: retail_block_model
    explore: transactions
    type: looker_line
    fields: [transactions.transaction_date, transactions__line_items.total_quantity,
      transactions__line_items.total_sales]
    fill_fields: [transactions.transaction_date]
    sorts: [transactions.transaction_date desc]
    limit: 500
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      custom:
        id: fb62237b-4172-a396-b394-be13521b401d
        label: Custom
        type: discrete
        colors:
        - "#5A30C2"
        - "#9d81e6"
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: transactions__line_items.total_quantity,
            id: transactions__line_items.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: transactions__line_items.total_sales,
            id: transactions__line_items.total_sales, name: Total Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
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
    series_types:
      transactions__line_items.total_quantity: scatter
      transactions__line_items.total_sales: column
    point_style: circle_outline
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    listen:
      Address: customers.address
      Date Range: transactions.transaction_date
    row: 14
    col: 0
    width: 12
    height: 8
  - title: Most Ordered Items
    name: Most Ordered Items
    model: retail_block_model
    explore: transactions
    type: looker_grid
    fields: [transactions__line_items.total_quantity, transactions__line_items.average_item_price,
      products.name, products.product_image, products.category]
    sorts: [transactions__line_items.total_quantity desc]
    limit: 500
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    series_cell_visualizations:
      transactions__line_items.total_quantity:
        is_active: true
        palette:
          palette_id: b8916b58-92d8-1cc3-f7a2-03bbcbc3635d
          collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
          custom_colors:
          - "#ffffff"
          - "#9d81e6"
          - "#5A30C2"
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: transactions__line_items.total_quantity,
            id: transactions__line_items.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: transactions__line_items.total_sales,
            id: transactions__line_items.total_sales, name: Total Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    listen:
      Address: customers.address
      Date Range: transactions.transaction_date
    row: 14
    col: 12
    width: 12
    height: 8
  - name: "<span class='fa fa-map-pin'> Address Overview</span>"
    type: text
    title_text: "<span class='fa fa-map-pin'> Address Overview</span>"
    subtitle_text: <font color="#5b30c2">Are there any strange patterns happening
      at this address?</font>
    body_text: |-
      <center><strong>Recommended Action ?</strong>
      Check if the address does not look residential, or has an abnormally high number of registered customers or volume. If so, set up a regular alert to monitor it, and alert the fraud team if the pattern continues ?.</center>
    row: 0
    col: 0
    width: 24
    height: 4
  filters:
  - name: Address
    title: Address
    type: field_filter
    default_value: '"1909 W 95th St, Chicago, IL 60643, United States"'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_block_model
    explore: transactions
    listens_to_filters: []
    field: customers.address
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover

---
- dashboard: admin_test
  title: Admin test
  layout: newspaper
  preferred_slug: 0JJm1ZdyObAdLttznVzGLP
