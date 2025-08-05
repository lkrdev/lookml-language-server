---
- dashboard: for_jam_analysis
  title: for Jam analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: NKPDWdhlI66wlq9iIangPk
  elements:
  - title: for Jam analysis
    name: for Jam analysis
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
    width: 24
    height: 12

---
- dashboard: for_jds_team
  title: for JD's team
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: QjM9bWdj6vc1lnjP6BhUDU
  elements:
  - title: for JD's team
    name: for JD's team
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
    height: 8
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
- dashboard: for_marketing_team_analysis_3
  title: for marketing team analysis 3
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: eZWYAprt3iyH85w38RBDlI
  elements:
  - title: for marketing team analysis 3
    name: for marketing team analysis 3
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
    width: 10
    height: 8
  - title: New Tile
    name: New Tile
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
    col: 10
    width: 9
    height: 8
  - title: New Tile
    name: New Tile (2)
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
    row: 8
    col: 0
    width: 20
    height: 7

---
- dashboard: for_marketing_team2
  title: for marketing team2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 2kEumXvF4qlkEhIxxwbXmr
  elements:
  - title: top customers
    name: top customers
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.email, user_order_facts.lifetime_revenue, user_order_facts.latest_order_date]
    filters: {}
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
    listen:
      Latest Orders: user_order_facts.latest_order_date
    row: 0
    col: 0
    width: 9
    height: 8
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
- dashboard: for_myself
  title: for myself
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ZYAtyBnogf3EoihDeSiIVz
  elements:
  - title: for myself
    name: for myself
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
    width: 16
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
- dashboard: for_ryan
  title: for Ryan
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: q7il4VtLOliRbKhwjzKY8s
  elements:
  - title: Top 10 spending customers
    name: Top 10 spending customers
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

---
- dashboard: for_sales_people
  title: for sales people
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JA0PaYxRbeAetcHVcFZxmf
  elements:
  - title: top customers
    name: top customers
    model: thelook
    explore: order_items
    type: looker_map
    fields: [users.state, users.age, user_order_facts.lifetime_revenue, user_order_facts.lifetime_orders]
    filters: {}
    sorts: [user_order_facts.lifetime_revenue desc]
    limit: 500
    column_limit: 50
    listen:
      Repeat Customer (Yes / No): user_order_facts.repeat_customer
      Latest Orders: user_order_facts.latest_order_date
    row: 0
    col: 0
    width: 13
    height: 7
  filters:
  - name: Repeat Customer (Yes / No)
    title: Repeat Customer (Yes / No)
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: user_order_facts.repeat_customer
  - name: Latest Orders
    title: Latest Orders
    type: field_filter
    default_value: 18 months
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
- dashboard: for_testing_marketing_team
  title: for testing marketing team
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8a6i76TDHmgBhGYqN9SKD4
  elements:
  - title: for testing marketing team
    name: for testing marketing team
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
    height: 8
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
- dashboard: fun_new_dashboard
  title: Fun new dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: pMTlPtAS3liQLtk7jgQi3F
  elements:
  - title: Fun new dashboard
    name: Fun new dashboard
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.count, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters: {}
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
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      order_items.count: "#bf4f25"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
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
- dashboard: ga4_sample_reports
  title: GA4 sample reports
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Win4MTNKAs9umOBu9Or9lb
  elements:
  - title: Page flow report
    name: Page flow report
    model: ga4
    explore: sessions
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [events.page_path_1, events.page_path_2, events.page_path_3, events.page_path_4,
      events.page_path_5, events.has_completed_goal, events.total_page_views]
    filters:
      sessions.session_date: 2020/11/01 to 2021/02/01
    sorts: [events.total_page_views desc]
    limit: 20
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3", "#36c1b3",
      "#b57052", "#ed69af"]
    label_type: name
    show_null_points: false
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
    show_dropoff: true
    defaults_version: 0
    y_axes: []
    hidden_pivots: {}
    listen:
      Page Path 1: events.page_path_1
      Event Name: events.event_name_goal_selection
    row: 0
    col: 0
    width: 24
    height: 10
  - title: Event flow report
    name: Event flow report
    model: ga4
    explore: sessions
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [events.event_path_1, events.event_path_2, events.event_path_3, events.event_path_4,
      events.event_path_5, events.has_completed_goal, events.total_page_views]
    filters:
      sessions.session_date: 2020/11/01 to 2021/02/01
    sorts: [events.total_page_views desc]
    limit: 20
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
    trellis: row
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
    show_dropoff: true
    defaults_version: 0
    y_axes: []
    hidden_pivots: {}
    listen:
      Page Path 1: events.page_path_1
      Event Name: events.event_name_goal_selection
    row: 10
    col: 0
    width: 24
    height: 9
  filters:
  - name: Page Path 1
    title: Page Path 1
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: events.page_path_1
  - name: Event Name
    title: Event Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: events.event_name_goal_selection

