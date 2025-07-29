---
- dashboard: demo
  title: DEMO
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PGDYyCaCyeHuUkoxxBHIyX
  elements:
  - title: DEMO
    name: DEMO
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_month, order_items.total_sale_price]
    fill_fields: [order_items.created_month]
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
    temperature: 0.2
    prompt: summarize
    query: 日本語で返してください。箇条書きにしてもっとポップなテンションでお願いします
    insightImage: https://img.icons8.com/ios/50/light-on--v1.png
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: サマリ
    name: サマリ
    model: thelook
    explore: order_items
    type: genai_extensions::query_insights
    fields: [order_items.created_month, order_items.total_sale_price]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    temperature: 0.2
    prompt: sentiment
    query: 日本語にしてください。箇条書きにしてポップな表現にして。
    insightImage: https://img.icons8.com/ios/50/light-on--v1.png
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Created Date: order_items.created_date
    row:
    col:
    width:
    height:
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: last year, this year
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
- dashboard: demo__agent_performance
  title: Demo - Agent Performance
  layout: newspaper
  description: ''
  preferred_slug: fiF0vDfw9fx6Ya0Y3BEf06
  elements:
  - title: Number of Conversations
    name: Number of Conversations
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.count, transcript.conversation_start_week]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 2 weeks ago for 2 weeks
    sorts: [transcript.conversation_start_week desc]
    limit: 500
    dynamic_fields:
    - table_calculation: difference_in_calls
      label: 'Difference in # Calls'
      expression: "${transcript.count}-offset(${transcript.count},1)"
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
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Prior Week
    defaults_version: 1
    hidden_fields: [transcript.conversation_start_week]
    listen:
      Agent: agents.name
    row: 0
    col: 3
    width: 5
    height: 4
  - title: Average Call Duration
    name: Average Call Duration
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.average_conversation_duration]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: duration_in_minutes
      label: Duration in Minutes
      expression: "${transcript.average_conversation_duration}/60"
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
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Percent without Live Agent
    defaults_version: 1
    hidden_fields: [transcript.average_conversation_duration]
    listen:
      Agent: agents.name
    row: 0
    col: 8
    width: 5
    height: 4
  - title: High Value Clients
    name: High Value Clients
    model: call_center
    explore: transcript
    type: single_value
    fields: [client.number_of_clients]
    filters:
      transcript.count: ">0"
      transcript.conversation_start_date: 1 weeks ago for 1 weeks
      banking_client_facts.balance_yesterday: ">5000"
    limit: 15
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
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript.count, id: transcript.count,
            name: Number of Conversations}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: banking_client_facts.total_in_accounts_yesterday,
            id: banking_client_facts.total_in_accounts_yesterday, name: Total In Accounts
              Yesterday}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      banking_client_facts.total_in_accounts_yesterday: "#72D16D"
      transcript.count: "#FFD95F"
    defaults_version: 1
    listen:
      Agent: agents.name
    row: 4
    col: 8
    width: 5
    height: 4
  - title: Number of Conversations by Category
    name: Number of Conversations by Category
    model: call_center
    explore: transcript
    type: looker_area
    fields: [transcript__messages.number_of_messages, transcript__messages.issue_topic,
      transcript.conversation_start_week]
    pivots: [transcript__messages.issue_topic]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript__messages.issue_topic: "-NULL"
      transcript.conversation_start_week: 52 weeks ago for 52 weeks
    sorts: [transcript__messages.number_of_messages desc 0, transcript__messages.issue_topic]
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
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript__messages.number_of_messages,
            id: transcript__messages.number_of_messages, name: Number of Messages}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      Yes - transcript__messages.number_of_messages: "#E57947"
      Credit Card - transcript__messages.number_of_messages: "#3EB0D5"
      Change Personal Information - transcript__messages.number_of_messages: "#4276BE"
      Online Banking - transcript__messages.number_of_messages: "#75E2E2"
      Open a New Account - transcript__messages.number_of_messages: "#C2DD67"
      Speak with an Advisor - transcript__messages.number_of_messages: "#72D16D"
      Submit a Fraud Alert - transcript__messages.number_of_messages: "#FBB555"
    series_labels:
      Yes - transcript__messages.number_of_messages: From Live Agent
      No - transcript__messages.number_of_messages: From Virtual Agent
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Agent: agents.name
    row: 8
    col: 0
    width: 24
    height: 7
  - title: Average Sentiment
    name: Average Sentiment
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript__messages.average_sentiment, transcript__messages.average_sentiment_category]
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
    comparison_label: Sentiment
    defaults_version: 1
    listen:
      Agent: agents.name
    row: 4
    col: 3
    width: 5
    height: 4
  - title: Customer Ratings
    name: Customer Ratings
    model: call_center
    explore: transcript
    type: looker_grid
    fields: [satisfaction_ratings.conversation_id, satisfaction_ratings.comment, satisfaction_ratings.score,
      transcript.conversation_start_date]
    sorts: [transcript.conversation_start_date desc]
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
    listen:
      Agent: agents.name
    row: 15
    col: 0
    width: 12
    height: 10
  - title: Conversation Duration by Category
    name: Conversation Duration by Category
    model: call_center
    explore: transcript
    type: looker_column
    fields: [transcript.average_conversation_duration, transcript__messages.issue_topic,
      transcript.conversation_start_month]
    pivots: [transcript__messages.issue_topic]
    fill_fields: [transcript.conversation_start_month]
    filters:
      transcript.conversation_start_week: 1 years
    sorts: [transcript__messages.issue_topic]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_colors:
      Change Personal Information - transcript.average_conversation_duration: "#4276BE"
      Credit Card - transcript.average_conversation_duration: "#FBB555"
      Open a New Account - transcript.average_conversation_duration: "#592EC2"
      Speak with an Advisor - transcript.average_conversation_duration: "#3EB0D5"
      Submit a Fraud Alert - transcript.average_conversation_duration: "#FFD95F"
    defaults_version: 1
    listen:
      Agent: agents.name
    row: 15
    col: 12
    width: 12
    height: 10
  - title: Agent vs Client Speaking
    name: Agent vs Client Speaking
    model: call_center
    explore: transcript
    type: looker_donut_multiples
    fields: [transcript__messages.total_seconds_agent_speaking, transcript__messages.total_seconds_client_speaking]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    series_colors:
      transcript__messages.total_seconds_agent_speaking: "#4276BE"
      transcript__messages.total_seconds_client_speaking: "#FBB555"
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
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 0
    col: 13
    width: 7
    height: 8
  filters:
  - name: Agent
    title: Agent
    type: field_filter
    default_value: Tonya Koop
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: call_center
    explore: transcript
    listens_to_filters: []
    field: agents.name