---
- dashboard: game_monetization
  title: Game Monetization
  layout: newspaper
  description: ''
  preferred_slug: TB2xb5rP4kh60hgHPZKepV
  elements:
  - name: "<span class='fa fa-coffee'> Ad Revenue </span>"
    type: text
    title_text: "<span class='fa fa-coffee'> Ad Revenue </span>"
    subtitle_text: Are we doing well monetizing with ads while not affecting gameplay?
    row: 18
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-credit-card'> IAP Revenue </span>"
    type: text
    title_text: "<span class='fa fa-credit-card'> IAP Revenue </span>"
    subtitle_text: Are users finding our in-app products attractive?
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-usd'> Monetization </span>"
    type: text
    title_text: "<span class='fa fa-usd'> Monetization </span>"
    subtitle_text: "<p> Are we building a sustainable business? </p>"
    row: 0
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
  - title: ARPDAU - Ads
    name: ARPDAU - Ads
    model: gaming
    explore: events
    type: single_value
    fields: [events.average_ad_revenue_per_user, events.event_date]
    fill_fields: [events.event_date]
    limit: 500
    dynamic_fields:
    - table_calculation: arpdau_ads
      label: ARPDAU - Ads
      expression: mean(${events.average_ad_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    hidden_fields: [events.average_ad_revenue_per_user]
    note_state: collapsed
    note_display: hover
    note_text: Average Revenue Per Daily Active User - for ad revenue only
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
  - title: Revenue After UA
    name: Revenue After UA
    model: gaming
    explore: events
    type: looker_column
    fields: [events.event_date, events.total_revenue, events.total_install_spend]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: ua
      label: UA
      expression: "${events.total_install_spend} * -1"
      value_format:
      value_format_name: usd_0
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
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
    hidden_fields: [events.total_install_spend]
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
  - title: Revenue after UA
    name: Revenue after UA
    model: gaming
    explore: events
    type: single_value
    fields: [events.total_revenue_after_UA]
    limit: 500
    note_state: collapsed
    note_display: hover
    note_text: Revenue after UA (Revenue - Marketing Spend)
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
  - title: ARPDAU - IAP
    name: ARPDAU - IAP
    model: gaming
    explore: events
    type: single_value
    fields: [events.average_iap_revenue_per_user, events.event_date]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    dynamic_fields:
    - table_calculation: arpdau_iap
      label: ARPDAU - IAP
      expression: mean(${events.average_iap_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    hidden_fields: [events.average_iap_revenue_per_user]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Average Revenue Per Daily Active User - for in-app purchases revenue
      only
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
  - title: IAP/Ad Revenue per Player
    name: IAP/Ad Revenue per Player
    model: gaming
    explore: events
    type: looker_column
    fields: [events.event_date, events.average_ad_revenue_per_user, events.average_iap_revenue_per_user]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.average_ad_revenue_per_user,
            id: events.average_ad_revenue_per_user, name: ARPU - Ads}, {axisId: events.average_iap_revenue_per_user,
            id: events.average_iap_revenue_per_user, name: ARPU - IAP}], showLabels: true,
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    series_colors: {}
    series_labels:
      events.number_of_users: Active Users
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
  - title: LTV (0-7 days) Per Country
    name: LTV (0-7 days) Per Country
    model: gaming
    explore: events
    type: looker_column
    fields: [events.retention_day, events.average_revenue_per_user, events.cost_per_install,
      events.country]
    pivots: [events.country]
    filters:
      events.retention_day: "<=7"
      top_countries.is_top_10_country: 'Yes'
    sorts: [events.country 0, events.retention_day]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: ltv_total
      label: LTV - Total
      expression: running_total(${events.average_revenue_per_user})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: less_than_cpi
      label: Less than CPI
      expression: if(${ltv_total} < ${cpi},${ltv_total},null)
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: more_than_cpi
      label: More than CPI
      expression: if(${ltv_total} >= ${cpi},${ltv_total},null)
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cpi
      label: CPI
      expression: running_total(${events.cost_per_install})
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
    trellis: pivot
    stacking: normal
    limit_displayed_rows: false
    legend_position: left
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
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: events.total_revenue, name: Total
              Revenue, axisId: events.total_revenue}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{id: ltv, name: LTV, axisId: ltv}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Days since start (0-7)
    hide_legend: true
    trellis_rows: 5
    series_colors:
      Brazil - less_than_1: "#FFEB3B"
      Brazil - more_than_1: "#4CAF50"
      France - less_than_1: "#FFEB3B"
      France - more_than_1: "#4CAF50"
      Germany - less_than_1: "#FFEB3B"
      Germany - more_than_1: "#4CAF50"
      Mexico - more_than_1: "#4CAF50"
      Mexico - less_than_1: "#FFEB3B"
      Poland - less_than_1: "#FFEB3B"
      Poland - more_than_1: "#4CAF50"
      Russia - less_than_1: "#FFEB3B"
      Russia - more_than_1: "#4CAF50"
      Turkey - less_than_1: "#FFEB3B"
      Turkey - more_than_1: "#4CAF50"
      United Kingdom - less_than_1: "#FFEB3B"
      United Kingdom - more_than_1: "#4CAF50"
      United States - more_than_1: "#4CAF50"
      United States - less_than_1: "#FFEB3B"
      Vietnam - less_than_1: "#FFEB3B"
      Vietnam - more_than_1: "#4CAF50"
      Brazil - less_than_cpi: "#CDDC39"
      Brazil - more_than_cpi: "#009688"
      France - less_than_cpi: "#CDDC39"
      Germany - less_than_cpi: "#CDDC39"
      Germany - more_than_cpi: "#009688"
      Mexico - less_than_cpi: "#CDDC39"
      Mexico - more_than_cpi: "#009688"
      Poland - less_than_cpi: "#CDDC39"
      Poland - more_than_cpi: "#009688"
      Russia - less_than_cpi: "#CDDC39"
      Russia - more_than_cpi: "#009688"
      Turkey - less_than_cpi: "#CDDC39"
      Turkey - more_than_cpi: "#009688"
      United Kingdom - less_than_cpi: "#CDDC39"
      United Kingdom - more_than_cpi: "#009688"
      United States - less_than_cpi: "#CDDC39"
      United States - more_than_cpi: "#009688"
      Vietnam - less_than_cpi: "#CDDC39"
      Vietnam - more_than_cpi: "#009688"
    reference_lines: []
    show_null_points: true
    interpolation: linear
    hidden_fields: [events.average_revenue_per_user, ltv_total, events.cost_per_install,
      cpi]
    note_state: collapsed
    note_display: hover
    note_text: How long does it take to make our CPI back?
    defaults_version: 1
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 31
    col: 0
    width: 24
    height: 11
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
    row: 11
    col: 10
    width: 7
    height: 2
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
    row: 2
    col: 0
    width: 8
    height: 7
  - title: IAP Purchase Sizes
    name: IAP Purchase Sizes
    model: gaming
    explore: events
    type: looker_scatter
    fields: [events.iap_purchase_tier, events.total_iap_revenue, events.number_of_iap_purchases]
    filters:
      events.iap_purchase_tier: "-Below 0,-Undefined"
    sorts: [events.iap_purchase_tier]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - table_calculation: of_total
      label: "% of total"
      expression: "${events.total_iap_revenue}/ ${events.total_iap_revenue:total}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: events.total_iap_revenue,
            id: events.total_iap_revenue, name: Total IAP Revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: of_total,
            id: of_total, name: "% of total"}], showLabels: true, showValues: true,
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
    size_by_field: events.number_of_iap_purchases
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    point_style: circle
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
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 11
    col: 0
    width: 10
    height: 7
  - title: Transactions per Spender
    name: Transactions per Spender
    model: gaming
    explore: events
    type: single_value
    fields: [events.transactions_per_spender]
    limit: 500
    column_limit: 50
    hidden_fields: []
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 11
    col: 17
    width: 7
    height: 2
  - title: Retaining Spenders
    name: Retaining Spenders
    model: gaming
    explore: events
    type: looker_column
    fields: [events.retention_day, events.percent_spenders, events.total_iap_revenue]
    filters:
      events.retention_day: "<=70"
    sorts: [events.retention_day]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: total_iap_revenue
      label: Total IAP Revenue
      expression: running_total(${events.total_iap_revenue})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: events.percent_spenders,
            id: events.percent_spenders, name: Percent Spenders}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: total_iap_revenue,
            id: total_iap_revenue, name: Total IAP Revenue}], showLabels: true, showValues: true,
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
    stacking: ''
    limit_displayed_rows: false
    hidden_series: [transactions_per_spender]
    legend_position: center
    series_types:
      total_iap_revenue: line
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [events.total_iap_revenue]
    note_state: expanded
    note_display: hover
    note_text: The "whales" don't become whales for a long time
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 13
    col: 10
    width: 14
    height: 5
  - title: Revenue per Ad Shown
    name: Revenue per Ad Shown
    model: gaming
    explore: events
    type: looker_map
    fields: [events.country, events.number_of_ads_shown, events.total_ad_revenue]
    filters:
      events.number_of_ads_shown: ">1000"
    sorts: [revenue_per_ad_shown desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: revenue_per_ad_shown
      label: Revenue per Ad Shown
      expression: "${events.total_ad_revenue}/${events.number_of_ads_shown}"
      value_format: "$#.000"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 52.70468296296837
    map_longitude: 23.807373046875004
    map_zoom: 1
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
    map_value_colors: ["#8BC34A"]
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    hidden_fields: [events.total_ad_revenue, events.number_of_ads_shown]
    note_state: expanded
    note_display: hover
    note_text: Where are networks paying the most for the ads we show in the app?
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 20
    col: 0
    width: 10
    height: 9
  - title: Revenue per Ad
    name: Revenue per Ad
    model: gaming
    explore: events
    type: single_value
    fields: [events.number_of_ads_shown, events.total_ad_revenue]
    filters:
      events.number_of_ads_shown: ">1000"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: revenue_per_ad_shown
      label: Revenue per Ad Shown
      expression: "${events.total_ad_revenue}/${events.number_of_ads_shown}"
      value_format: "$0.000"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 52.70468296296837
    map_longitude: 23.807373046875004
    map_zoom: 1
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
    map_value_colors: ["#8BC34A"]
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    hidden_fields: [events.total_ad_revenue, events.number_of_ads_shown]
    note_state: expanded
    note_display: hover
    note_text: Each ad played is an annoyance for a player - are we getting the most
      value out of it?
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 20
    col: 10
    width: 8
    height: 2
  - title: Ads Per Session
    name: Ads Per Session
    model: gaming
    explore: events
    type: single_value
    fields: [events.number_of_ads_shown, events.number_of_sesssions]
    filters:
      events.number_of_ads_shown: ">1000"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: ads_per_session
      label: Ads per Session
      expression: "${events.number_of_ads_shown}/${events.number_of_sesssions}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 52.70468296296837
    map_longitude: 23.807373046875004
    map_zoom: 1
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
    map_value_colors: ["#8BC34A"]
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    hidden_fields: [events.number_of_ads_shown, events.number_of_sesssions]
    note_state: expanded
    note_display: hover
    note_text: Are we inundating players with ads?
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 20
    col: 18
    width: 6
    height: 2
  - name: "<span class='fa fa-money'> CPI Recovery </span>"
    type: text
    title_text: "<span class='fa fa-money'> CPI Recovery </span>"
    subtitle_text: How quickly are we recovering our marketing costs?
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 2
  - title: Revenue by Network
    name: Revenue by Network
    model: gaming
    explore: events
    type: table
    fields: [events.number_of_ads_shown, events.total_ad_revenue, events.ad_network]
    filters:
      events.number_of_ads_shown: ">1000"
    sorts: [revenue_per_ad_shown desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: revenue_per_ad_shown
      label: Revenue per Ad Shown
      expression: "${events.total_ad_revenue}/${events.number_of_ads_shown}"
      value_format: "$0.000"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: [revenue_per_ad_shown]}, {type: along a scale...,
        value: !!null '', background_color: "#3EB0D5", font_color: !!null '', color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688,
          options: {steps: 5, constraints: {mid: {type: middle}}, reverse: true, mirror: false}},
        bold: false, italic: false, strikethrough: false, fields: [events.number_of_ads_shown]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 52.70468296296837
    map_longitude: 23.807373046875004
    map_zoom: 1
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
    map_value_colors: ["#8BC34A"]
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    hidden_fields:
    note_state: expanded
    note_display: hover
    note_text: Each ad played is an annoyance for a player - are we getting the most
      value out of it?
    listen:
      Date Range: events.event_date
      Drill Down: events.drill_by
      Platform: events.device_platform
      Install Source: events.install_source
      Country: events.country
      Game: events.game_name
    row: 22
    col: 10
    width: 14
    height: 7
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
- dashboard: gaming_user_analysis
  title: gaming user analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: onzdYeedMV3TpbIRIWLnbl
  elements:
  - title: top gaming customers
    name: top gaming customers
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
    height: 7
  - title: past 6 month top users
    name: past 6 month top users
    model: thelook
    explore: order_items
    type: looker_line
    fields: [users.email, user_order_facts.lifetime_revenue, user_order_facts.latest_order_date]
    filters:
      user_order_facts.latest_order_date: 6 months
    sorts: [user_order_facts.lifetime_revenue desc 0]
    limit: 10
    column_limit: 50
    listen: {}
    row: 0
    col: 13
    width: 10
    height: 7

---
- dashboard: gary_dashboard
  title: Gary dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: MozzjEm2GRku58Aq9WaXsl
  elements:
  - title: Gary dashboard
    name: Gary dashboard
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
    width: 24
    height: 12

---
- dashboard: gcp_billing_summary
  title: GCP Billing Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: This is a dashboard that represents an organizations yearly cost breakdown
    of a Google Cloud project. IT also includes free credits the org acquired to offset
    the cost. It is very high level, when suggest actions recommend breaking down
    cost by project.
  preferred_slug: 3nrGU3mcTNh4TuZKReqR3p
  elements:
  - title: YTD Costs
    name: YTD Costs
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.period_selected, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: "-NULL"
    sorts: [gcp_billing_export.period_selected desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      table_calculation: change
      _type_hint: number
      category: table_calculation
      expression: "${gcp_billing_export.total_cost}/offset(${gcp_billing_export.total_cost},1)-1"
      label: Change
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#4285F4", color_application: {collection_id: google, palette_id: google-diverging-0},
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
    note_state: collapsed
    note_display: hover
    note_text: 'This tile shows how much cloud expenditures the business has incurred
      so far this year, vs. the same period last year. Reasons for costs going down
      may include company downsizing, spinning down of under utilized resources &
      projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 2
    col: 7
    width: 4
    height: 8
  - name: "<b>SPEND TO DATE</b>"
    type: text
    title_text: "<b>SPEND TO DATE</b>"
    body_text: ''
    row: 0
    col: 7
    width: 17
    height: 2
  - name: "<b>CREDIT ANALYSIS</b>"
    type: text
    title_text: "<b>CREDIT ANALYSIS</b>"
    body_text: ''
    row: 10
    col: 7
    width: 17
    height: 2
  - title: YEAR OVER YEAR SPEND
    name: YEAR OVER YEAR SPEND
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.currency: USD
      gcp_billing_export.usage_start_year: 3 years ago for 3 years,1 years
      gcp_billing_export.total_cost: NOT NULL
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Reasons for costs going
      down may include company downsizing, spinning down of under utilized resources
      & projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 2
    col: 11
    width: 13
    height: 8
  - title: Net Cost Summary
    name: Net Cost Summary
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_sustained_use_discount}*-1"
      label: Sustained Use Discount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sustained_use_discount
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*-1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10.5'
    label_value_format: $0.0,,"M"
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#34A853"
      sustained_use_discount: "#FBBC04"
    label_color: [transparent, white, white]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#000000",
        line_value: '0', label: "$0.00"}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      sustained_use_discount]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 12
    col: 11
    width: 13
    height: 9
  - title: Percent Credit Usage by Project
    name: Percent Credit Usage by Project
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export.project__name, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 6 months
      gcp_billing_export.total_cost: ">=10000000"
    sorts: [ofcostcreditused desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*-1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
      _type_hint: number
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
    limit_displayed_rows: true
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
    totals_color: "#202124"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    font_size: '10.5'
    label_value_format: ''
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    label_color: []
    reference_lines: []
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      credits, gcp_billing_export.total_cost]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 21
    col: 15
    width: 9
    height: 8
  - title: Total Credits Applied
    name: Total Credits Applied
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
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
    custom_color: "#FFF"
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    comparison_label: of Total Cost
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      gcp_billing_export__credits.total_amount]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 12
    col: 7
    width: 4
    height: 9
  - title: Credit Types
    name: Credit Types
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_pie
    fields: [gcp_billing_export__credits.type, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
      gcp_billing_export__credits.type: "-NULL"
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
      _type_hint: number
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
      FREE_TIER: "#FBBC04"
      DISCOUNT: "#34A853"
      PROMOTION: "#EA4335"
    custom_color_enabled: true
    custom_color: "#FFF"
    show_single_value_title: true
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of Total Cost
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      credits, ofcostcreditused]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 21
    col: 7
    width: 8
    height: 8
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 7
    height: 29
  filters:
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description