---
- dashboard: demo__call_center_operations_
  title: 'Demo - Call Center Operations '
  layout: newspaper
  preferred_viewer: dashboards-next
  description: data from call center AI
  preferred_slug: qTM28GVcKGloxMtoLxIGDP
  elements:
  - title: Number of Calls
    name: Number of Calls
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.count, transcript.conversation_start_week]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 2 weeks ago for 2 weeks
    sorts: [transcript.conversation_start_week desc]
    limit: 500
    dynamic_fields:
    - table_calculation: difference_in_calls
      label: 'Difference in # Calls'
      expression: "${transcript.count}-offset(${transcript.count},1)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Prior Week
    defaults_version: 1
    hidden_fields: [transcript.conversation_start_week]
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 2
    col: 3
    width: 6
    height: 4
  - title: "% Calls Handled Without Live Agent"
    name: "% Calls Handled Without Live Agent"
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.conversation_start_week, transcript.percent_not_passed_to_live,
      goal]
    filters:
      transcript.conversation_start_week: 1 weeks ago for 1 weeks
    sorts: [transcript.conversation_start_week desc]
    limit: 500
    dynamic_fields:
    - dimension: goal
      label: Goal
      expression: 75/100
      value_format:
      value_format_name: percent_0
      _kind_hint: dimension
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
    comparison_label: Goal
    conditional_formatting: [{type: less than, value: 0.75, background_color: '',
        font_color: "#E57947", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [transcript.conversation_start_week]
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 2
    col: 9
    width: 6
    height: 4
  - name: Overall KPIs
    type: text
    title_text: Overall KPIs
    subtitle_text: Performance Indicators for the Last Complete Week
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Customer & Topic Overview
    type: text
    title_text: Customer & Topic Overview
    subtitle_text: How can we reduce the number of support calls needed?
    body_text: ''
    row: 10
    col: 0
    width: 24
    height: 2
  - name: Agent Performance
    type: text
    title_text: Agent Performance
    subtitle_text: Where do we need to improve our agents?
    body_text: ''
    row: 46
    col: 0
    width: 24
    height: 2
  - title: Avg Call Duration (min)
    name: Avg Call Duration (min)
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript.average_conversation_duration, transcript.conversation_start_week]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 2 weeks ago for 2 weeks
    sorts: [transcript.conversation_start_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: duration_in_minutes
      label: Duration in Minutes
      expression: "${transcript.average_conversation_duration}/60"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_change
      label: Percent Change
      expression: "(${transcript.average_conversation_duration} - offset(${transcript.average_conversation_duration},\
        \ 1)) / ${transcript.average_conversation_duration}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Prior
    defaults_version: 1
    hidden_fields: [transcript.average_conversation_duration]
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 2
    col: 15
    width: 6
    height: 4
  - title: Cost Savings Last Week
    name: Cost Savings Last Week
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript__messages.approximate_cost_savings, transcript__messages.percent_call_time_without_live_agent]
    filters:
      transcript.conversation_start_date: 1 weeks ago for 1 weeks
      transcript__messages.cost_per_hour: '15'
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
    comparison_label: Total Call time w/o Live
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 6
    col: 9
    width: 6
    height: 4
  - title: Average Sentiment Score
    name: Average Sentiment Score
    model: call_center
    explore: transcript
    type: single_value
    fields: [transcript__messages.average_sentiment, transcript__messages.average_sentiment_category]
    filters:
      transcript.conversation_start_date: 2 weeks ago for 2 weeks
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
    comparison_label: Sentiment
    conditional_formatting: [{type: less than, value: 0.7, background_color: '', font_color: "#E57947",
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 6
    col: 15
    width: 6
    height: 4
  - title: Topics That Virtual Agents Solve Well
    name: Topics That Virtual Agents Solve Well
    model: call_center
    explore: transcript
    type: looker_bar
    fields: [transcript__messages.issue_subtopic, transcript__messages.percent_of_messages_without_live_agent,
      transcript__messages.total_call_time]
    filters:
      transcript__messages.issue_topic: "-NULL"
    sorts: [transcript__messages.percent_of_messages_without_live_agent]
    limit: 15
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
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: transcript__messages.total_call_time,
            id: transcript__messages.total_call_time, name: Total Call Time}], showLabels: true,
        showValues: true, minValue: 0.75, valueFormat: '0,,"M"', unpinAxis: true,
        tickDensity: custom, type: linear}, {label: Messages w/o Live Agent, orientation: bottom,
        series: [{axisId: transcript__messages.percent_of_messages_without_live_agent,
            id: transcript__messages.percent_of_messages_without_live_agent, name: Percent
              of Messages Without Live Agent}], showLabels: true, showValues: true,
        minValue: 0.75, unpinAxis: true, tickDensity: default, type: linear}]
    size_by_field: transcript__messages.total_call_time
    series_colors:
      Yes - transcript__messages.number_of_messages: "#E57947"
      conversation_topic_facts.average_conversation_length: "#FBB555"
      transcript__messages.percent_of_messages_without_live_agent: "#3EB0D5"
      transcript__messages.total_call_time: "#75E2E2"
    series_labels:
      Yes - transcript__messages.number_of_messages: From Live Agent
      No - transcript__messages.number_of_messages: From Virtual Agent
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 28
    col: 0
    width: 12
    height: 9
  - title: Areas Where Clients Are Happier with Live Agent
    name: Areas Where Clients Are Happier with Live Agent
    model: call_center
    explore: transcript
    type: looker_bar
    fields: [transcript__messages.issue_topic, transcript__messages.average_sentiment,
      transcript__messages.live_agent]
    pivots: [transcript__messages.live_agent]
    fill_fields: [transcript__messages.live_agent]
    sorts: [transcript__messages.live_agent 0, transcript__messages.issue_topic desc]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: transcript__messages.average_sentiment,
            id: No - transcript__messages.average_sentiment, name: Virtual Agent},
          {axisId: transcript__messages.average_sentiment, id: Yes - transcript__messages.average_sentiment,
            name: Live Agent}], showLabels: false, showValues: true, minValue: 0.45,
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors: {}
    series_labels:
      Yes - transcript__messages.average_sentiment: Live Agent
      No - transcript__messages.average_sentiment: Virtual Agent
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 28
    col: 12
    width: 12
    height: 9
  - title: "# Conversations by Category"
    name: "# Conversations by Category"
    model: call_center
    explore: transcript
    type: looker_area
    fields: [transcript__messages.number_of_messages, transcript__messages.issue_topic,
      transcript.conversation_start_week]
    pivots: [transcript__messages.issue_topic]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript__messages.issue_topic: "-NULL"
      transcript.conversation_start_week: 52 weeks ago for 52 weeks
    sorts: [transcript__messages.number_of_messages desc 0, transcript__messages.issue_topic]
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
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript__messages.number_of_messages,
            id: transcript__messages.number_of_messages, name: Number of Messages}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      Yes - transcript__messages.number_of_messages: "#E57947"
      Credit Card - transcript__messages.number_of_messages: "#3EB0D5"
      Change Personal Information - transcript__messages.number_of_messages: "#4276BE"
      Online Banking - transcript__messages.number_of_messages: "#75E2E2"
      Open a New Account - transcript__messages.number_of_messages: "#C2DD67"
      Speak with an Advisor - transcript__messages.number_of_messages: "#72D16D"
      Submit a Fraud Alert - transcript__messages.number_of_messages: "#FBB555"
    series_labels:
      Yes - transcript__messages.number_of_messages: From Live Agent
      No - transcript__messages.number_of_messages: From Virtual Agent
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 19
    col: 11
    width: 13
    height: 7
  - title: Wait Time Tiers
    name: Wait Time Tiers
    model: call_center
    explore: transcript
    type: looker_column
    fields: [transcript__messages.number_of_messages, transcript__messages.wait_time_tier,
      transcript__messages.issue_topic]
    pivots: [transcript__messages.issue_topic]
    filters:
      transcript__messages.wait_time_tier: "-Undefined"
      transcript__messages.live_agent: 'Yes'
    sorts: [transcript__messages.wait_time_tier, transcript__messages.issue_topic]
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
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript__messages.number_of_messages,
            id: transcript__messages.number_of_messages, name: Number of Messages}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors: {}
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 48
    col: 0
    width: 12
    height: 8
  - title: Live Agent Performance Review
    name: Live Agent Performance Review
    model: call_center
    explore: transcript
    type: looker_grid
    fields: [agents.name, transcript.average_conversation_duration, satisfaction_ratings.average_csat,
      transcript.count, transcript__messages.average_sentiment, transcript__messages.number_of_messages,
      transcript__messages.average_wait_time, agents.hire_date]
    filters:
      transcript.conversation_start_date: 1 weeks ago for 1 weeks
    sorts: [transcript.average_conversation_duration]
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: true
    series_labels:
      transcript__messages.number_of_messages: Number of Messages
      transcript__messages.average_wait_time: Avg Wait Time
    series_cell_visualizations:
      transcript.average_conversation_duration:
        is_active: true
        palette:
          palette_id: 31046485-0ab5-406e-b80e-e780acab5160
          collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      satisfaction_ratings.average_csat:
        is_active: true
        palette:
          palette_id: 628a997f-dd44-4060-a913-250041880199
          collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      transcript__messages.average_sentiment:
        is_active: true
        palette:
          palette_id: be8327bf-9384-449e-8412-84949763505b
          collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      transcript__messages.number_of_messages:
        is_active: true
      transcript__messages.average_wait_time:
        is_active: true
        palette:
          palette_id: 31046485-0ab5-406e-b80e-e780acab5160
          collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      transcript.count:
        is_active: true
        palette:
          palette_id: be8327bf-9384-449e-8412-84949763505b
          collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#215AC8",
        font_color: !!null '', color_application: {collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd,
          palette_id: 628a997f-dd44-4060-a913-250041880199}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: transcript.average_conversation_duration,
            id: transcript.average_conversation_duration, name: Average Conversation
              Duration}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
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
    series_colors:
      transcript.average_conversation_duration: "#72D16D"
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
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 56
    col: 0
    width: 24
    height: 8
  - title: High Value At Risk Clients
    name: High Value At Risk Clients
    model: call_center
    explore: transcript
    type: single_value
    fields: [banking_client_facts.high_value_clients, client.number_of_clients]
    filters:
      transcript.count: ">0"
      transcript.conversation_start_date: 2 weeks ago for 2 weeks
      transcript__messages.message_sentiment: "<.2"
    limit: 15
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
    comparison_label: Total At Risk
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript.count, id: transcript.count,
            name: Number of Conversations}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: banking_client_facts.total_in_accounts_yesterday,
            id: banking_client_facts.total_in_accounts_yesterday, name: Total In Accounts
              Yesterday}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      banking_client_facts.total_in_accounts_yesterday: "#72D16D"
      transcript.count: "#FFD95F"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: High value customers have more than $50K in account on average
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 6
    col: 3
    width: 6
    height: 4
  - name: Virtual Agent Performance
    type: text
    title_text: Virtual Agent Performance
    subtitle_text: How can we make our virtual agents better?
    body_text: ''
    row: 26
    col: 0
    width: 24
    height: 2
  - title: Common Undetected Phrases (4 Words)
    name: Common Undetected Phrases (4 Words)
    model: call_center
    explore: transcript
    type: looker_grid
    fields: [ngrams__question_gram.question_gram, ngrams__question_gram.count, transcript__messages.average_sentiment]
    filters:
      transcript.conversation_start_date: 7 days
      transcript__messages.number_words_gram: '4'
      transcript.passed_to_live_agent: 'Yes'
    sorts: [ngrams__question_gram.count desc]
    limit: 20
    column_limit: 50
    row_total: right
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
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      ngrams__question_gram.count:
        is_active: true
      transcript__messages.average_sentiment:
        is_active: true
        palette:
          palette_id: 5378478f-6725-4b04-89cc-75fc42da804e
          collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: ab3e6420-3e2f-42a2-802b-e4e9036b089f}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: Number of Messages, orientation: left, series: [{axisId: ngrams__question_gram.count,
            id: ngrams__question_gram.count, name: N - Grams}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: transcript__messages.average_sentiment,
            id: transcript__messages.average_sentiment, name: Average Sentiment}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
    size_by_field: transcript__messages.average_sentiment
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle
    series_colors:
      transcript__messages.average_sentiment: "#75E2E2"
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
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 37
    col: 0
    width: 12
    height: 9
  - title: Calls by Customer Segmentation
    name: Calls by Customer Segmentation
    model: call_center
    explore: transcript
    type: looker_bar
    fields: [client.customer_segment, transcript.count, transcript__messages.issue_topic]
    pivots: [transcript__messages.issue_topic]
    sorts: [transcript.count desc 0, transcript__messages.issue_topic]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Change Personal Information
              - transcript.count, id: Change Personal Information - transcript.count,
            name: Change Personal Information}, {axisId: Credit Card - transcript.count,
            id: Credit Card - transcript.count, name: Credit Card}, {axisId: Online
              Banking - transcript.count, id: Online Banking - transcript.count, name: Online
              Banking}, {axisId: Open a New Account - transcript.count, id: Open a
              New Account - transcript.count, name: Open a New Account}, {axisId: Speak
              with an Advisor - transcript.count, id: Speak with an Advisor - transcript.count,
            name: Speak with an Advisor}, {axisId: Submit a Fraud Alert - transcript.count,
            id: Submit a Fraud Alert - transcript.count, name: Submit a Fraud Alert}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      Submit a Fraud Alert - transcript.count: "#FBB555"
      Credit Card - transcript.count: "#3EB0D5"
      Change Personal Information - transcript.count: "#592EC2"
      Online Banking - transcript.count: "#75E2E2"
      Open a New Account - transcript.count: "#C2DD67"
      Speak with an Advisor - transcript.count: "#72D16D"
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 12
    col: 0
    width: 11
    height: 7
  - title: Categories That Often Require Followup
    name: Categories That Often Require Followup
    model: call_center
    explore: transcript
    type: looker_donut_multiples
    fields: [transcript.count, transcript.resolved_on_call, transcript__messages.issue_topic]
    pivots: [transcript.resolved_on_call]
    fill_fields: [transcript.resolved_on_call]
    filters:
      transcript.passed_to_live_agent: 'Yes'
    sorts: [transcript.count desc 0, transcript.resolved_on_call]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 10
    charts_across: 3
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_colors:
      No - transcript.count: "#FC2E31"
      Yes - transcript.count: "#FCBF00"
    series_labels:
      No - transcript.count: Requires a Follow Up
      Yes - transcript.count: Resolved on First Touch
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 48
    col: 12
    width: 12
    height: 8
  - title: Conversation Volume
    name: Conversation Volume
    model: call_center
    explore: transcript
    type: looker_column
    fields: [transcript.count, transcript.conversation_start_hour_of_day, transcript.conversation_start_day_of_week]
    pivots: [transcript.conversation_start_hour_of_day]
    fill_fields: [transcript.conversation_start_hour_of_day, transcript.conversation_start_day_of_week]
    filters:
      transcript.conversation_start_date: 1 weeks ago for 1 weeks,NOT NULL
    sorts: [transcript.conversation_start_hour_of_day 0, transcript.conversation_start_day_of_week]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript.count, id: 0
              - transcript.count, name: '0'}, {axisId: transcript.count, id: 1 - transcript.count,
            name: '1'}, {axisId: transcript.count, id: 2 - transcript.count, name: '2'},
          {axisId: transcript.count, id: 3 - transcript.count, name: '3'}, {axisId: transcript.count,
            id: 4 - transcript.count, name: '4'}, {axisId: transcript.count, id: 5
              - transcript.count, name: '5'}, {axisId: transcript.count, id: 6 - transcript.count,
            name: '6'}, {axisId: transcript.count, id: 7 - transcript.count, name: '7'},
          {axisId: transcript.count, id: 8 - transcript.count, name: '8'}, {axisId: transcript.count,
            id: 9 - transcript.count, name: '9'}, {axisId: transcript.count, id: 10
              - transcript.count, name: '10'}, {axisId: transcript.count, id: 11 -
              transcript.count, name: '11'}, {axisId: transcript.count, id: 12 - transcript.count,
            name: '12'}, {axisId: transcript.count, id: 13 - transcript.count, name: '13'},
          {axisId: transcript.count, id: 14 - transcript.count, name: '14'}, {axisId: transcript.count,
            id: 15 - transcript.count, name: '15'}, {axisId: transcript.count, id: 16
              - transcript.count, name: '16'}, {axisId: transcript.count, id: 17 -
              transcript.count, name: '17'}, {axisId: transcript.count, id: 18 - transcript.count,
            name: '18'}, {axisId: transcript.count, id: 19 - transcript.count, name: '19'},
          {axisId: transcript.count, id: 20 - transcript.count, name: '20'}, {axisId: transcript.count,
            id: 21 - transcript.count, name: '21'}, {axisId: transcript.count, id: 22
              - transcript.count, name: '22'}, {axisId: transcript.count, id: 23 -
              transcript.count, name: '23'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    hide_legend: true
    series_colors:
      0 - transcript.count: "#4276BE"
      1 - transcript.count: "#4276BE"
      2 - transcript.count: "#4276BE"
      3 - transcript.count: "#4276BE"
      5 - transcript.count: "#4276BE"
      6 - transcript.count: "#4276BE"
      7 - transcript.count: "#4276BE"
      8 - transcript.count: "#4276BE"
      9 - transcript.count: "#4276BE"
      10 - transcript.count: "#4276BE"
      11 - transcript.count: "#4276BE"
      12 - transcript.count: "#4276BE"
      13 - transcript.count: "#4276BE"
      14 - transcript.count: "#4276BE"
      23 - transcript.count: "#4276BE"
      22 - transcript.count: "#4276BE"
      21 - transcript.count: "#4276BE"
      20 - transcript.count: "#4276BE"
      19 - transcript.count: "#4276BE"
      18 - transcript.count: "#4276BE"
      17 - transcript.count: "#4276BE"
      16 - transcript.count: "#4276BE"
      15 - transcript.count: "#4276BE"
      4 - transcript.count: "#4276BE"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 12
    col: 11
    width: 13
    height: 7
  - title: Areas Where Calls Are Shorter with Live Agent
    name: Areas Where Calls Are Shorter with Live Agent
    model: call_center
    explore: transcript
    type: looker_column
    fields: [transcript__messages.issue_topic, transcript__messages.live_agent, transcript.average_conversation_duration]
    pivots: [transcript__messages.live_agent]
    fill_fields: [transcript__messages.live_agent]
    sorts: [transcript__messages.live_agent 0, transcript__messages.issue_topic desc]
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
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript.average_conversation_duration,
            id: No - transcript.average_conversation_duration, name: Virtual Agent},
          {axisId: transcript.average_conversation_duration, id: Yes - transcript.average_conversation_duration,
            name: Live Agent}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      No - transcript.average_conversation_duration: "#E57947"
      Yes - transcript.average_conversation_duration: "#6A013A"
    series_labels:
      Yes - transcript__messages.average_sentiment: Live Agent
      No - transcript__messages.average_sentiment: Virtual Agent
      No - transcript.average_conversation_duration: Virtual Agent
      Yes - transcript.average_conversation_duration: Live Agent
    defaults_version: 1
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 37
    col: 12
    width: 12
    height: 9
  - title: Repeat Callers
    name: Repeat Callers
    model: call_center
    explore: transcript
    type: looker_pie
    fields: [transcript.count, transcript.is_first_call]
    fill_fields: [transcript.is_first_call]
    sorts: [transcript.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Percent of Total
      value_format:
      value_format_name: percent_2
      calculation_type: percent_of_column_sum
      table_calculation: percent_of_total
      args:
      - transcript.count
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors: {}
    series_labels:
      'No': Repeat
      'Yes': First
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
    hidden_fields: []
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Name: agents.name
      Account ID: banking_client_facts.account_id
      Customer Satisfaction Rating: satisfaction_ratings.score
    row: 19
    col: 0
    width: 11
    height: 7
  filters:
  - name: Name
    title: Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: call_center
    explore: transcript
    listens_to_filters: []
    field: agents.name
  - name: Account ID
    title: Account ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '1'
      - '2'
      - '3'
    model: call_center
    explore: transcript
    listens_to_filters: []
    field: banking_client_facts.account_id
  - name: Customer Satisfaction Rating
    title: Customer Satisfaction Rating
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: call_center
    explore: transcript
    listens_to_filters: []
    field: satisfaction_ratings.score

---
- dashboard: demo__test
  title: Demo - test
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: FawbW1j7UW7F5YqxBHfyzK
  elements:
  - title: Demo - test
    name: Demo - test
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, products.category, order_items.created_year]
    pivots: [order_items.created_year]
    filters: {}
    sorts: [order_items.created_year desc, order_items.total_sale_price desc 0]
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
      Created Year: order_items.created_year
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: this year, last year
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
- dashboard: demo_3_36
  title: demo 3_36
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: I6yWukgqNjECNpjCq8hbIp
  elements:
  - title: Monthly Profit for Last Year
    name: Monthly Profit for Last Year
    model: thelook
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.total_gross_margin, order_items.created_month_name]
    pivots: [products.category]
    fill_fields: [order_items.created_month_name]
    filters: {}
    sorts: [products.category]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    y_axes: []
    listen:
      Category: products.category
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [products.item_name, products.category, order_items.average_shipping_time,
      order_items.total_gross_margin_percentage, order_items.count]
    filters:
      products.category: Jeans,Accessories
      order_items.count: ">3000"
    sorts: [order_items.average_shipping_time asc, order_items.total_gross_margin_percentage
        desc 0]
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
      Created Date: order_items.created_date
    row: 12
    col: 0
    width: 14
    height: 9
  - title: New Tile
    name: New Tile (2)
    model: thelook
    explore: order_items
    type: looker_column
    fields: [products.category, order_items.total_sale_price]
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
      Created Date: order_items.created_date
    row: 21
    col: 0
    width: 8
    height: 6
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
  - name: Category
    title: Category
    type: field_filter
    default_value: Jeans,Accessories
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.category