---
- dashboard: gcp_billing_summary_
  title: 'GCP Billing Summary '
  layout: newspaper
  preferred_viewer: dashboards-next
  description: This is a dashboard that represents an organizations yearly cost breakdown
    of a Google Cloud project. IT also includes free credits the org acquired to offset
    the cost. It is very high level, when suggest actions recommend breaking down
    cost by project.
  preferred_slug: tKUrC4nfJkUwAepBig3Xw0
  elements:
  - title: GCP Billing Summary
    name: GCP Billing Summary
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters: {}
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Particularly highlight the
      period when spend is increasing. Summarize the trend. '
    listen:
      Currency: gcp_billing_export.currency
      Usage Start Year: gcp_billing_export.usage_start_year
      Total Cost: gcp_billing_export.total_cost
      Service Type: gcp_billing_export.service__description
    row: 3
    col: 9
    width: 15
    height: 8
  - title: Year to Date costs
    name: Year to Date costs
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.period_selected, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: "-NULL"
    sorts: [gcp_billing_export.period_selected desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      table_calculation: change
      _type_hint: number
      category: table_calculation
      expression: "${gcp_billing_export.total_cost}/offset(${gcp_billing_export.total_cost},1)-1"
      label: Change
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#4285F4", color_application: {collection_id: google, palette_id: google-diverging-0},
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
    note_state: collapsed
    note_display: above
    note_text: This tile shows the total cost year to date.
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 0
    col: 9
    width: 8
    height: 3
  - title: Year to Date Credits
    name: Year to Date Credits
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
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
    custom_color: "#FFF"
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    comparison_label: of Total Cost
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      gcp_billing_export__credits.total_amount]
    note_state: collapsed
    note_display: hover
    note_text: This tile shows total credits applied year to date
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 0
    col: 17
    width: 7
    height: 3
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 19
  - title: Gross costs, Net costs and Credits
    name: Gross costs, Net costs and Credits
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount]
    filters:
      gcp_billing_export.usage_start_date: 3 years ago for 3 years
    sorts: [gcp_billing_export.usage_start_month]
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
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows Total costs, Net costs and credits applied on month
      over month for last 3 years. Highlight where net spend is drastically increasing
      and pay attention to how much credits were applied. summarize total cost, net
      cost and credit amount. '
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 11
    col: 9
    width: 15
    height: 8
  filters:
  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.currency
  - name: Total Cost
    title: Total Cost
    type: field_filter
    default_value: NOT NULL
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.total_cost
  - name: Usage Start Year
    title: Usage Start Year
    type: field_filter
    default_value: 3 years ago for 3 years,1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.usage_start_year
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description

---
- dashboard: gcp_billing_summary
  title: GCP Billing Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: This is a dashboard that represents an organizations yearly cost breakdown
    of a Google Cloud project. IT also includes free credits the org acquired to offset
    the cost. It is very high level, when suggest actions recommend breaking down
    cost by project.
  preferred_slug: Rf4HhBYjLRwfYlATsQM6Z6
  elements:
  - title: GCP Billing Summary
    name: GCP Billing Summary
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters: {}
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Particularly highlight the
      period when spend is increasing. Summarize the trend. '
    listen:
      Currency: gcp_billing_export.currency
      Usage Start Year: gcp_billing_export.usage_start_year
      Total Cost: gcp_billing_export.total_cost
      Service Type: gcp_billing_export.service__description
    row: 3
    col: 9
    width: 15
    height: 8
  - title: Year to Date costs
    name: Year to Date costs
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.period_selected, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: "-NULL"
    sorts: [gcp_billing_export.period_selected desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      table_calculation: change
      _type_hint: number
      category: table_calculation
      expression: "${gcp_billing_export.total_cost}/offset(${gcp_billing_export.total_cost},1)-1"
      label: Change
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#4285F4", color_application: {collection_id: google, palette_id: google-diverging-0},
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
    note_state: collapsed
    note_display: above
    note_text: This tile shows the total cost year to date.
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 0
    col: 9
    width: 8
    height: 3
  - title: Year to Date Credits
    name: Year to Date Credits
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
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
    custom_color: "#FFF"
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    comparison_label: of Total Cost
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      gcp_billing_export__credits.total_amount]
    note_state: collapsed
    note_display: hover
    note_text: This tile shows total credits applied year to date
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 0
    col: 17
    width: 7
    height: 3
  - title: Gross costs, Net costs and Credits
    name: Gross costs, Net costs and Credits
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount]
    filters:
      gcp_billing_export.usage_start_date: 3 years ago for 3 years
    sorts: [gcp_billing_export.usage_start_month]
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
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows Total costs, Net costs and credits applied on month
      over month for last 3 years. Highlight where net spend is drastically increasing
      and pay attention to how much credits were applied. summarize total cost, net
      cost and credit amount. '
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 11
    col: 9
    width: 15
    height: 8
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 20
  filters:
  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.currency
  - name: Total Cost
    title: Total Cost
    type: field_filter
    default_value: NOT NULL
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.total_cost
  - name: Usage Start Year
    title: Usage Start Year
    type: field_filter
    default_value: 3 years ago for 3 years,1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.usage_start_year
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description