---
- dashboard: demo_dashboard_
  title: 'Demo Dashboard '
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: KziCBSlF42BYppNK6rYymj
  elements:
  - title: " Order Count by Created Month"
    name: " Order Count by Created Month"
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.count, order_items.created_month, products.category]
    pivots: [products.category]
    fill_fields: [order_items.created_month]
    sorts: [products.category, order_items.created_month desc]
    limit: 500
    column_limit: 50
    analysis_config:
      forecasting:
      - field_name: order_items.count
        forecast_n: 3
        forecast_interval: month
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
    map_plot_mode: heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 16
    height: 8
  - title: New Tile
    name: New Tile
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.count, order_items.created_month]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    analysis_config:
      forecasting:
      - field_name: order_items.count
        forecast_n: 3
        forecast_interval: month
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
    map_plot_mode: heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    hidden_pivots: {}
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:
  - title: Test Tile
    name: Test Tile
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.count, order_items.created_month]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    analysis_config:
      forecasting:
      - field_name: order_items.count
        forecast_n: 3
        forecast_interval: month
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
    map_plot_mode: heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
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
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    hidden_pivots: {}
    y_axes: []
    listen: {}
    row:
    col:
    width:
    height:

---
- dashboard: demo_dashboard
  title: Demo Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: gx0zKZlzKgILTE5bbsp0Df
  elements:
  - title: CTR vs Impressiosn
    name: CTR vs Impressiosn
    model: thelook_adwords
    explore: events
    type: looker_column
    fields: [adevents.click_rate, campaigns.campaign_name, adevents.total_clicks,
      adevents.total_impressions]
    filters:
      adevents.total_impressions: ">=7000"
    sorts: [adevents.click_rate desc 0]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: adevents.click_rate,
            id: adevents.click_rate, name: Click Through Rate (CTR)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: adevents.total_impressions,
            id: adevents.total_impressions, name: Total Impressions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      adevents.total_impressions: line
    series_colors:
      adevents.total_impressions: "#EA4335"
    defaults_version: 1
    hidden_fields: [adevents.total_clicks]
    listen:
      Created Date: adevents.created_date
      Device Type: adevents.device_type
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: adevents.created_date
  - name: Device Type
    title: Device Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: adevents.device_type