---
- dashboard: gcp_billing_summary_copy
  title: GCP Billing Summary (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: This is a dashboard that represents an organizations yearly cost breakdown
    of a Google Cloud project. IT also includes free credits the org acquired to offset
    the cost. It is very high level, when suggest actions recommend breaking down
    cost by project.
  preferred_slug: HTCcxRtXWF5PjABuQ5En6R
  elements:
  - title: YTD Costs
    name: YTD Costs
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.period_selected, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: "-NULL"
    sorts: [gcp_billing_export.period_selected desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      table_calculation: change
      _type_hint: number
      category: table_calculation
      expression: "${gcp_billing_export.total_cost}/offset(${gcp_billing_export.total_cost},1)-1"
      label: Change
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#4285F4", color_application: {collection_id: google, palette_id: google-diverging-0},
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
    note_state: collapsed
    note_display: hover
    note_text: 'This tile shows how much cloud expenditures the business has incurred
      so far this year, vs. the same period last year. Reasons for costs going down
      may include company downsizing, spinning down of under utilized resources &
      projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 2
    col: 7
    width: 4
    height: 8
  - name: "<b>SPEND TO DATE</b>"
    type: text
    title_text: "<b>SPEND TO DATE</b>"
    body_text: ''
    row: 0
    col: 7
    width: 17
    height: 2
  - name: "<b>CREDIT ANALYSIS</b>"
    type: text
    title_text: "<b>CREDIT ANALYSIS</b>"
    body_text: ''
    row: 10
    col: 7
    width: 17
    height: 2
  - title: YEAR OVER YEAR SPEND
    name: YEAR OVER YEAR SPEND
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.currency: USD
      gcp_billing_export.usage_start_year: 3 years ago for 3 years,1 years
      gcp_billing_export.total_cost: NOT NULL
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Reasons for costs going
      down may include company downsizing, spinning down of under utilized resources
      & projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 2
    col: 11
    width: 13
    height: 8
  - title: Net Cost Summary
    name: Net Cost Summary
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_sustained_use_discount}*-1"
      label: Sustained Use Discount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sustained_use_discount
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*-1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10.5'
    label_value_format: $0.0,,"M"
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#34A853"
      sustained_use_discount: "#FBBC04"
    label_color: [transparent, white, white]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#000000",
        line_value: '0', label: "$0.00"}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      sustained_use_discount]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 12
    col: 11
    width: 13
    height: 9
  - title: Percent Credit Usage by Project
    name: Percent Credit Usage by Project
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export.project__name, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 6 months
      gcp_billing_export.total_cost: ">=10000000"
    sorts: [ofcostcreditused desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*-1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
      _type_hint: number
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
    limit_displayed_rows: true
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
    totals_color: "#202124"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    font_size: '10.5'
    label_value_format: ''
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    label_color: []
    reference_lines: []
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      credits, gcp_billing_export.total_cost]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 21
    col: 15
    width: 9
    height: 8
  - title: Total Credits Applied
    name: Total Credits Applied
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
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
    custom_color: "#FFF"
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    comparison_label: of Total Cost
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      gcp_billing_export__credits.total_amount]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 12
    col: 7
    width: 4
    height: 9
  - title: Credit Types
    name: Credit Types
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_pie
    fields: [gcp_billing_export__credits.type, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
      gcp_billing_export__credits.type: "-NULL"
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
      _type_hint: number
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
      FREE_TIER: "#FBBC04"
      DISCOUNT: "#34A853"
      PROMOTION: "#EA4335"
    custom_color_enabled: true
    custom_color: "#FFF"
    show_single_value_title: true
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of Total Cost
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      credits, ofcostcreditused]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 21
    col: 7
    width: 8
    height: 8
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 7
    height: 29
  filters:
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description

---
- dashboard: gcp_billing_summary_copy
  title: GCP Billing Summary (copy)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: This is a dashboard that represents an organizations yearly cost breakdown
    of a Google Cloud project. IT also includes free credits the org acquired to offset
    the cost. It is very high level, when suggest actions recommend breaking down
    cost by project.
  preferred_slug: PoGTPQRxMtqLWMyVD8qr4I
  elements:
  - title: YTD Costs
    name: YTD Costs
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.period_selected, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: "-NULL"
    sorts: [gcp_billing_export.period_selected desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      table_calculation: change
      _type_hint: number
      category: table_calculation
      expression: "${gcp_billing_export.total_cost}/offset(${gcp_billing_export.total_cost},1)-1"
      label: Change
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#4285F4", color_application: {collection_id: google, palette_id: google-diverging-0},
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
    note_state: collapsed
    note_display: hover
    note_text: 'This tile shows how much cloud expenditures the business has incurred
      so far this year, vs. the same period last year. Reasons for costs going down
      may include company downsizing, spinning down of under utilized resources &
      projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 8
    col: 7
    width: 4
    height: 8
  - name: "<b>SPEND TO DATE</b>"
    type: text
    title_text: "<b>SPEND TO DATE</b>"
    body_text: ''
    row: 0
    col: 7
    width: 17
    height: 2
  - name: "<b>CREDIT ANALYSIS</b>"
    type: text
    title_text: "<b>CREDIT ANALYSIS</b>"
    body_text: ''
    row: 16
    col: 7
    width: 17
    height: 2
  - title: YEAR OVER YEAR SPEND
    name: YEAR OVER YEAR SPEND
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.currency: USD
      gcp_billing_export.usage_start_year: 3 years ago for 3 years,1 years
      gcp_billing_export.total_cost: NOT NULL
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Reasons for costs going
      down may include company downsizing, spinning down of under utilized resources
      & projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 8
    col: 11
    width: 13
    height: 8
  - title: Net Cost Summary
    name: Net Cost Summary
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_sustained_use_discount}*-1"
      label: Sustained Use Discount
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sustained_use_discount
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*-1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10.5'
    label_value_format: $0.0,,"M"
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#34A853"
      sustained_use_discount: "#FBBC04"
    label_color: [transparent, white, white]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#000000",
        line_value: '0', label: "$0.00"}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      sustained_use_discount]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 18
    col: 11
    width: 13
    height: 9
  - title: Percent Credit Usage by Project
    name: Percent Credit Usage by Project
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export.project__name, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 6 months
      gcp_billing_export.total_cost: ">=10000000"
    sorts: [ofcostcreditused desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*-1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
      _type_hint: number
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
    limit_displayed_rows: true
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
    totals_color: "#202124"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    font_size: '10.5'
    label_value_format: ''
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    label_color: []
    reference_lines: []
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      credits, gcp_billing_export.total_cost]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 27
    col: 15
    width: 9
    height: 8
  - title: Total Credits Applied
    name: Total Credits Applied
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
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
    custom_color: "#FFF"
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    comparison_label: of Total Cost
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      gcp_billing_export__credits.total_amount]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 18
    col: 7
    width: 4
    height: 9
  - title: Credit Types
    name: Credit Types
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_pie
    fields: [gcp_billing_export__credits.type, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
      gcp_billing_export__credits.type: "-NULL"
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
      _type_hint: number
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
      FREE_TIER: "#FBBC04"
      DISCOUNT: "#34A853"
      PROMOTION: "#EA4335"
    custom_color_enabled: true
    custom_color: "#FFF"
    show_single_value_title: true
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of Total Cost
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      credits, ofcostcreditused]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 27
    col: 7
    width: 8
    height: 8
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 7
    height: 29
  - type: extension
    extension_id: genai_extensions::query_insights
    title: Query Insights
    name: Query Insights
    row: 35
    col: 0
    width: 8
    height: 6
  - title: Insights
    name: Insights
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: genai_extensions::query_insights
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.currency: USD
      gcp_billing_export.usage_start_year: 3 years ago for 3 years,1 years
      gcp_billing_export.total_cost: NOT NULL
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: false
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 0
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Reasons for costs going
      down may include company downsizing, spinning down of under utilized resources
      & projects, migrating workloads, budget constraints, pricing discounts, or other
      factors. Reasons for costs going up could be business or user expansion, net
      new use cases, unwanted or unmonitored expenditures, trial of new SKUs and services,
      non efficient use of discounts and resources, or other factors. '
    listen:
      Service Type: gcp_billing_export.service__description
    row: 2
    col: 7
    width: 17
    height: 6
  filters:
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description