---
- dashboard: demo_dashboard_summary
  title: Demo Dashboard Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1c1ZM0OLwyN4aq20jDJ4Xc
  elements:
  - title: Total Revenue (Last Month)
    name: Total Revenue (Last Month)
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 5000
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
    y_axes: []
    listen: {}
    row: 0
    col: 8
    width: 16
    height: 3
  - title: Top Performing Categories
    name: Top Performing Categories
    model: thelook
    explore: order_items
    type: looker_column
    fields: [products.category, order_items.total_sale_price, order_items.total_gross_margin]
    filters:
      order_items.created_date: last year
    sorts: [order_items.total_sale_price desc 0]
    limit: 20
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
    note_state: collapsed
    note_display: hover
    note_text: This chart displays the top performing categories in the last year.
      It shows both total sales and total profit. Highlight categories that have high
      total gross margin, despite not being the top in sales. Identify opportunities
      to promote more profitable categories.
    listen: {}
    row: 3
    col: 16
    width: 8
    height: 9
  - title: Monthly Sales Trend
    name: Monthly Sales Trend
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 12 month ago for 12 month
    sorts: [order_items.created_month desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: 'if(${order_items.created_month}<=add_months(-1,now()),"No","Yes") '
      label: Is Forecasted?
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: is_forecasted
      _type_hint: string
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: order_items.total_sale_price
        forecast_n: 6
        forecast_interval: month
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
    hidden_fields: [is_forecasted]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: This query is a monthly sales forecast for the next 6 months. It includes
      historic monthly sales data and an ARIMA time-series forecast for the next 6
      months as indicated by "Is Forecasted?". Please identify seasonality of the
      business, sales trends, forecast analysis and make suggestions for improving
      sales.
    listen: {}
    row: 3
    col: 8
    width: 8
    height: 9
  - type: extension
    extension_id: genai_extensions::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 0
    col: 0
    width: 8
    height: 12

---
- dashboard: demo_mar29
  title: Demo mar29
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: wz3ORELraPCgilhagSrm65
  elements:
  - title: Demo mar29
    name: Demo mar29
    model: thelook
    explore: order_items
    type: looker_waterfall
    fields: [products.item_name, order_items.total_sale_price]
    filters: {}
    sorts: [order_items.total_sale_price desc 0]
    limit: 25
    column_limit: 50
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
- dashboard: demo_3_26
  title: demo_3_26
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: 1hMnEA7l0Ub5kcxSKwKArD
  elements:
  - title: demo_3_26
    name: demo_3_26
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters: {}
    limit: 5000
    column_limit: 50
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row:
    col:
    width:
    height:
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: last month
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
- dashboard: demo_centria
  title: demo_centria
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: Jy0haJRCW0D0X2wqAHihTt
  elements:
  - title: demo_centria
    name: demo_centria
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
  - name: Total Sale Price
    title: Total Sale Price
    type: field_filter
    default_value: ">50"
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

---
- dashboard: demo_financiera
  title: demo_financiera
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: yayn1yJuORKxy9D88yuHnr
  elements:
  - title: demo_financiera
    name: demo_financiera
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_date]
    filters: {}
    sorts: [order_items.created_date asc, order_items.total_sale_price desc 0]
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
    defaults_version: 1
    y_axes: []
    listen:
      Category: products.category
    row: 0
    col: 0
    width: 14
    height: 4
  filters:
  - name: Category
    title: Category
    type: field_filter
    default_value: Dresses
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.category