---
- dashboard: gcp_billing_summary__pathik
  title: GCP Billing Summary - pathik@
  layout: newspaper
  preferred_viewer: dashboards-next
  description: This is a dashboard that represents an organizations yearly cost breakdown
    of a Google Cloud project. IT also includes free credits the org acquired to offset
    the cost. It is very high level, when suggest actions recommend breaking down
    cost by project.
  preferred_slug: kXjNvTdXIMv7K9J4Wp3zQ6
  elements:
  - title: GCP Billing Summary
    name: GCP Billing Summary
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters: {}
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows the year-over-year spend, broken down by month to
      represent the seasonality of cloud spend each year. Particularly highlight the
      period when spend is increasing. Summarize the trend. '
    listen:
      Currency: gcp_billing_export.currency
      Usage Start Year: gcp_billing_export.usage_start_year
      Total Cost: gcp_billing_export.total_cost
      Service Type: gcp_billing_export.service__description
    row: 3
    col: 9
    width: 15
    height: 8
  - title: Year to Date costs
    name: Year to Date costs
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.period_selected, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: "-NULL"
    sorts: [gcp_billing_export.period_selected desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      table_calculation: change
      _type_hint: number
      category: table_calculation
      expression: "${gcp_billing_export.total_cost}/offset(${gcp_billing_export.total_cost},1)-1"
      label: Change
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#4285F4", color_application: {collection_id: google, palette_id: google-diverging-0},
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
    note_state: collapsed
    note_display: above
    note_text: This tile shows the total cost year to date.
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 0
    col: 9
    width: 8
    height: 3
  - title: Year to Date Credits
    name: Year to Date Credits
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.usage_start_date: 12 months
    sorts: [ofcostcreditused desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}*1"
      label: Credits
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: credits
      _type_hint: number
    - category: table_calculation
      expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}"
      label: "%ofCostCreditUsed"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: ofcostcreditused
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
    custom_color: "#FFF"
    single_value_title: Total Credits Applied
    value_format: $0.0,,"M"
    comparison_label: of Total Cost
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}, {axisId: sustained_use_discount,
            id: sustained_use_discount, name: Sustained Use Discount}, {axisId: credits,
            id: credits, name: Credits}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    legend_position: center
    font_size: '10.5'
    label_value_format: ''
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#DADCE0"
      credits: "#4285F4"
      sustained_use_discount: "#FBBC04"
      ofcostcreditused: "#4285F4"
    show_value_labels: false
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#202124"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export__credits.total_sustained_use_discount, gcp_billing_export.total_cost,
      gcp_billing_export__credits.total_amount]
    note_state: collapsed
    note_display: hover
    note_text: This tile shows total credits applied year to date
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 0
    col: 17
    width: 7
    height: 3
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 9
    height: 19
  - title: Gross costs, Net costs and Credits
    name: Gross costs, Net costs and Credits
    model: gcp_billing_demo
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount]
    filters:
      gcp_billing_export.usage_start_date: 3 years ago for 3 years
    sorts: [gcp_billing_export.usage_start_month]
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
    note_state: collapsed
    note_display: hover
    note_text: 'This chart shows Total costs, Net costs and credits applied on month
      over month for last 3 years. Highlight where net spend is drastically increasing
      and pay attention to how much credits were applied. summarize total cost, net
      cost and credit amount. '
    listen:
      Currency: gcp_billing_export.currency
      Total Cost: gcp_billing_export.total_cost
      Usage Start Year: gcp_billing_export.usage_start_year
      Service Type: gcp_billing_export.service__description
    row: 11
    col: 9
    width: 15
    height: 8
  filters:
  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.currency
  - name: Total Cost
    title: Total Cost
    type: field_filter
    default_value: NOT NULL
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.total_cost
  - name: Usage Start Year
    title: Usage Start Year
    type: field_filter
    default_value: 3 years ago for 3 years,1 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.usage_start_year
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_demo
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description