---
- dashboard: demo_looker
  title: demo_looker
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: K7sKfpFAchUeOdJIofQmTe
  elements:
  - title: demo_looker
    name: demo_looker
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.email, products.brand, order_items.total_sale_price]
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
- dashboard: demo_looker_cap
  title: demo_looker_cap
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: MyxFoSaw3oLha05zgTkcDK
  elements:
  - title: demo_looker_cap
    name: demo_looker_cap
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.count, order_items.created_date]
    filters: {}
    sorts: [order_items.count desc 0]
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
    defaults_version: 1
    y_axes: []
    listen:
      Category: products.category
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Category
    title: Category
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
    field: products.category

---
- dashboard: digital_marketing_saas
  title: Digital Marketing Saas
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: FvEOgYbzgl0iFBT2tAQJnP
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
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
      Traffic Source: sessions.traffic_source
    row: 4
    col: 0
    width: 14
    height: 7
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
      Traffic Source: sessions.traffic_source
    row: 21
    col: 12
    width: 12
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 14
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
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
      Traffic Source: sessions.traffic_source
    row: 0
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
      Traffic Source: sessions.traffic_source
    row: 0
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
      Traffic Source: sessions.traffic_source
    row: 0
    col: 5
    width: 4
    height: 4
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
      Traffic Source: sessions.traffic_source
    row: 14
    col: 0
    width: 12
    height: 14
  - name: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    subtitle_text: Where are our customers coming from and when do they drop off?
    row: 11
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
      Traffic Source: sessions.traffic_source
    row: 0
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
    table_theme: transparent
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
    sessions.session_start_date: 3 months
    session_attribution.total_attribution: Revenue
    campaigns.campaign_name: 237
    adevents.total_cost:
    session_attribution.ROI:
    is_active: false
    format_string: "#,##0%"
    label: Percent (0)
    defaults_version: 1
    listen:
      Traffic Source: sessions.traffic_source
    row: 4
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
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: sessions.traffic_source

---
- dashboard: digital_marketing_saas_copy
  title: Digital Marketing Saas (copy)
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: 5Ui9Qf5KQaat3XmRlbjIEB
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
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
      Traffic Source: sessions.traffic_source
      Category: products.category
    row: 4
    col: 0
    width: 14
    height: 7
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
      Traffic Source: sessions.traffic_source
      Category: products.category
    row: 21
    col: 12
    width: 12
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
    listen:
      Traffic Source: sessions.traffic_source
      Category: products.category
    row: 14
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
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
      Acquisition Date: adevents.created_date
      Traffic Source: sessions.traffic_source
    row: 0
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
      Traffic Source: sessions.traffic_source
    row: 0
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
      Traffic Source: sessions.traffic_source
    row: 0
    col: 5
    width: 4
    height: 4
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
      Traffic Source: sessions.traffic_source
      Category: products.category
    row: 14
    col: 0
    width: 12
    height: 14
  - name: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Customer Behavior</span>"
    subtitle_text: Where are our customers coming from and when do they drop off?
    row: 11
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
      Traffic Source: sessions.traffic_source
    row: 0
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 4
    col: 14
    width: 10
    height: 7
  filters:
  - name: Acquisition Date
    title: Acquisition Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: sessions.traffic_source
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: products.category

---
- dashboard: digital_marketing_saas_labs
  title: Digital Marketing Saas Labs
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: g5DEyRVLCuY40kmOyTAWps
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
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
      Traffic Source: sessions.traffic_source
      Category: products.category
    row: 3
    col: 0
    width: 24
    height: 8
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 9
    width: 5
    height: 3
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
      Acquisition Date: adevents.created_date
      Traffic Source: sessions.traffic_source
    row: 0
    col: 0
    width: 5
    height: 3
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
      Traffic Source: sessions.traffic_source
    row: 0
    col: 14
    width: 5
    height: 3
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
      Traffic Source: sessions.traffic_source
    row: 0
    col: 5
    width: 4
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
      Traffic Source: sessions.traffic_source
    row: 0
    col: 19
    width: 5
    height: 3
  filters:
  - name: Acquisition Date
    title: Acquisition Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: sessions.traffic_source
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