---
- dashboard: gdata_demo
  title: gDATA Demo
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1Q4lQ9aDdSFezMcFFN534q
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
- dashboard: genai
  title: GenAI
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: ftUNVoJOpKOvcQhs3UDBP2
  elements:
  - title: GenAI
    name: GenAI
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.email, order_items.total_sale_price]
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
      Total Sale Price: order_items.total_sale_price
      Brand: products.brand
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
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
- dashboard: geo_maps__population_dashboards
  title: Geo maps - population Dashboards
  layout: newspaper
  description: ''
  preferred_slug: wTqXHAerG4lt9h8cYnOfm0
  elements:
  - title: Change - Income per Capita (2011-2017)
    name: Change - Income per Capita (2011-2017)
    model: retail_banking
    explore: acs_changes_2011_2017
    type: looker_map
    fields: [acs_changes_2011_2017.Zip_Code, acs_changes_2011_2017.Income_Per_Capita,
      acs_changes_2011_2017.rate_bachelors_degree_or_higher_25_64]
    sorts: [acs_changes_2011_2017.Income_Per_Capita desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: false
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
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 39.42382884949034
    map_longitude: -105.68972110748291
    map_zoom: 7
    map_value_colors: ["#EA4335", "#FBBC04", "#34A853"]
    map_value_scale_clamp_min: -1
    map_value_scale_clamp_max: 10000
    defaults_version: 1
    listen:
      Zip Code: acs_changes_2011_2017.Zip_Code
    row: 8
    col: 0
    width: 12
    height: 9
  - title: Share of Population (25-64) with Bachelor's degree
    name: Share of Population (25-64) with Bachelor's degree
    model: retail_banking
    explore: acs_2017_zipcodes
    type: looker_column
    fields: [acs_2017_zipcodes.Zip_Code, acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64]
    filters:
      acs_2017_zipcodes.Population: ">1000"
    sorts: [acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64 desc]
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
    y_axes: [{label: "% of Adults (25-64)", orientation: left, series: [{axisId: acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
            id: acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64, name: Rate
              Bachelors Degree or Higher 25 64}], showLabels: true, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 47,
        type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#7d7d7d",
        line_value: '33.3', label: Utah Avg}]
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
    defaults_version: 1
    listen:
      Zip Code: acs_2017_zipcodes.Zip_Code
    row: 17
    col: 0
    width: 12
    height: 7
  - title: Active Policies per 10,000 Residents
    name: Active Policies per 10,000 Residents
    model: retail_banking
    explore: acs_2017_zipcodes_and_banks
    type: looker_map
    fields: [acs_2017_zipcodes_and_banks.Zip_Code, acs_2017_zipcodes_and_banks.Banks_per_10000_Residents]
    sorts: [acs_2017_zipcodes_and_banks.Banks_per_10000_Residents desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.4
    show_region_field: true
    draw_map_labels_above_data: false
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
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 39.7382555990683
    map_longitude: -105.03778338432313
    map_zoom: 9
    map_value_colors: ["#0D652D", "#34A853", "#E6F4EA"]
    map_value_scale_clamp_min: 1
    map_value_scale_clamp_max: 5
    defaults_version: 1
    listen:
      Zip Code: acs_2017_zipcodes_and_banks.Zip_Code
    row: 0
    col: 12
    width: 12
    height: 8
  - title: Household Income Distribution
    name: Household Income Distribution
    model: retail_banking
    explore: acs_2017_zipcodes
    type: looker_column
    fields: [acs_2017_zipcodes.percent_income_15000_19999, acs_2017_zipcodes.percent_income_20000_24999,
      acs_2017_zipcodes.percent_income_25000_29999, acs_2017_zipcodes.percent_income_30000_34999,
      acs_2017_zipcodes.percent_income_35000_39999, acs_2017_zipcodes.percent_income_40000_44999,
      acs_2017_zipcodes.percent_income_45000_49999, acs_2017_zipcodes.percent_income_50000_59999,
      acs_2017_zipcodes.percent_income_60000_74999, acs_2017_zipcodes.percent_income_75000_99999,
      acs_2017_zipcodes.percent_income_100000_124999, acs_2017_zipcodes.percent_income_125000_149999,
      acs_2017_zipcodes.percent_income_150000_199999, acs_2017_zipcodes.percent_income_200000_or_More]
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
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: acs_2017_zipcodes.percent_income_15000_19999,
            id: acs_2017_zipcodes.percent_income_15000_19999, name: '15,000 - 19,999'},
          {axisId: acs_2017_zipcodes.percent_income_20000_24999, id: acs_2017_zipcodes.percent_income_20000_24999,
            name: '20,000 - 24,999'}, {axisId: acs_2017_zipcodes.percent_income_25000_29999,
            id: acs_2017_zipcodes.percent_income_25000_29999, name: '25,000 - 29,999'},
          {axisId: acs_2017_zipcodes.percent_income_30000_34999, id: acs_2017_zipcodes.percent_income_30000_34999,
            name: '30,000 - 34,99'}, {axisId: acs_2017_zipcodes.percent_income_35000_39999,
            id: acs_2017_zipcodes.percent_income_35000_39999, name: '35,000 - 39,999'},
          {axisId: acs_2017_zipcodes.percent_income_40000_44999, id: acs_2017_zipcodes.percent_income_40000_44999,
            name: '40,000 - 44,999'}, {axisId: acs_2017_zipcodes.percent_income_45000_49999,
            id: acs_2017_zipcodes.percent_income_45000_49999, name: '45,000 - 49,999'},
          {axisId: acs_2017_zipcodes.percent_income_50000_59999, id: acs_2017_zipcodes.percent_income_50000_59999,
            name: '50,000 - 59,999'}, {axisId: acs_2017_zipcodes.percent_income_60000_74999,
            id: acs_2017_zipcodes.percent_income_60000_74999, name: '60,000 - 74,999'},
          {axisId: acs_2017_zipcodes.percent_income_75000_99999, id: acs_2017_zipcodes.percent_income_75000_99999,
            name: '75,000 - 99,999'}, {axisId: acs_2017_zipcodes.percent_income_100000_124999,
            id: acs_2017_zipcodes.percent_income_100000_124999, name: '100,000 - 124,999'},
          {axisId: acs_2017_zipcodes.percent_income_125000_149999, id: acs_2017_zipcodes.percent_income_125000_149999,
            name: '125,000 - 149,999'}, {axisId: acs_2017_zipcodes.percent_income_150000_199999,
            id: acs_2017_zipcodes.percent_income_150000_199999, name: '150,000 - 199,999'},
          {axisId: acs_2017_zipcodes.percent_income_200000_or_More, id: acs_2017_zipcodes.percent_income_200000_or_More,
            name: '200,000 or greater'}], showLabels: true, showValues: true, maxValue: !!null '',
        minValue: 0, valueFormat: "#\\%", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 18, type: linear}]
    x_axis_label: 'Range: $15,000 to $200,000+'
    hide_legend: true
    font_size: ''
    label_value_format: "#.#\\%"
    series_colors:
      acs_2017_zipcodes.percent_income_15000_19999: "#E8F0FE"
      acs_2017_zipcodes.percent_income_20000_24999: "#E8F0FE"
      acs_2017_zipcodes.percent_income_25000_29999: "#D2E3FC"
      acs_2017_zipcodes.percent_income_30000_34999: "#D2E3FC"
      acs_2017_zipcodes.percent_income_35000_39999: "#B5D0FA"
      acs_2017_zipcodes.percent_income_40000_44999: "#B5D0FA"
      acs_2017_zipcodes.percent_income_45000_49999: "#98BDF9"
      acs_2017_zipcodes.percent_income_50000_59999: "#98BDF9"
      acs_2017_zipcodes.percent_income_60000_74999: "#1A73E8"
      acs_2017_zipcodes.percent_income_75000_99999: "#1A73E8"
      acs_2017_zipcodes.percent_income_100000_124999: "#1967D2"
      acs_2017_zipcodes.percent_income_125000_149999: "#1967D2"
      acs_2017_zipcodes.percent_income_150000_199999: "#174EA6"
      acs_2017_zipcodes.percent_income_200000_or_More: "#174EA6"
    series_labels:
      acs_2017_zipcodes.percent_income_20000_24999: 20,000 - 24,999
      acs_2017_zipcodes.percent_income_30000_34999: 30,000 - 34,99
      acs_2017_zipcodes.percent_income_40000_44999: 40,000 - 44,999
      acs_2017_zipcodes.percent_income_50000_59999: 50,000 - 59,999
      acs_2017_zipcodes.percent_income_75000_99999: 75,000 - 99,999
      acs_2017_zipcodes.percent_income_125000_149999: 125,000 - 149,999
      acs_2017_zipcodes.percent_income_200000_or_More: 200,000 or greater
      acs_2017_zipcodes.percent_income_25000_29999: 25,000 - 29,999
      acs_2017_zipcodes.percent_income_35000_39999: 35,000 - 39,999
      acs_2017_zipcodes.percent_income_45000_49999: 45,000 - 49,999
      acs_2017_zipcodes.percent_income_60000_74999: 60,000 - 74,999
      acs_2017_zipcodes.percent_income_100000_124999: 100,000 - 124,999
      acs_2017_zipcodes.percent_income_150000_199999: 150,000 - 199,999
      acs_2017_zipcodes.percent_income_15000_19999: 15,000 - 19,999
    label_color: ["#5F6368"]
    reference_lines: []
    x_axis_label_rotation: 90
    label_rotation: 360
    column_group_spacing_ratio: 0
    show_dropoff: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    up_color: "#81BE56"
    down_color: "#CCC54B"
    total_color: "#55A3B3"
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
    listen:
      Zip Code: acs_2017_zipcodes.Zip_Code
    row: 24
    col: 0
    width: 24
    height: 7
  - title: Owner-Occupied Home Value Distributions
    name: Owner-Occupied Home Value Distributions
    model: retail_banking
    explore: acs_2017_zipcodes_and_banks
    type: looker_boxplot
    fields: [acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile,
      acs_2017_zipcodes_and_banks.owner_occupied_housing_units_median_value, acs_2017_zipcodes_and_banks.owner_occupied_housing_units_upper_value_quartile,
      acs_2017_zipcodes_and_banks.Zip_Code]
    sorts: [acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile
        desc]
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
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      custom:
        id: 3fbb33a3-fabe-b76c-7219-fd6ed8c860a0
        label: Custom
        type: discrete
        colors:
        - "#34A853"
        - "#CCC54B"
        - "#55A3B3"
        - "#F9CB67"
        - "#80CABB"
        - "#FCA33D"
        - "#6877A4"
        - "#7C478E"
        - "#F57237"
        - "#D14242"
        - "#CD3B8A"
        - "#AF71CB"
      options:
        steps: 5
    y_axis_min: []
    y_axis_labels: [Home Value]
    y_axis_value_format: "$###,##0"
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_point_styles:
      acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile: auto
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
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Zip Code: acs_2017_zipcodes_and_banks.Zip_Code
    row: 17
    col: 12
    width: 12
    height: 7
  - title: Change - Vacant Housing Units for Sales (2011-2017)
    name: Change - Vacant Housing Units for Sales (2011-2017)
    model: retail_banking
    explore: acs_changes_2011_2017
    type: looker_map
    fields: [acs_changes_2011_2017.Zip_Code, acs_changes_2011_2017.vacant_housing_units_for_sale,
      acs_changes_2011_2017.owner_occupied_housing_units_median_value]
    sorts: [acs_changes_2011_2017.vacant_housing_units_for_sale desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: false
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
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_latitude: 39.698560790088614
    map_longitude: -104.9640816450119
    map_zoom: 10
    map_value_colors: ["#EA4335", "#FBBC04", "#34A853"]
    map_value_scale_clamp_min: -300
    map_value_scale_clamp_max: 300
    defaults_version: 1
    listen:
      Zip Code: acs_changes_2011_2017.Zip_Code
    row: 8
    col: 12
    width: 12
    height: 9
  - title: Population by Zip Code
    name: Population by Zip Code
    model: retail_banking
    explore: acs_2017_zipcodes
    type: looker_map
    fields: [acs_2017_zipcodes.Population, acs_2017_zipcodes.Zip_Code]
    sorts: [acs_2017_zipcodes.Population desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
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
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_latitude: 39.76139347983576
    map_longitude: -105.15355825424196
    map_zoom: 8
    map_value_colors: ["#0D652D", "#34A853", "#E6F4EA"]
    map_value_scale_clamp_min: 1000
    defaults_version: 1
    listen:
      Zip Code: acs_2017_zipcodes.Zip_Code
    row: 0
    col: 0
    width: 12
    height: 8
  filters:
  - name: Zip Code
    title: Zip Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: retail_banking
    explore: acs_2017_zipcodes
    listens_to_filters: []
    field: acs_2017_zipcodes.Zip_Code

---
- dashboard: group_overview
  title: Group Overview
  layout: newspaper
  description: ''
  preferred_slug: sg4Ts7hrlIngblWG9WdSQF
  elements:
  - title: Sales
    name: Sales
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions.percent_customer_transactions]
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
    - table_calculation: target
      label: Target
      expression: round(${transactions__line_items.total_sales}*1.1/1000,0)*1000
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#5A30C2"
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions.percent_customer_transactions, vs_ly]
    listen:
      Date: transactions.date_comparison_filter
    row: 2
    col: 0
    width: 6
    height: 2
  - title: Transactions
    name: Transactions
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions.percent_customer_transactions]
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
    hidden_fields: [transactions__line_items.average_basket_size, transactions.percent_customer_transactions,
      transactions__line_items.total_sales]
    listen:
      Date: transactions.date_comparison_filter
    row: 2
    col: 6
    width: 6
    height: 2
  - title: Basket Size
    name: Basket Size
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions.percent_customer_transactions]
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
    hidden_fields: [transactions.percent_customer_transactions, transactions__line_items.total_sales,
      transactions.number_of_transactions]
    listen:
      Date: transactions.date_comparison_filter
    row: 2
    col: 12
    width: 6
    height: 2
  - title: "% Trx from Loyalty"
    name: "% Trx from Loyalty"
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions.percent_customer_transactions]
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
      expression: "${transactions.percent_customer_transactions}-offset(${transactions.percent_customer_transactions},1)"
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
      Date: transactions.date_comparison_filter
    row: 2
    col: 18
    width: 6
    height: 2
  - title: Store Overview
    name: Store Overview
    model: retail_block_model
    explore: transactions
    type: looker_map
    fields: [stores.location, transactions__line_items.total_sales, transactions.number_of_transactions,
      stores.name]
    sorts: [transactions.number_of_transactions desc]
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
    map_marker_units: pixels
    map_marker_radius_min: 3
    map_marker_radius_max: 20
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    map_value_colors: ["#aaa", "#5930c2"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    color_range: ["#5A30C2", "#9d81e6", "#2D2442", "#42248F", "#1F1142"]
    color_by: root
    show_null_points: true
    hidden_fields:
    listen:
      Date: transactions.transaction_date
    row: 4
    col: 10
    width: 14
    height: 9
  - title: Change by Store
    name: Change by Store
    model: retail_block_model
    explore: transactions
    type: looker_bar
    fields: [stores.name, transactions__line_items.sales_change]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
    sorts: [transactions__line_items.sales_change desc]
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
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      custom:
        id: 2cf23ac7-6136-e038-cb59-0b0d03864953
        label: Custom
        type: discrete
        colors:
        - "#5A30C2"
        - "#4fd3f0"
        - "#04b5cc"
        - "#009688"
        - "#4CAF50"
        - "#8BC34A"
        - "#CDDC39"
        - "#FFEB3B"
        - "#9E9E9E"
        - "#607D8B"
        - "#607D8B"
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: transactions__line_items.sales_change,
            id: transactions__line_items.sales_change, name: Sales Change (%)}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    map_marker_units: pixels
    map_marker_radius_min: 3
    map_marker_radius_max: 20
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    map_value_colors: ["#aaa", "#5930c2"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    color_range: ["#5A30C2", "#9d81e6", "#2D2442", "#42248F", "#1F1142"]
    color_by: root
    show_null_points: true
    hidden_fields:
    defaults_version: 1
    listen:
      Date: transactions.date_comparison_filter
    row: 17
    col: 0
    width: 12
    height: 13
  - title: Change by Category
    name: Change by Category
    model: retail_block_model
    explore: transactions
    type: looker_bar
    fields: [transactions__line_items.sales_change, products.category]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      products.category: "-NULL"
    sorts: [transactions__line_items.sales_change desc]
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      custom:
        id: 91999ca4-f13f-8b66-db6b-db77995d1766
        label: Custom
        type: discrete
        colors:
        - "#5A30C2"
        - "#4fd3f0"
        - "#04b5cc"
        - "#009688"
        - "#4CAF50"
        - "#8BC34A"
        - "#CDDC39"
        - "#FFEB3B"
        - "#9E9E9E"
        - "#607D8B"
        - "#607D8B"
      options:
        steps: 5
    series_colors: {}
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
    map_marker_units: pixels
    map_marker_radius_min: 3
    map_marker_radius_max: 20
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    map_value_colors: ["#aaa", "#5930c2"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    color_range: ["#5A30C2", "#9d81e6", "#2D2442", "#42248F", "#1F1142"]
    color_by: root
    show_null_points: true
    hidden_fields:
    defaults_version: 1
    listen:
      Date: transactions.date_comparison_filter
    row: 17
    col: 12
    width: 12
    height: 13
  - name: "<span class='fa fa-random'> Top movers</span>"
    type: text
    title_text: "<span class='fa fa-random'> Top movers</span>"
    subtitle_text: <font color="#5b30c2">Where do I see the biggest movement vs the
      same time last year?</font>
    body_text: |-
      <center><strong>Recommended Action ?</strong>
      Text/email store managers of underperforming stores to look into their store, or dive into the store performance. Dive into underperforming categories to better understand their stock and item dynamics, or alert the category manager ?.</center>
    row: 13
    col: 0
    width: 24
    height: 4
  - name: "<span class='fa fa-users'> Customer Behaviour</span>"
    type: text
    title_text: "<span class='fa fa-users'> Customer Behaviour</span>"
    subtitle_text: <font color="#5b30c2">How am I performing with my target customer
      segments?</font>
    body_text: |-
      <center><strong>Recommended Action ?</strong>
      We've clustered our customer segments according to a ML algorithm. Look for segments with low YoY performance, or with no spikes in retention, and drill into them to see possible actions to drive them back to our brand.</center>
    row: 30
    col: 0
    width: 24
    height: 4
  - title: Emerging Millennials 🥑
    name: Emerging Millennials 🥑
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size,
      customer_clustering_prediction.customer_segment]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
      customer_clustering_prediction.customer_segment: Emerging Millennials%
    sorts: [customer_clustering_prediction.customer_segment, transactions.selected_comparison
        desc]
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
    hidden_fields: [transactions.number_of_transactions, transactions__line_items.average_basket_size,
      transactions.selected_comparison]
    listen:
      Date: transactions.date_comparison_filter
    row: 34
    col: 0
    width: 6
    height: 4
  - title: Regular Gen Xers 🛒
    name: Regular Gen Xers 🛒
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
      customer_clustering_prediction.customer_segment: Regular Gen Xers%
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
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5A30C2"
    hidden_fields: [transactions.number_of_transactions, transactions__line_items.average_basket_size]
    defaults_version: 1
    listen:
      Date: transactions.date_comparison_filter
    row: 34
    col: 6
    width: 6
    height: 4
  - title: One-off locals 🏪
    name: One-off locals 🏪
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
      customer_clustering_prediction.customer_segment: One-off locals%
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
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5A30C2"
    hidden_fields: [transactions.number_of_transactions, transactions__line_items.average_basket_size]
    defaults_version: 1
    listen:
      Date: transactions.date_comparison_filter
    row: 38
    col: 6
    width: 6
    height: 5
  - title: Affluent Retirees 👴
    name: Affluent Retirees 👴
    model: retail_block_model
    explore: transactions
    type: single_value
    fields: [transactions.selected_comparison, transactions__line_items.total_sales,
      transactions.number_of_transactions, transactions__line_items.average_basket_size]
    filters:
      transactions.transaction_date: 2 years
      transactions.comparison_type: year
      transactions.selected_comparison: "-NULL"
      customer_clustering_prediction.customer_segment: Affluent Retirees%
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
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5A30C2"
    hidden_fields: [transactions.number_of_transactions, transactions__line_items.average_basket_size]
    defaults_version: 1
    listen:
      Date: transactions.date_comparison_filter
    row: 38
    col: 0
    width: 6
    height: 5
  - title: How well are we retaining these customer segments?
    name: How well are we retaining these customer segments?
    model: retail_block_model
    explore: transactions
    type: looker_line
    fields: [customer_clustering_prediction.customer_segment, transactions.number_of_customers,
      transactions.months_since_first_customer_transaction]
    pivots: [customer_clustering_prediction.customer_segment]
    filters:
      transactions.transaction_date: 12 months
      transactions.months_since_first_customer_transaction: "<=12"
      customer_clustering_prediction.customer_segment: "-NULL"
    sorts: [transactions.months_since_first_customer_transaction, customer_clustering_prediction.customer_segment]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_of_customers
      label: Percent of Customers
      expression: "${transactions.number_of_customers}/index(${transactions.number_of_customers},1)"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      custom:
        id: 7697335c-a9b7-5dd1-9525-d094e796d1b6
        label: Custom
        type: discrete
        colors:
        - "#5A30C2"
        - "#b885f7"
        - "#0d071c"
        - "#d852db"
        - "#4CAF50"
        - "#8BC34A"
        - "#CDDC39"
        - "#FFEB3B"
        - "#9E9E9E"
        - "#607D8B"
        - "#607D8B"
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
    hidden_fields: [transactions.number_of_customers]
    listen:
      Date: transactions.date_comparison_filter
    row: 34
    col: 12
    width: 12
    height: 9
  - name: "<span class='fa fa-eye'> Company Overview</span>"
    type: text
    title_text: "<span class='fa fa-eye'> Company Overview</span>"
    body_text: ''
    row: 0
    col: 4
    width: 14
    height: 2
  - name: <img src="https://iimgurcom/DwmnjA2png" height="75">
    type: text
    title_text: <img src="https://i.imgur.com/DwmnjA2.png" height="75">
    body_text: ''
    row: 0
    col: 18
    width: 6
    height: 2
  - title: Sales YoY Trends
    name: Sales YoY Trends
    model: retail_block_model
    explore: transactions
    type: looker_line
    fields: [transactions__line_items.total_sales, transactions.transaction_month_num,
      transactions.transaction_year]
    pivots: [transactions.transaction_year]
    fill_fields: [transactions.transaction_month_num, transactions.transaction_year]
    filters:
      transactions.transaction_date: 4 years
      transactions.transaction_month: before 0 months ago
    sorts: [transactions__line_items.total_sales desc 0, transactions.transaction_year]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 10
    height: 9
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline

---
- dashboard: hackaton_lab_embedded_dashboard
  title: Hackaton Lab Embedded Dashboard
  layout: newspaper
  preferred_slug: RCwN0wvLzOM3Exrz33TN6T

---
- dashboard: hartford_healthcare_operations_overview
  title: Hartford Healthcare Operations Overview
  layout: newspaper
  description: ''
  preferred_slug: Ehw6xQhY3NRM3UTf7Vb7bt
  elements:
  - title: ED Wait Time
    name: ED Wait Time
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.average_los]
    filters:
      encounter.is_inpatient: 'Yes'
    sorts: [encounter.average_los desc]
    limit: 500
    dynamic_fields:
    - table_calculation: average_los_hours
      label: Average LOS (Hours)
      expression: "${encounter.average_los}/60"
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Average Length of Stay (Hours)
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [encounter.average_los]
    note_state: collapsed
    note_display: hover
    note_text: Length of Stay is defined as the difference in time since the patient
      was admitted into the hospital, until they were formally discharged by a nurse
    listen:
      Hospital ID: organization.id
    row: 7
    col: 6
    width: 6
    height: 4
  - title: Number of Patients
    name: Number of Patients
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.count]
    filters:
      encounter.period__end_date: 1 years
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total Patients Treated - This Year
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital ID: organization.id
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Number of Encounters
    name: Number of Encounters
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count, encounter.period__start_month]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.is_inpatient: 'Yes'
    sorts: [encounter.period__start_month desc]
    limit: 500
    dynamic_fields:
    - table_calculation: prior_year_month
      label: Prior Year Month
      expression: offset(${encounter.count},12)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Inpatient Admissions - This Month
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital ID: organization.id
    row: 3
    col: 0
    width: 6
    height: 4
  - name: "<span class='fa fa-gears'> Operations Overview</span>"
    type: text
    title_text: "<span class='fa fa-gears'> Operations Overview</span>"
    body_text: "**Recommended Action** Drill into high level metrics to determine\
      \ where we can improve our KPIs and follow up with key stakeholders to plan\
      \ appropriately"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Visits by Type Over Time
    name: Visits by Type Over Time
    model: healthcare
    explore: encounter_extended
    type: looker_line
    fields: [encounter.period__start_month_name, encounter.count, encounter.code_name]
    pivots: [encounter.code_name]
    fill_fields: [encounter.period__start_month_name]
    filters:
      encounter.period__start_year: 1 years ago for 1 years
    sorts: [encounter.period__start_month_name, encounter.code_name 0]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: 2019 - encounter.average_los, name: '2019'}, {axisId: encounter.average_los,
            id: 2018 - encounter.average_los, name: '2018'}, {axisId: encounter.average_los,
            id: 2017 - encounter.average_los, name: '2017'}, {axisId: encounter.average_los,
            id: 2016 - encounter.average_los, name: '2016'}, {axisId: encounter.average_los,
            id: 2015 - encounter.average_los, name: '2015'}], showLabels: false, showValues: true,
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital ID: organization.id
    row: 11
    col: 0
    width: 14
    height: 7
  - name: "<span class='fa fa-users'>  Patient Demographics & Conditions</span>"
    type: text
    title_text: "<span class='fa fa-users'>  Patient Demographics & Conditions</span>"
    body_text: "**Recommended Action** Drill into Condition Lookup dashboard to understand\
      \ more information about, or link out to the cohort dashboard to build a cohort\
      \ beginning with the condition code"
    row: 18
    col: 0
    width: 24
    height: 3
  - title: Encounters by Age
    name: Encounters by Age
    model: healthcare
    explore: encounter_extended
    type: looker_donut_multiples
    fields: [encounter.count, encounter.code_name, patient.age_tier]
    pivots: [patient.age_tier]
    fill_fields: [patient.age_tier]
    filters:
      encounter.period__start_week: 1 years ago for 1 years
    sorts: [encounter.count desc 0, encounter.code_name, patient.age_tier]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    series_colors: {}
    series_labels:
      'No': Outpatient
      'Yes': Inpatient
      Yes - encounter.count: Inpatient
      No - encounter.count: Outptient
    value_labels: labels
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - encounter.count,
            id: No - encounter.count, name: 'No'}, {axisId: Yes - encounter.count,
            id: Yes - encounter.count, name: 'Yes'}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital ID: organization.id
    row: 21
    col: 0
    width: 12
    height: 7
  - title: LOS by Encounter Type
    name: LOS by Encounter Type
    model: healthcare
    explore: encounter_extended
    type: looker_scatter
    fields: [encounter__type__coding.display, encounter.count, encounter.average_los,
      encounter__type__coding.code]
    filters:
      encounter.period__start_date: 1 years ago for 1 years
    sorts: [encounter__type__coding.display]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: encounter.average_los, name: Average Length of Stay}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: encounter.count
    hidden_fields: [encounter__type__coding.code]
    defaults_version: 1
    listen:
      Hospital ID: organization.id
    row: 11
    col: 14
    width: 10
    height: 7
  - title: LOS (Hours) Stats
    name: LOS (Hours) Stats
    model: healthcare
    explore: encounter_extended
    type: looker_column
    fields: [encounter.25_los, encounter.med_los, encounter.75_los]
    limit: 500
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.med_los, id: encounter.med_los,
            name: Median Length of Stay}, {axisId: encounter.25_los, id: encounter.25_los,
            name: 25th Percentile Length of Stay}, {axisId: encounter.75_los, id: encounter.75_los,
            name: 75th Percentile Length of Stay}], showLabels: false, showValues: false,
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors: {}
    series_labels:
      encounter.med_los: Median
      encounter.25_los: 25th Percentile
      encounter.75_los: 75th Percentile
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital ID: organization.id
    row: 3
    col: 18
    width: 6
    height: 8
  - title: Encounters by Top Condition
    name: Encounters by Top Condition
    model: healthcare
    explore: condition_extended
    type: looker_grid
    fields: [condition__code__coding.code, condition__code__coding.display, encounter.count,
      encounter.average_los]
    sorts: [encounter.count desc]
    limit: 20
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
      encounter.average_los:
        is_active: true
    defaults_version: 1
    listen:
      Hospital ID: organization.id
    row: 28
    col: 0
    width: 24
    height: 11
  - title: Patients by Age & Gender
    name: Patients by Age & Gender
    model: healthcare
    explore: condition_extended
    type: looker_column
    fields: [patient.age_tier, patient.gender, encounter.count_patients]
    pivots: [patient.gender]
    filters:
      patient.age_tier: "-Below 0"
    sorts: [patient.age_tier, patient.gender]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.average_los,
            id: female - encounter.average_los, name: female}, {axisId: encounter.average_los,
            id: male - encounter.average_los, name: male}], showLabels: false, showValues: true,
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
    series_colors:
      female - encounter.average_los: "#E9F3D1"
      male - encounter.average_los: "#2693D1"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital ID: organization.id
    row: 21
    col: 12
    width: 12
    height: 7
  - title: Number of OP Visits
    name: Number of OP Visits
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count, encounter.period__start_month]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.is_inpatient: 'No'
    sorts: [encounter.period__start_month desc]
    limit: 500
    dynamic_fields:
    - table_calculation: prior_year_month
      label: Prior Year Month
      expression: offset(${encounter.count},1)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Outpatient Visits - This Month
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital ID: organization.id
    row: 7
    col: 0
    width: 6
    height: 4
  - title: Avg ED Wait Time
    name: Avg ED Wait Time
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.average_los, encounter.period__start_year]
    fill_fields: [encounter.period__start_year]
    filters:
      encounter.code_name: Emergency Department
      encounter.length_of_stay: "<1000"
    sorts: [encounter.period__start_year desc]
    limit: 500
    dynamic_fields:
    - table_calculation: avg_wait_time_prior_year
      label: Avg Wait Time - Prior Year
      expression: offset(${encounter.average_los},1)
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Average ED Wait Time (Mins)
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 79.05, background_color: '',
        font_color: "#3b6d38", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Hospital ID: organization.id
    row: 7
    col: 12
    width: 6
    height: 4
  - title: 30-Day Readmission Rate
    name: 30-Day Readmission Rate
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
    listen: {}
    row: 3
    col: 6
    width: 6
    height: 4
  filters:
  - name: Hospital ID
    title: Hospital ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: healthcare
    explore: observation_extended
    listens_to_filters: []
    field: organization.id