---
- dashboard: digital_marketing_saas_labs_copy_2
  title: Digital Marketing Saas Labs (copy 2)
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: 2y7g2Ujdboj8W3aYwbnSOb
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
      adevents.adevent_id: NOT NULL
    sorts: [sessions.session_start_month]
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
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{id: adevents.total_cost, name: Total
              Spend, axisId: adevents.total_cost}, {id: session_purchase_facts.revenue,
            name: Revenue, axisId: session_purchase_facts.revenue}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', valueFormat: "$#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 11, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [user_session_fact.average_engagement, user_session_fact.average_loyalty]
    hide_legend: true
    series_colors: {}
    label_color: []
    ordering: none
    show_null_labels: false
    hidden_fields: []
    defaults_version: 1
    listen:
      Traffic Source: sessions.traffic_source
      Category: products.category
      State: events.state
    row: 3
    col: 0
    width: 24
    height: 8
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 10
    width: 8
    height: 3
  - title: Revenue
    name: Revenue
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [session_attribution.total_attribution, sessions.session_start_quarter]
    fill_fields: [sessions.session_start_quarter]
    filters:
      session_attribution.attribution_source: ''
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Revenue
    value_format: "$#,##0"
    comparison_label: Prior Quarter
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
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    defaults_version: 1
    listen:
      Acquisition Date: adevents.created_date
      Traffic Source: sessions.traffic_source
    row: 0
    col: 0
    width: 5
    height: 3
  - title: Purchases
    name: Purchases
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [sessions.count_with_purchase, session_attribution.last_session_end_quarter]
    fill_fields: [session_attribution.last_session_end_quarter]
    filters:
      session_attribution.attribution_source: ''
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Users Acquired
    name: Users Acquired
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [user_session_fact.count, user_session_fact.first_visit_quarter]
    fill_fields: [user_session_fact.first_visit_quarter]
    filters:
      session_attribution.attribution_source: ''
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 5
    width: 5
    height: 3
  filters:
  - name: Acquisition Date
    title: Acquisition Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: sessions.traffic_source
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
  - name: State
    title: State
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
    field: events.state

---
- dashboard: digital_marketing_saas_labs_copy
  title: Digital Marketing Saas Labs (copy)
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  query_timezone: user_timezone
  preferred_slug: Ad5U0ox7Ecymrbu7lnVkk8
  elements:
  - title: Customer Trends
    name: Customer Trends
    model: thelook_adwords
    explore: events
    type: looker_area
    fields: [sessions.session_start_month, adevents.total_cost, session_purchase_facts.revenue]
    filters:
      adevents.total_cost: ">0"
      adevents.adevent_id: NOT NULL
    sorts: [sessions.session_start_month]
    limit: 500
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: false
    interpolation: step
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: adevents.total_cost,
            id: adevents.total_cost, name: Total Spend}, {axisId: session_purchase_facts.revenue,
            id: session_purchase_facts.revenue, name: Revenue}], showLabels: false,
        showValues: true, maxValue: !!null '', minValue: !!null '', valueFormat: "$#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 11, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [user_session_fact.average_engagement, user_session_fact.average_loyalty]
    hide_legend: true
    series_colors: {}
    label_color: []
    ordering: none
    show_null_labels: false
    hidden_fields: []
    defaults_version: 1
    title_hidden: true
    listen:
      Traffic Source: sessions.traffic_source
      Category: products.category
      State: events.state
    row: 3
    col: 0
    width: 24
    height: 8
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
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 11
    width: 6
    height: 3
  - title: Revenue
    name: Revenue
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [session_attribution.total_attribution, sessions.session_start_quarter]
    fill_fields: [sessions.session_start_quarter]
    filters:
      session_attribution.attribution_source: ''
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Revenue
    value_format: "$#,##0"
    comparison_label: Prior Quarter
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
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    defaults_version: 1
    listen:
      Acquisition Date: adevents.created_date
      Traffic Source: sessions.traffic_source
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Purchases
    name: Purchases
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [sessions.count_with_purchase, session_attribution.last_session_end_quarter]
    fill_fields: [session_attribution.last_session_end_quarter]
    filters:
      session_attribution.attribution_source: ''
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 17
    width: 7
    height: 3
  - title: Users Acquired
    name: Users Acquired
    model: thelook_adwords
    explore: sessions
    type: single_value
    fields: [user_session_fact.count, user_session_fact.first_visit_quarter]
    fill_fields: [user_session_fact.first_visit_quarter]
    filters:
      session_attribution.attribution_source: ''
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    listen:
      Traffic Source: sessions.traffic_source
    row: 0
    col: 6
    width: 5
    height: 3
  filters:
  - name: Acquisition Date
    title: Acquisition Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: thelook_adwords
    explore: events
    listens_to_filters: []
    field: sessions.traffic_source
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
  - name: State
    title: State
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
    field: events.state

---
- dashboard: drills_and_cross_filters
  title: Drills and Cross Filters
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: qQFvqNqHLRi2c5Spop5GIS
  elements:
  - title: Sales and Users by State
    name: Sales and Users by State
    model: thelook
    explore: order_items
    type: looker_geo_choropleth
    fields: [order_items.total_sale_price, users.state, users.count]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 8
    col: 0
    width: 9
    height: 5
  - title: Sales and Users By Zip
    name: Sales and Users By Zip
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.zip, users.count]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 9
    width: 8
    height: 9
  - title: Sales and Users by Coordinates
    name: Sales and Users by Coordinates
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.count, users.location]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: person
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_max: 10
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 17
    width: 7
    height: 9
  - title: Top Categories
    name: Top Categories
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [order_items.total_sale_price, products.category]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 2
    col: 0
    width: 9
    height: 6
  - title: Sales by Month
    name: Sales by Month
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      users.country: USA
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Order Items Total Sale Price}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 9
    width: 15
    height: 4
  - title: Total Sales
    name: Total Sales
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
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
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 9
    height: 2
  - title: Tabular Sales
    name: Tabular Sales
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.state, users.city, order_items.count, order_items.total_sale_price,
      users.count]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${order_items.total_sale_price}/${users.count}"
      label: Avg Sales Per User
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: avg_sales_per_user
      _type_hint: number
    show_view_names: true
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
      order_items.count: Order Items
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
      users.count:
        is_active: true
      order_items.count:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [avg_sales_per_user]}]
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    hidden_pivots: {}
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 13
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 12 month ago for 12 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date

---
- dashboard: ecommerce_discount_portal
  title: E-Commerce Discount Portal
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: GQzBWKphXbfH61dZafGmMd
  elements:
  - title: E-Commerce Writeback
    name: E-Commerce Writeback
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [inventory_items.created_date, products.item_name, products.category,
      inventory_items.cost, products.retail_price, inventory_items.id, products.id]
    filters:
      inventory_items.sold_date: 'NULL'
    sorts: [inventory_items.created_date desc]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [inventory_items.id, products.id]
    y_axes: []
    listen:
      Days in Inventory: inventory_items.days_in_inventory_tier
    row: 2
    col: 0
    width: 13
    height: 17
  - title: Discounts
    name: Discounts
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [discounts.date_date, products.item_name, discounts.discount_price, discounts.discount_amount,
      discounts.retail_price]
    sorts: [discounts.date_date desc]
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
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5, constraints: {min: {type: minimum}}, reverse: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          discounts.discount_amount]}]
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
    y_axes: []
    listen: {}
    row: 2
    col: 13
    width: 11
    height: 6
  - name: ''
    type: text
    title_text: ''
    body_text: "# Discounted Items"
    row: 0
    col: 13
    width: 11
    height: 2
  - title: Discounted Items by Category
    name: Discounted Items by Category
    model: thelook
    explore: order_items
    type: looker_bar
    fields: [products.category, products.count]
    filters:
      discounts.product_id: NOT NULL
    sorts: [products.count desc]
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
    row: 8
    col: 13
    width: 6
    height: 11
  - title: Discounts by Department
    name: Discounts by Department
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [products.count, products.department]
    filters:
      discounts.product_id: NOT NULL
    sorts: [products.count desc]
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
    y_axes: []
    listen: {}
    row: 8
    col: 19
    width: 5
    height: 11
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "# Unsold Items"
    row: 0
    col: 0
    width: 13
    height: 2
  filters:
  - name: Days in Inventory
    title: Days in Inventory
    type: field_filter
    default_value: 80 to 159
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: inventory_items.days_in_inventory_tier

---
- dashboard: ebanx
  title: ebanx
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: 1a6HrzY6AK9bnckTfy459B
  elements:
  - title: ebanx
    name: ebanx
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.order_count]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12

---
- dashboard: employee_leave_information
  title: Employee Leave Information
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PqwCLDla7UdnpOWHpjwQ5R
  elements:
  - title: Leave by Tenure
    name: Leave by Tenure
    model: thelook
    explore: leave_requests
    type: looker_donut_multiples
    fields: [leave_requests.total_claimed_maternity_leave, leave_requests.total_claimed_baby_bonding_leave,
      leave_requests.total_claimed_bereavement, leave_requests.total_claimed_disability_leave,
      leave_requests.total_claimed_mental_health_leave, leave_requests.total_claimed_paternity_leave,
      leave_requests.years_worked_tier]
    fill_fields: [leave_requests.years_worked_tier]
    sorts: [leave_requests.years_worked_tier]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
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
    hidden_pivots: {}
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 11
    col: 0
    width: 24
    height: 7
  - title: Claimed Baby Bonding Leave
    name: Claimed Baby Bonding Leave
    model: thelook
    explore: leave_requests
    type: single_value
    fields: [leave_requests.total_claimed_baby_bonding_leave]
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
    hidden_pivots: {}
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 6
    col: 0
    width: 4
    height: 5
  - title: Claimed Bereavement
    name: Claimed Bereavement
    model: thelook
    explore: leave_requests
    type: single_value
    fields: [leave_requests.total_claimed_bereavement]
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
    hidden_pivots: {}
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 6
    col: 4
    width: 4
    height: 5
  - title: Claimed Disability Leave
    name: Claimed Disability Leave
    model: thelook
    explore: leave_requests
    type: single_value
    fields: [leave_requests.total_claimed_disability_leave]
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
    hidden_pivots: {}
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 6
    col: 12
    width: 4
    height: 5
  - title: Claimed Maternity Leave
    name: Claimed Maternity Leave
    model: thelook
    explore: leave_requests
    type: single_value
    fields: [leave_requests.total_claimed_maternity_leave]
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
    hidden_pivots: {}
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 6
    col: 20
    width: 4
    height: 5
  - title: Claimed Mental Health Leave
    name: Claimed Mental Health Leave
    model: thelook
    explore: leave_requests
    type: single_value
    fields: [leave_requests.total_claimed_mental_health_leave]
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
    hidden_pivots: {}
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 6
    col: 8
    width: 4
    height: 5
  - title: Claimed Paternity Leave
    name: Claimed Paternity Leave
    model: thelook
    explore: leave_requests
    type: single_value
    fields: [leave_requests.total_claimed_paternity_leave]
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
    hidden_pivots: {}
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      State: leave_requests.state
      City: leave_requests.city
    row: 6
    col: 16
    width: 4
    height: 5
  - title: Time Off By User
    name: Time Off By User
    model: thelook
    explore: events
    type: looker_timeline
    fields: [session_landing_page.event_id, sessions.session_start_time, sessions.session_end_time,
      sessions.count]
    sorts: [sessions.session_start_time desc]
    limit: 10
    column_limit: 50
    groupBars: true
    labelSize: 10pt
    showLegend: true
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
    row: 27
    col: 0
    width: 24
    height: 8
  - title: Leave by Country
    name: Leave by Country
    model: thelook
    explore: leave_requests
    type: looker_grid
    fields: [leave_requests.total_claimed_paternity_leave, leave_requests.total_claimed_mental_health_leave,
      leave_requests.total_claimed_maternity_leave, leave_requests.total_claimed_disability_leave,
      leave_requests.total_claimed_bereavement, leave_requests.total_claimed_baby_bonding_leave,
      leave_requests.state]
    sorts: [leave_requests.total_claimed_paternity_leave desc]
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
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      leave_requests.total_claimed_paternity_leave:
        is_active: true
      leave_requests.total_claimed_mental_health_leave:
        is_active: true
      leave_requests.total_claimed_maternity_leave:
        is_active: true
      leave_requests.total_claimed_disability_leave:
        is_active: true
      leave_requests.total_claimed_bereavement:
        is_active: true
      leave_requests.total_claimed_baby_bonding_leave:
        is_active: true
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
      State: leave_requests.state
      City: leave_requests.city
    row: 18
    col: 0
    width: 24
    height: 9
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://i.imgur.com/iRLmlvp.jpeg">
    row: 0
    col: 0
    width: 24
    height: 6
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
    explore: leave_requests
    listens_to_filters: []
    field: leave_requests.state
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: thelook
    explore: leave_requests
    listens_to_filters: [State]
    field: leave_requests.city

---
- dashboard: end_user_segment
  title: End User Segment
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5O2ag2vCjAiu2bPIDMae2t
  elements:
  - title: End User Segment
    name: End User Segment
    model: thelook
    explore: order_items
    type: table
    fields: [users.id, users.name, users.email, users.age, users.created_date, order_items.count]
    filters: {}
    sorts: [users.created_date desc]
    limit: 500
    column_limit: 50
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
    width: 12
    height: 13
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
    listens_to_filters: []
    field: users.state
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
  - name: Created Date
    title: Created Date
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
    field: order_items.created_date
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
- dashboard: engagement_metrics
  title: Engagement Metrics
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: nkJkBHL7dqR1FxPWZ9L7YU
  elements:
  - title: Engagement Metrics
    name: Engagement Metrics
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.total_gross_margin_percentage, distribution_centers.name]
    sorts: [order_items.total_gross_margin_percentage desc 0]
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
