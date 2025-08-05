---
- dashboard: advertising_pulse
  title: Advertising Pulse
  layout: newspaper
  preferred_viewer: dashboards
  description: ""
  query_timezone: user_timezone
  preferred_slug: CVJdMgyxdO6zyaUNbhmPAu
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ""
  elements:
    - title: Total Clicks by Channel
      name: Total Clicks by Channel
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_clicks,
          campaigns.advertising_channel,
          adevents.created_date,
        ]
      pivots: [campaigns.advertising_channel]
      fill_fields: [adevents.created_date]
      filters:
        campaigns.advertising_channel: "-NULL"
      sorts: [campaigns.advertising_channel, adevents.created_date desc]
      limit: 500
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_null_points: true
      point_style: circle
      interpolation: monotone
      column_spacing_ratio:
      column_group_spacing_ratio:
      series_colors: {}
      hidden_fields: []
      y_axes: []
      listen:
        Date: events.event_date
      row: 9
      col: 12
      width: 12
      height: 7
    - title: Clicks Over Time
      name: Clicks Over Time
      model: thelook_adwords
      explore: events
      type: looker_area
      fields:
        [adevents.cost_per_click, adevents.total_clicks, adevents.created_date]
      fill_fields: [adevents.created_date]
      filters:
        adevents.created_week: 30 days ago for 30 days
      sorts: [adevents.created_date]
      limit: 500
      column_limit: 50
      stacking: ""
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      show_null_points: true
      point_style: none
      interpolation: monotone
      show_totals_labels: false
      show_silhouette: false
      ordering: none
      show_null_labels: false
      y_axes:
        [
          {
            label: CPC ($),
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.cost_per_click,
                  name: CPC ($),
                  axisId: adevents.cost_per_click,
                },
              ],
          },
          {
            label: Clicks,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.total_clicks,
                  name: Click,
                  axisId: adevents.total_clicks,
                },
              ],
          },
        ]
      series_types:
        adevents.total_clicks: column
      series_labels:
        adevents.cost_per_click: CPC ($)
        adevents.total_clicks: Click
      series_colors: {}
      x_axis_datetime_label: "%b %d"
      hidden_fields: []
      listen: {}
      row: 9
      col: 0
      width: 12
      height: 7
    - title: Active Views
      name: Active Views
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      filters:
        campaigns.advertising_channel: ""
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.cost_per_impression,
          adevents.total_clicks,
          adevents.total_cost_impressions,
        ]
      single_value_title: Active Views
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 8
      width: 4
      height: 5
    - title: CPM
      name: CPM
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Thousand (CPM)
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 12
      width: 4
      height: 5
    - title: Cost Per Click
      name: Cost Per Click
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Click
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 4
      width: 4
      height: 5
    - title: Clicks
      name: Clicks
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_clicks,
          adevents.total_impressions,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_cost_impressions,
          adevents.total_viewability,
          adevents.cost_per_click,
        ]
      single_value_title: Clicks
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 0
      width: 4
      height: 5
    - title: Conversions
      name: Conversions
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_impressions,
          adevents.total_clicks,
          session_purchase_facts.total_purchases,
        ]
      filters:
        sessions.traffic_source: Adwords
      sorts: [adevents.total_impressions desc]
      limit: 500
      column_limit: 50
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: adevents.total_impressions,
                  name: Total Impressions,
                  axisId: adevents.total_impressions,
                },
                {
                  id: adevents.total_clicks,
                  name: Total Clicks,
                  axisId: adevents.total_clicks,
                },
                {
                  id: session_purchase_facts.conversions_from_search,
                  name: Conversions From Search,
                  axisId: session_purchase_facts.conversions_from_search,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: log,
          },
        ]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: circle
      series_colors: {}
      series_labels:
        sessions.count_purchase: Conversions (Purchases)
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: true
      show_totals_labels: false
      show_silhouette: false
      leftAxisLabelVisible: false
      leftAxisLabel: ""
      rightAxisLabelVisible: false
      rightAxisLabel: ""
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      show_null_points: true
      interpolation: linear
      labelScale: ".1"
      hidden_fields: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 16
      width: 8
      height: 5
    - title: Active Campaigns - Timeline
      name: Active Campaigns - Timeline
      model: thelook_adwords
      explore: events
      type: looker_timeline
      fields:
        [
          campaigns.campaign_name,
          campaigns.created_date,
          campaigns.end_date,
          session_purchase_facts.ROI,
        ]
      filters:
        campaigns.is_active_now: "Yes"
        session_purchase_facts.ROI: NOT NULL
        session_purchase_facts.revenue: ">20"
      sorts: [campaigns.created_date]
      limit: 500
      column_limit: 50
      groupBars: true
      labelSize: 10pt
      showLegend: true
      stacking: ""
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
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      hidden_fields: []
      valueFormat: ""
      series_colors: {}
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 19
      col: 4
      width: 20
      height: 8
    - title: Revenue Target
      name: Revenue Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields:
        [events.event_week, session_purchase_facts.revenue, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        campaigns.bid_type: "-NULL"
        events.event_date: 1 quarters ago for 1 quarters
        user_session_fact.site_acquisition_source: Adwords
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: revenue_adjusted
          label: Revenue Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${session_purchase_facts.revenue}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: goal
          label: Goal
          expression: running_total(max(${revenue_display})*1.2/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_revenue_won
          label: Total Revenue Won
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${session_purchase_facts.revenue}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: revenue_display
          label: Revenue Display
          expression: if(running_total(1)<=6,${total_revenue_won},null)
          value_format:
          value_format_name: usd_0
          _kind_hint: supermeasure
          _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      hidden_series: []
      legend_position: center
      series_types:
        Search - revenue_adjusted: column
        Display - revenue_adjusted: column
        CPC - revenue_adjusted: column
        Target CPA - revenue_adjusted: column
        Enhanced CPC - revenue_adjusted: column
        total_revenue_won: area
        revenue_display: area
      point_style: none
      series_colors: {}
      series_labels:
        revenue_display: Revenue
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Goal,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          quota,
          revenue_adjusted,
          events.event_week,
          session_purchase_facts.revenue,
          total_revenue_won,
        ]
      listen: {}
      row: 27
      col: 0
      width: 12
      height: 6
    - title: Budget Target
      name: Budget Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields: [events.event_week, adevents.total_cost, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        events.event_date: last quarter
        campaigns.bid_type: "-NULL"
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: spend_adjusted
          label: Spend Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${adevents.total_cost}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: budget
          label: Budget
          expression: running_total(max(${spend_display})*0.7/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_spent
          label: Total Spent
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${adevents.total_cost}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: spend_display
          label: Spend Display
          expression: if(running_total(1)<=6,${total_spent},null)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      series_types:
        CPC - spend_adjusted: column
        Enhanced CPC - spend_adjusted: column
        Target CPA - spend_adjusted: column
        total_spent: area
        spend_display: area
      point_style: none
      series_colors: {}
      series_labels:
        spend_display: Spend
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Budget,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          quota,
          adevents.total_cost,
          spend_adjusted,
          events.event_week,
          total_spent,
        ]
      listen: {}
      row: 33
      col: 0
      width: 12
      height: 5
    - title: Ad Spend
      name: Ad Spend
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, adevents.total_cost]
      filters:
        events.previous_period: "-NULL"
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "% Change"
          expression: "${adevents.total_cost}/offset(${adevents.total_cost},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Total Spend
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 19
      col: 0
      width: 4
      height: 4
    - title: Revenue
      name: Revenue
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, session_purchase_facts.revenue]
      filters:
        events.previous_period: "-NULL"
        user_session_fact.site_acquisition_source: Adwords
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "%Change"
          expression: "${session_purchase_facts.revenue}/offset(${session_purchase_facts.revenue},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Associated Revenue
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 23
      col: 0
      width: 4
      height: 4
    - title: Active Campaigns - Performance Waterfall
      name: Active Campaigns - Performance Waterfall
      model: thelook_adwords
      explore: events
      type: looker_column
      fields: [campaigns.campaign_name, session_purchase_facts.net_profit]
      filters:
        campaigns.campaign_name_raw: "-NULL"
        campaigns.is_active_now: "Yes"
        adevents.total_cost: ">0"
      sorts: [session_purchase_facts.net_profit desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: offset
          label: offset
          expression: running_total(offset(${session_purchase_facts.net_profit},-1))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_for_negative
          label: offset for negative
          expression: "${offset} + ${session_purchase_facts.net_profit}"
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_2
          label: Offset
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}<0,if(${offset}>=0,0,${offset}),${offset_for_negative}),${offset})
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: gain
          label: Gain
          expression: if(${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss
          label: Loss+
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit}*-1,if(${offset}>=0,${offset},0)),0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss_
          label: Loss-
          expression: if(${session_purchase_facts.net_profit}<0,${session_purchase_facts.net_profit}+${loss},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          expense,
          session_purchase_facts.net_profit,
          offset,
          offset_for_negative,
        ]
      series_colors:
        offset: transparent
        expense_negative: "#294988"
        expense_positive: "#294988"
        offset_2: transparent
        loss: "#294259"
      hide_legend: true
      y_axes:
        [
          {
            label: Rolling Net Profit,
            orientation: left,
            series:
              [
                { id: offset_2, name: Offset, axisId: offset_2 },
                { id: gain, name: Gain, axisId: gain },
                { id: loss, name: Loss+, axisId: loss },
                { id: loss_, name: Loss-, axisId: loss_ },
              ],
            showLabels: true,
            showValues: true,
            minValue: !!null "",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "4"
      listen: {}
      row: 33
      col: 12
      width: 12
      height: 11
    - name: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      row: 0
      col: 0
      width: 24
      height: 2
    - name: ""
      type: text
      subtitle_text: How are we doing in search?
      body_text: ""
      row: 2
      col: 0
      width: 8
      height: 2
    - name: " (2)"
      type: text
      subtitle_text: How are we doing in Display?
      row: 2
      col: 8
      width: 8
      height: 2
    - name: " (3)"
      type: text
      title_text: ""
      subtitle_text: How are we doing overall?
      row: 2
      col: 16
      width: 8
      height: 2
    - name: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      subtitle_text: How are we tracking towards spend budget and revenue goals?
      body_text:
        "**Recommended Action** Dig deeper into under performing campaigns\
        \ and figure out what is going wrong"
      row: 16
      col: 0
      width: 24
      height: 3
    - title: Q Over Q Tracking Revenue Target
      name: Q Over Q Tracking Revenue Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields:
        [
          campaigns.day_of_quarter,
          campaigns.created_quarter,
          session_purchase_facts.revenue,
        ]
      pivots: [campaigns.created_quarter]
      fill_fields: [campaigns.created_quarter]
      filters:
        campaigns.created_quarter: 5 quarters
        user_session_fact.site_acquisition_source: Adwords
        campaigns.campaign_name: ""
      sorts: [campaigns.day_of_quarter, campaigns.created_quarter desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: running_revenue
          label: Running Revenue
          expression: running_total(${session_purchase_facts.revenue})
          value_format:
          value_format_name: usd_0
          _kind_hint: measure
          _type_hint: number
        - table_calculation: goal_pace
          label: Goal Pace
          expression: |-
            ${running_revenue}
            /
            50000
          value_format:
          value_format_name: percent_1
          _kind_hint: measure
          _type_hint: number
        - table_calculation: to_goal
          label: "% To Goal"
          expression: |
            if(
            diff_days(${date}, date(
            extract_years(now()),
            extract_months(now()),
            extract_days(now()))) < 0,
            null,
            ${goal_pace})
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
        - table_calculation: first_day_of_quarter
          label: First Day of Quarter
          expression: |-
            date(
            extract_years(${campaigns.created_quarter}),
            extract_months(${campaigns.created_quarter}),
            extract_days(${campaigns.created_quarter}))
          value_format:
          value_format_name:
          _kind_hint: measure
          _type_hint: date
        - table_calculation: date
          label: Date
          expression:
            "add_days(${campaigns.day_of_quarter},${first_day_of_quarter})

            "
          value_format:
          value_format_name:
          _kind_hint: measure
          _type_hint: date
        - table_calculation: goal
          label: Goal
          expression: if(is_null(pivot_index(${session_purchase_facts.revenue}-${session_purchase_facts.revenue},1)),1,1)
          value_format:
          value_format_name: percent_0
          _kind_hint: supermeasure
          _type_hint: number
      stacking: ""
      show_value_labels: false
      label_density: 1
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
      show_null_points: false
      point_style: none
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          goal_pace,
          first_day_of_quarter,
          date,
          running_revenue,
          session_purchase_facts.revenue,
          goal,
        ]
      font_size: medium
      series_colors:
        goal: "#c8c8ca"
      hidden_series: []
      y_axes: []
      listen: {}
      row: 38
      col: 0
      width: 12
      height: 6
    - title: Top Spend Campaigns
      name: Top Spend Campaigns
      model: thelook_adwords
      explore: sessions
      type: looker_grid
      fields:
        [
          campaigns.campaign_name,
          adevents.total_cost,
          session_attribution.ROI,
          session_attribution.total_attribution,
        ]
      filters:
        adevents.created_quarter: 3 months
      sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
      limit: 10
      column_limit: 50
      show_view_names: false
      show_row_numbers: false
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: false
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: true
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      truncate_header: false
      minimum_column_width: 75
      series_labels:
        session_attribution.total_attribution: Revenue
      series_column_widths:
        campaigns.campaign_name: 316
        adevents.total_cost: 210
        session_attribution.ROI: 202
        session_attribution.total_attribution: 223
      series_cell_visualizations:
        adevents.total_cost:
          is_active: true
          palette:
            palette_id: google-theme-diverging-0
            collection_id: google-theme
        session_attribution.ROI:
          is_active: false
      conditional_formatting:
        [
          {
            type: less than,
            value: 0,
            background_color: "",
            font_color: "#ff1225",
            color_application:
              {
                collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
                palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: false,
                    reverse: false,
                    stepped: true,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.ROI],
          },
          {
            type: along a scale...,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: !!null "",
            color_application:
              {
                collection_id: google-theme,
                palette_id: google-theme-diverging-0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: true,
                    reverse: false,
                    stepped: false,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.total_attribution],
          },
        ]
      series_value_format:
        session_attribution.ROI:
          name: percent_0
          format_string: "#,##0%"
          label: Percent (0)
      defaults_version: 1
      listen: {}
      row: 27
      col: 12
      width: 12
      height: 6
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 90 days ago for 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook_adwords
      explore: events
      listens_to_filters: []
      field: adevents.created_date
    - name: Location
      title: Location
      type: string_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover

---
- dashboard: advertising_pulse
  title: Advertising Pulse
  layout: newspaper
  preferred_viewer: dashboards
  query_timezone: user_timezone
  preferred_slug: iTJK7vUZqrXWjzJIttzjsu
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ""
  elements:
    - title: Total Clicks by Channel
      name: Total Clicks by Channel
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_clicks,
          campaigns.advertising_channel,
          adevents.created_date,
        ]
      pivots: [campaigns.advertising_channel]
      fill_fields: [adevents.created_date]
      filters:
        campaigns.advertising_channel: "-NULL"
      sorts: [campaigns.advertising_channel, adevents.created_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_null_points: true
      point_style: circle
      interpolation: monotone
      column_spacing_ratio:
      column_group_spacing_ratio:
      series_colors: {}
      hidden_fields: []
      y_axes: []
      listen:
        Date: events.event_date
      row: 9
      col: 12
      width: 12
      height: 7
    - title: Clicks Over Time
      name: Clicks Over Time
      model: thelook_adwords
      explore: events
      type: looker_area
      fields:
        [adevents.cost_per_click, adevents.total_clicks, adevents.created_date]
      fill_fields: [adevents.created_date]
      filters:
        adevents.created_week: 30 days ago for 30 days
      sorts: [adevents.created_date]
      limit: 500
      column_limit: 50
      stacking: ""
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      show_null_points: true
      point_style: none
      interpolation: monotone
      show_totals_labels: false
      show_silhouette: false
      ordering: none
      show_null_labels: false
      y_axes:
        [
          {
            label: CPC ($),
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.cost_per_click,
                  name: CPC ($),
                  axisId: adevents.cost_per_click,
                },
              ],
          },
          {
            label: Clicks,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.total_clicks,
                  name: Click,
                  axisId: adevents.total_clicks,
                },
              ],
          },
        ]
      series_types:
        adevents.total_clicks: column
      series_labels:
        adevents.cost_per_click: CPC ($)
        adevents.total_clicks: Click
      series_colors: {}
      x_axis_datetime_label: "%b %d"
      hidden_fields: []
      listen: {}
      row: 9
      col: 0
      width: 12
      height: 7
    - title: Active Views
      name: Active Views
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      filters:
        campaigns.advertising_channel: ""
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.cost_per_impression,
          adevents.total_clicks,
          adevents.total_cost_impressions,
        ]
      single_value_title: Active Views
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 8
      width: 4
      height: 5
    - title: CPM
      name: CPM
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Thousand (CPM)
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 12
      width: 4
      height: 5
    - title: Cost Per Click
      name: Cost Per Click
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Click
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 4
      width: 4
      height: 5
    - title: Clicks
      name: Clicks
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_clicks,
          adevents.total_impressions,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_cost_impressions,
          adevents.total_viewability,
          adevents.cost_per_click,
        ]
      single_value_title: Clicks
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 0
      width: 4
      height: 5
    - title: Conversions
      name: Conversions
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_impressions,
          adevents.total_clicks,
          session_purchase_facts.total_purchases,
        ]
      filters:
        sessions.traffic_source: Adwords
      sorts: [adevents.total_impressions desc]
      limit: 500
      column_limit: 50
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: adevents.total_impressions,
                  name: Total Impressions,
                  axisId: adevents.total_impressions,
                },
                {
                  id: adevents.total_clicks,
                  name: Total Clicks,
                  axisId: adevents.total_clicks,
                },
                {
                  id: session_purchase_facts.conversions_from_search,
                  name: Conversions From Search,
                  axisId: session_purchase_facts.conversions_from_search,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: log,
          },
        ]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: circle
      series_colors: {}
      series_labels:
        sessions.count_purchase: Conversions (Purchases)
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: true
      show_totals_labels: false
      show_silhouette: false
      leftAxisLabelVisible: false
      leftAxisLabel: ""
      rightAxisLabelVisible: false
      rightAxisLabel: ""
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      show_null_points: true
      interpolation: linear
      labelScale: ".1"
      hidden_fields: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 16
      width: 8
      height: 5
    - title: Active Campaigns - Timeline
      name: Active Campaigns - Timeline
      model: thelook_adwords
      explore: events
      type: looker_timeline
      fields:
        [
          campaigns.campaign_name,
          campaigns.created_date,
          campaigns.end_date,
          session_purchase_facts.ROI,
        ]
      filters:
        campaigns.is_active_now: "Yes"
        session_purchase_facts.ROI: NOT NULL
        session_purchase_facts.revenue: ">20"
      sorts: [campaigns.created_date]
      limit: 500
      column_limit: 50
      query_timezone: America/Los_Angeles
      groupBars: true
      labelSize: 10pt
      showLegend: true
      stacking: ""
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
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      hidden_fields: []
      valueFormat: ""
      series_colors: {}
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 19
      col: 4
      width: 20
      height: 8
    - title: Revenue Target
      name: Revenue Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields:
        [events.event_week, session_purchase_facts.revenue, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        campaigns.bid_type: "-NULL"
        events.event_date: 1 quarters ago for 1 quarters
        user_session_fact.site_acquisition_source: Adwords
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: revenue_adjusted
          label: Revenue Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${session_purchase_facts.revenue}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: goal
          label: Goal
          expression: running_total(max(${revenue_display})*1.2/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_revenue_won
          label: Total Revenue Won
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${session_purchase_facts.revenue}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: revenue_display
          label: Revenue Display
          expression: if(running_total(1)<=6,${total_revenue_won},null)
          value_format:
          value_format_name: usd_0
          _kind_hint: supermeasure
          _type_hint: number
      query_timezone: America/Los_Angeles
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      hidden_series: []
      legend_position: center
      series_types:
        Search - revenue_adjusted: column
        Display - revenue_adjusted: column
        CPC - revenue_adjusted: column
        Target CPA - revenue_adjusted: column
        Enhanced CPC - revenue_adjusted: column
        total_revenue_won: area
        revenue_display: area
      point_style: none
      series_colors: {}
      series_labels:
        revenue_display: Revenue
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Goal,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          quota,
          revenue_adjusted,
          events.event_week,
          session_purchase_facts.revenue,
          total_revenue_won,
        ]
      listen: {}
      row: 27
      col: 0
      width: 12
      height: 6
    - title: Budget Target
      name: Budget Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields: [events.event_week, adevents.total_cost, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        events.event_date: last quarter
        campaigns.bid_type: "-NULL"
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: spend_adjusted
          label: Spend Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${adevents.total_cost}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: budget
          label: Budget
          expression: running_total(max(${spend_display})*0.7/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_spent
          label: Total Spent
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${adevents.total_cost}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: spend_display
          label: Spend Display
          expression: if(running_total(1)<=6,${total_spent},null)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
      query_timezone: America/Los_Angeles
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      series_types:
        CPC - spend_adjusted: column
        Enhanced CPC - spend_adjusted: column
        Target CPA - spend_adjusted: column
        total_spent: area
        spend_display: area
      point_style: none
      series_colors: {}
      series_labels:
        spend_display: Spend
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Budget,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          quota,
          adevents.total_cost,
          spend_adjusted,
          events.event_week,
          total_spent,
        ]
      listen: {}
      row: 33
      col: 0
      width: 12
      height: 5
    - title: Ad Spend
      name: Ad Spend
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, adevents.total_cost]
      filters:
        events.previous_period: "-NULL"
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "% Change"
          expression: "${adevents.total_cost}/offset(${adevents.total_cost},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      query_timezone: America/Los_Angeles
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Total Spend
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 19
      col: 0
      width: 4
      height: 4
    - title: Revenue
      name: Revenue
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, session_purchase_facts.revenue]
      filters:
        events.previous_period: "-NULL"
        user_session_fact.site_acquisition_source: Adwords
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "%Change"
          expression: "${session_purchase_facts.revenue}/offset(${session_purchase_facts.revenue},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      query_timezone: America/Los_Angeles
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Associated Revenue
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 23
      col: 0
      width: 4
      height: 4
    - title: Active Campaigns - Performance Waterfall
      name: Active Campaigns - Performance Waterfall
      model: thelook_adwords
      explore: events
      type: looker_column
      fields: [campaigns.campaign_name, session_purchase_facts.net_profit]
      filters:
        campaigns.campaign_name_raw: "-NULL"
        campaigns.is_active_now: "Yes"
        adevents.total_cost: ">0"
      sorts: [session_purchase_facts.net_profit desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: offset
          label: offset
          expression: running_total(offset(${session_purchase_facts.net_profit},-1))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_for_negative
          label: offset for negative
          expression: "${offset} + ${session_purchase_facts.net_profit}"
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_2
          label: Offset
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}<0,if(${offset}>=0,0,${offset}),${offset_for_negative}),${offset})
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: gain
          label: Gain
          expression: if(${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss
          label: Loss+
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit}*-1,if(${offset}>=0,${offset},0)),0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss_
          label: Loss-
          expression: if(${session_purchase_facts.net_profit}<0,${session_purchase_facts.net_profit}+${loss},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
      query_timezone: America/Los_Angeles
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          expense,
          session_purchase_facts.net_profit,
          offset,
          offset_for_negative,
        ]
      series_colors:
        offset: transparent
        expense_negative: "#294988"
        expense_positive: "#294988"
        offset_2: transparent
        loss: "#294259"
      hide_legend: true
      y_axes:
        [
          {
            label: Rolling Net Profit,
            orientation: left,
            series:
              [
                { id: offset_2, name: Offset, axisId: offset_2 },
                { id: gain, name: Gain, axisId: gain },
                { id: loss, name: Loss+, axisId: loss },
                { id: loss_, name: Loss-, axisId: loss_ },
              ],
            showLabels: true,
            showValues: true,
            minValue: !!null "",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "4"
      listen: {}
      row: 33
      col: 12
      width: 12
      height: 11
    - name: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      row: 0
      col: 0
      width: 24
      height: 2
    - name: ""
      type: text
      subtitle_text: How are we doing in search?
      body_text: ""
      row: 2
      col: 0
      width: 8
      height: 2
    - name: " (2)"
      type: text
      subtitle_text: How are we doing in Display?
      row: 2
      col: 8
      width: 8
      height: 2
    - name: " (3)"
      type: text
      title_text: ""
      subtitle_text: How are we doing overall?
      row: 2
      col: 16
      width: 8
      height: 2
    - name: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      subtitle_text: How are we tracking towards spend budget and revenue goals?
      body_text:
        "**Recommended Action** Dig deeper into under performing campaigns\
        \ and figure out what is going wrong"
      row: 16
      col: 0
      width: 24
      height: 3
    - title: Q Over Q Tracking Revenue Target
      name: Q Over Q Tracking Revenue Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields:
        [
          campaigns.day_of_quarter,
          campaigns.created_quarter,
          session_purchase_facts.revenue,
        ]
      pivots: [campaigns.created_quarter]
      fill_fields: [campaigns.created_quarter]
      filters:
        campaigns.created_quarter: 5 quarters
        user_session_fact.site_acquisition_source: Adwords
        campaigns.campaign_name: ""
      sorts: [campaigns.day_of_quarter, campaigns.created_quarter desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: running_revenue
          label: Running Revenue
          expression: running_total(${session_purchase_facts.revenue})
          value_format:
          value_format_name: usd_0
          _kind_hint: measure
          _type_hint: number
        - table_calculation: goal_pace
          label: Goal Pace
          expression: |-
            ${running_revenue}
            /
            50000
          value_format:
          value_format_name: percent_1
          _kind_hint: measure
          _type_hint: number
        - table_calculation: to_goal
          label: "% To Goal"
          expression: |
            if(
            diff_days(${date}, date(
            extract_years(now()),
            extract_months(now()),
            extract_days(now()))) < 0,
            null,
            ${goal_pace})
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
        - table_calculation: first_day_of_quarter
          label: First Day of Quarter
          expression: |-
            date(
            extract_years(${campaigns.created_quarter}),
            extract_months(${campaigns.created_quarter}),
            extract_days(${campaigns.created_quarter}))
          value_format:
          value_format_name:
          _kind_hint: measure
          _type_hint: date
        - table_calculation: date
          label: Date
          expression:
            "add_days(${campaigns.day_of_quarter},${first_day_of_quarter})

            "
          value_format:
          value_format_name:
          _kind_hint: measure
          _type_hint: date
        - table_calculation: goal
          label: Goal
          expression: if(is_null(pivot_index(${session_purchase_facts.revenue}-${session_purchase_facts.revenue},1)),1,1)
          value_format:
          value_format_name: percent_0
          _kind_hint: supermeasure
          _type_hint: number
      query_timezone: user_timezone
      stacking: ""
      show_value_labels: false
      label_density: 1
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
      show_null_points: false
      point_style: none
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          goal_pace,
          first_day_of_quarter,
          date,
          running_revenue,
          session_purchase_facts.revenue,
          goal,
        ]
      font_size: medium
      series_colors:
        goal: "#c8c8ca"
      hidden_series: []
      y_axes: []
      listen: {}
      row: 38
      col: 0
      width: 12
      height: 6
    - title: Top Spend Campaigns
      name: Top Spend Campaigns
      model: thelook_adwords
      explore: sessions
      type: looker_grid
      fields:
        [
          campaigns.campaign_name,
          adevents.total_cost,
          session_attribution.ROI,
          session_attribution.total_attribution,
        ]
      filters:
        adevents.created_quarter: 2019-Q4
      sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
      limit: 10
      column_limit: 50
      query_timezone: user_timezone
      show_view_names: false
      show_row_numbers: false
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: false
      series_labels:
        session_attribution.total_attribution: Revenue
      series_column_widths:
        campaigns.campaign_name: 316
        adevents.total_cost: 210
        session_attribution.ROI: 202
        session_attribution.total_attribution: 223
      series_cell_visualizations:
        adevents.total_cost:
          is_active: false
        session_attribution.ROI:
          is_active: false
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: true
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting:
        [
          {
            type: less than,
            value: 0,
            background_color: "",
            font_color: "#ff1225",
            color_application:
              {
                collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
                palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: false,
                    reverse: false,
                    stepped: true,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.ROI],
          },
        ]
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_value_format:
        session_attribution.ROI:
          name: percent_0
          format_string: "#,##0%"
          label: Percent (0)
      y_axes: []
      listen: {}
      row: 27
      col: 12
      width: 12
      height: 6
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 90 days ago for 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook_adwords
      explore: events
      listens_to_filters: []
      field: adevents.created_date
    - name: Location
      title: Location
      type: string_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover

---
- dashboard: advertising_pulse
  title: Advertising Pulse
  layout: newspaper
  preferred_viewer: dashboards
  description: ""
  query_timezone: user_timezone
  preferred_slug: aZto6Cg50eUpJQ2QcZsM3N
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ""
  elements:
    - title: Total Clicks by Channel
      name: Total Clicks by Channel
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_clicks,
          campaigns.advertising_channel,
          adevents.created_date,
        ]
      pivots: [campaigns.advertising_channel]
      fill_fields: [adevents.created_date]
      filters:
        campaigns.advertising_channel: "-NULL"
      sorts: [campaigns.advertising_channel, adevents.created_date desc]
      limit: 500
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_null_points: true
      point_style: circle
      interpolation: monotone
      column_spacing_ratio:
      column_group_spacing_ratio:
      series_colors: {}
      hidden_fields: []
      y_axes: []
      listen:
        Date: events.event_date
      row: 9
      col: 12
      width: 12
      height: 7
    - title: Clicks Over Time
      name: Clicks Over Time
      model: thelook_adwords
      explore: events
      type: looker_area
      fields:
        [adevents.cost_per_click, adevents.total_clicks, adevents.created_date]
      fill_fields: [adevents.created_date]
      filters:
        adevents.created_week: 30 days ago for 30 days
      sorts: [adevents.created_date]
      limit: 500
      column_limit: 50
      stacking: ""
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      show_null_points: true
      point_style: none
      interpolation: monotone
      show_totals_labels: false
      show_silhouette: false
      ordering: none
      show_null_labels: false
      y_axes:
        [
          {
            label: CPC ($),
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.cost_per_click,
                  name: CPC ($),
                  axisId: adevents.cost_per_click,
                },
              ],
          },
          {
            label: Clicks,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.total_clicks,
                  name: Click,
                  axisId: adevents.total_clicks,
                },
              ],
          },
        ]
      series_types:
        adevents.total_clicks: column
      series_labels:
        adevents.cost_per_click: CPC ($)
        adevents.total_clicks: Click
      series_colors: {}
      x_axis_datetime_label: "%b %d"
      hidden_fields: []
      listen: {}
      row: 9
      col: 0
      width: 12
      height: 7
    - title: Active Views
      name: Active Views
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      filters:
        campaigns.advertising_channel: ""
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.cost_per_impression,
          adevents.total_clicks,
          adevents.total_cost_impressions,
        ]
      single_value_title: Active Views
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 8
      width: 4
      height: 5
    - title: CPM
      name: CPM
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Thousand (CPM)
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 12
      width: 4
      height: 5
    - title: Cost Per Click
      name: Cost Per Click
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Click
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 4
      width: 4
      height: 5
    - title: Clicks
      name: Clicks
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_clicks,
          adevents.total_impressions,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_cost_impressions,
          adevents.total_viewability,
          adevents.cost_per_click,
        ]
      single_value_title: Clicks
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 0
      width: 4
      height: 5
    - title: Conversions
      name: Conversions
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_impressions,
          adevents.total_clicks,
          session_purchase_facts.total_purchases,
        ]
      sorts: [adevents.total_impressions desc]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: adevents.total_impressions,
                  name: Total Impressions,
                  axisId: adevents.total_impressions,
                },
                {
                  id: adevents.total_clicks,
                  name: Total Clicks,
                  axisId: adevents.total_clicks,
                },
                {
                  id: session_purchase_facts.conversions_from_search,
                  name: Conversions From Search,
                  axisId: session_purchase_facts.conversions_from_search,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: log,
          },
        ]
      series_colors: {}
      series_labels:
        sessions.count_purchase: Conversions (Purchases)
      show_dropoff: true
      leftAxisLabelVisible: false
      leftAxisLabel: ""
      rightAxisLabelVisible: false
      rightAxisLabel: ""
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      show_null_points: true
      interpolation: linear
      labelScale: ".1"
      hidden_fields: []
      defaults_version: 1
      listen: {}
      row: 4
      col: 16
      width: 8
      height: 5
    - title: Active Campaigns - Timeline
      name: Active Campaigns - Timeline
      model: thelook_adwords
      explore: events
      type: looker_timeline
      fields:
        [
          campaigns.campaign_name,
          campaigns.created_date,
          campaigns.end_date,
          session_purchase_facts.ROI,
        ]
      filters:
        campaigns.is_active_now: "Yes"
        session_purchase_facts.ROI: NOT NULL
      sorts: [campaigns.created_date]
      limit: 500
      column_limit: 50
      groupBars: true
      labelSize: 10pt
      showLegend: true
      stacking: ""
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
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      hidden_fields: []
      valueFormat: ""
      series_colors: {}
      y_axes: []
      defaults_version: 1
      listen:
        Date: adevents.created_date
      row: 19
      col: 4
      width: 20
      height: 8
    - title: Budget Target
      name: Budget Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields: [events.event_week, adevents.total_cost, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        events.event_date: last quarter
        campaigns.bid_type: "-NULL"
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: spend_adjusted
          label: Spend Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${adevents.total_cost}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: budget
          label: Budget
          expression: running_total(max(${spend_display})*0.7/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_spent
          label: Total Spent
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${adevents.total_cost}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: spend_display
          label: Spend Display
          expression: if(running_total(1)<=6,${total_spent},null)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      series_types:
        CPC - spend_adjusted: column
        Enhanced CPC - spend_adjusted: column
        Target CPA - spend_adjusted: column
        total_spent: area
        spend_display: area
      point_style: none
      series_colors: {}
      series_labels:
        spend_display: Spend
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Budget,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          quota,
          adevents.total_cost,
          spend_adjusted,
          events.event_week,
          total_spent,
        ]
      listen: {}
      row: 27
      col: 0
      width: 12
      height: 5
    - title: Ad Spend
      name: Ad Spend
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, adevents.total_cost]
      filters:
        events.previous_period: "-NULL"
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "% Change"
          expression: "${adevents.total_cost}/offset(${adevents.total_cost},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Total Spend
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 19
      col: 0
      width: 4
      height: 4
    - title: Revenue
      name: Revenue
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [session_purchase_facts.revenue]
      filters: {}
      limit: 500
      column_limit: 50
      dynamic_fields:
        - category: table_calculation
          expression: "${session_purchase_facts.revenue}/100"
          label: Revenue
          value_format:
          value_format_name: usd
          _kind_hint: measure
          table_calculation: revenue
          _type_hint: number
          is_disabled: false
        - table_calculation: change
          label: "%Change"
          expression: "${session_purchase_facts.revenue}/offset(${session_purchase_facts.revenue},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
          is_disabled: true
        - args:
            - session_purchase_facts.revenue
          calculation_type: percent_of_column_sum
          category: table_calculation
          based_on: session_purchase_facts.revenue
          label: Percent of Sessions Revenue
          source_field: session_purchase_facts.revenue
          table_calculation: percent_of_sessions_revenue
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
          is_disabled: true
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      single_value_title: Associated Revenue
      value_format: "$#,###"
      comparison_label: Previous Period
      stacking: ""
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
      hidden_fields:
      y_axes: []
      defaults_version: 1
      hidden_pivots: {}
      listen:
        Date: adevents.previous_period_filter
      row: 23
      col: 0
      width: 4
      height: 4
    - title: Active Campaigns - Performance Waterfall
      name: Active Campaigns - Performance Waterfall
      model: thelook_adwords
      explore: events
      type: looker_column
      fields: [campaigns.campaign_name, session_purchase_facts.net_profit]
      filters:
        campaigns.campaign_name_raw: "-NULL"
        campaigns.is_active_now: "Yes"
        adevents.total_cost: ">0"
      sorts: [session_purchase_facts.net_profit desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: offset
          label: offset
          expression: running_total(offset(${session_purchase_facts.net_profit},-1))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_for_negative
          label: offset for negative
          expression: "${offset} + ${session_purchase_facts.net_profit}"
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_2
          label: Offset
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}<0,if(${offset}>=0,0,${offset}),${offset_for_negative}),${offset})
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: gain
          label: Gain
          expression: if(${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss
          label: Loss+
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit}*-1,if(${offset}>=0,${offset},0)),0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss_
          label: Loss-
          expression: if(${session_purchase_facts.net_profit}<0,${session_purchase_facts.net_profit}+${loss},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          expense,
          session_purchase_facts.net_profit,
          offset,
          offset_for_negative,
        ]
      series_colors:
        offset: transparent
        expense_negative: "#294988"
        expense_positive: "#294988"
        offset_2: transparent
        loss: "#294259"
      hide_legend: true
      y_axes:
        [
          {
            label: Rolling Net Profit,
            orientation: left,
            series:
              [
                { id: offset_2, name: Offset, axisId: offset_2 },
                { id: gain, name: Gain, axisId: gain },
                { id: loss, name: Loss+, axisId: loss },
                { id: loss_, name: Loss-, axisId: loss_ },
              ],
            showLabels: true,
            showValues: true,
            minValue: !!null "",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "4"
      listen: {}
      row: 32
      col: 0
      width: 12
      height: 11
    - name: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      row: 0
      col: 0
      width: 24
      height: 2
    - name: ""
      type: text
      subtitle_text: How are we doing in search?
      body_text: ""
      row: 2
      col: 0
      width: 8
      height: 2
    - name: " (2)"
      type: text
      subtitle_text: How are we doing in Display?
      row: 2
      col: 8
      width: 8
      height: 2
    - name: " (3)"
      type: text
      title_text: ""
      subtitle_text: How are we doing overall?
      row: 2
      col: 16
      width: 8
      height: 2
    - name: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      subtitle_text: How are we tracking towards spend budget and revenue goals?
      body_text:
        "**Recommended Action** Dig deeper into under performing campaigns\
        \ and figure out what is going wrong"
      row: 16
      col: 0
      width: 24
      height: 3
    - title: Top Spend Campaigns
      name: Top Spend Campaigns
      model: thelook_adwords
      explore: sessions
      type: looker_grid
      fields:
        [
          campaigns.campaign_name,
          adevents.total_cost,
          session_attribution.ROI,
          session_attribution.total_attribution,
        ]
      filters:
        adevents.created_quarter: 3 months
      sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
      limit: 10
      column_limit: 50
      show_view_names: false
      show_row_numbers: false
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: false
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: true
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      truncate_header: false
      minimum_column_width: 75
      series_labels:
        session_attribution.total_attribution: Revenue
      series_column_widths:
        campaigns.campaign_name: 316
        adevents.total_cost: 210
        session_attribution.ROI: 202
        session_attribution.total_attribution: 223
      series_cell_visualizations:
        adevents.total_cost:
          is_active: true
          palette:
            palette_id: google-theme-diverging-0
            collection_id: google-theme
        session_attribution.ROI:
          is_active: false
      conditional_formatting:
        [
          {
            type: less than,
            value: 0,
            background_color: "",
            font_color: "#ff1225",
            color_application:
              {
                collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
                palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: false,
                    reverse: false,
                    stepped: true,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.ROI],
          },
          {
            type: along a scale...,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: !!null "",
            color_application:
              {
                collection_id: google-theme,
                palette_id: google-theme-diverging-0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: true,
                    reverse: false,
                    stepped: false,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.total_attribution],
          },
        ]
      series_value_format:
        session_attribution.ROI:
          name: percent_0
          format_string: "#,##0%"
          label: Percent (0)
      defaults_version: 1
      listen: {}
      row: 27
      col: 12
      width: 12
      height: 6
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 90 days ago for 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
        options: []
      model: thelook_adwords
      explore: events
      listens_to_filters: []
      field: adevents.created_date
    - name: Location
      title: Location
      type: string_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover

---
- dashboard: advertising_pulse
  title: Advertising Pulse
  layout: newspaper
  preferred_viewer: dashboards
  description: ""
  query_timezone: user_timezone
  preferred_slug: 4ADOzXRN3xqRDJ6FHmdKYk
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ""
  elements:
    - title: Total Clicks by Channel
      name: Total Clicks by Channel
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_clicks,
          campaigns.advertising_channel,
          adevents.created_date,
        ]
      pivots: [campaigns.advertising_channel]
      fill_fields: [adevents.created_date]
      filters:
        campaigns.advertising_channel: "-NULL"
      sorts: [campaigns.advertising_channel, adevents.created_date desc]
      limit: 500
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_null_points: true
      point_style: circle
      interpolation: monotone
      column_spacing_ratio:
      column_group_spacing_ratio:
      series_colors: {}
      hidden_fields: []
      y_axes: []
      listen:
        Date: events.event_date
      row: 9
      col: 12
      width: 12
      height: 7
    - title: Clicks Over Time
      name: Clicks Over Time
      model: thelook_adwords
      explore: events
      type: looker_area
      fields:
        [adevents.cost_per_click, adevents.total_clicks, adevents.created_date]
      fill_fields: [adevents.created_date]
      filters:
        adevents.created_week: 30 days ago for 30 days
      sorts: [adevents.created_date]
      limit: 500
      column_limit: 50
      stacking: ""
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      show_null_points: true
      point_style: none
      interpolation: monotone
      show_totals_labels: false
      show_silhouette: false
      ordering: none
      show_null_labels: false
      y_axes:
        [
          {
            label: CPC ($),
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.cost_per_click,
                  name: CPC ($),
                  axisId: adevents.cost_per_click,
                },
              ],
          },
          {
            label: Clicks,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: adevents.total_clicks,
                  name: Click,
                  axisId: adevents.total_clicks,
                },
              ],
          },
        ]
      series_types:
        adevents.total_clicks: column
      series_labels:
        adevents.cost_per_click: CPC ($)
        adevents.total_clicks: Click
      series_colors: {}
      x_axis_datetime_label: "%b %d"
      hidden_fields: []
      listen: {}
      row: 9
      col: 0
      width: 12
      height: 7
    - title: Active Views
      name: Active Views
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      filters:
        campaigns.advertising_channel: ""
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.cost_per_impression,
          adevents.total_clicks,
          adevents.total_cost_impressions,
        ]
      single_value_title: Active Views
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 8
      width: 4
      height: 5
    - title: CPM
      name: CPM
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.cost_per_impression,
          adevents.total_cost_impressions,
        ]
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: type
          label: Type
          expression: '"Display"'
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Thousand (CPM)
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 12
      width: 4
      height: 5
    - title: Cost Per Click
      name: Cost Per Click
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_impressions,
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_clicks,
          adevents.total_cost_impressions,
          adevents.total_impressions,
          adevents.total_viewability,
        ]
      single_value_title: Cost Per Click
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: events.event_date
      row: 4
      col: 4
      width: 4
      height: 5
    - title: Clicks
      name: Clicks
      model: thelook_adwords
      explore: events
      type: single_value
      fields:
        [
          campaigns.advertising_channel,
          adevents.total_viewability,
          adevents.total_clicks,
          adevents.total_impressions,
          adevents.total_cost_impressions,
          adevents.cost_per_click,
        ]
      filters:
        campaigns.advertising_channel: Search
      sorts: [adevents.total_clicks desc]
      limit: 500
      column_limit: 50
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: "off"
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_view_names: true
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      hidden_fields:
        [
          adevents.total_cost_impressions,
          adevents.total_viewability,
          adevents.cost_per_click,
        ]
      single_value_title: Clicks
      comparison_label: Impressions
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 0
      width: 4
      height: 5
    - title: Conversions
      name: Conversions
      model: thelook_adwords
      explore: events
      type: looker_column
      fields:
        [
          adevents.total_impressions,
          adevents.total_clicks,
          session_purchase_facts.total_purchases,
        ]
      filters:
        sessions.traffic_source: Adwords
      sorts: [adevents.total_impressions desc]
      limit: 500
      column_limit: 50
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: adevents.total_impressions,
                  name: Total Impressions,
                  axisId: adevents.total_impressions,
                },
                {
                  id: adevents.total_clicks,
                  name: Total Clicks,
                  axisId: adevents.total_clicks,
                },
                {
                  id: session_purchase_facts.conversions_from_search,
                  name: Conversions From Search,
                  axisId: session_purchase_facts.conversions_from_search,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: log,
          },
        ]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: circle
      series_colors: {}
      series_labels:
        sessions.count_purchase: Conversions (Purchases)
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: true
      show_totals_labels: false
      show_silhouette: false
      leftAxisLabelVisible: false
      leftAxisLabel: ""
      rightAxisLabelVisible: false
      rightAxisLabel: ""
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      show_null_points: true
      interpolation: linear
      labelScale: ".1"
      hidden_fields: []
      listen:
        Date: adevents.created_date
      row: 4
      col: 16
      width: 8
      height: 5
    - title: Active Campaigns - Timeline
      name: Active Campaigns - Timeline
      model: thelook_adwords
      explore: events
      type: looker_timeline
      fields:
        [
          campaigns.campaign_name,
          campaigns.created_date,
          campaigns.end_date,
          session_purchase_facts.ROI,
        ]
      filters:
        campaigns.is_active_now: "Yes"
        session_purchase_facts.ROI: NOT NULL
        session_purchase_facts.revenue: ">20"
      sorts: [campaigns.created_date]
      limit: 500
      column_limit: 50
      groupBars: true
      labelSize: 10pt
      showLegend: true
      stacking: ""
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
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      hidden_fields: []
      valueFormat: ""
      series_colors: {}
      y_axes: []
      listen:
        Date: adevents.created_date
      row: 19
      col: 4
      width: 20
      height: 8
    - title: Revenue Target
      name: Revenue Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields:
        [events.event_week, session_purchase_facts.revenue, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        campaigns.bid_type: "-NULL"
        events.event_date: 1 quarters ago for 1 quarters
        user_session_fact.site_acquisition_source: Adwords
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: revenue_adjusted
          label: Revenue Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${session_purchase_facts.revenue}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: goal
          label: Goal
          expression: running_total(max(${revenue_display})*1.2/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_revenue_won
          label: Total Revenue Won
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${session_purchase_facts.revenue}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: revenue_display
          label: Revenue Display
          expression: if(running_total(1)<=6,${total_revenue_won},null)
          value_format:
          value_format_name: usd_0
          _kind_hint: supermeasure
          _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      hidden_series: []
      legend_position: center
      series_types:
        Search - revenue_adjusted: column
        Display - revenue_adjusted: column
        CPC - revenue_adjusted: column
        Target CPA - revenue_adjusted: column
        Enhanced CPC - revenue_adjusted: column
        total_revenue_won: area
        revenue_display: area
      point_style: none
      series_colors: {}
      series_labels:
        revenue_display: Revenue
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Goal,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          quota,
          revenue_adjusted,
          events.event_week,
          session_purchase_facts.revenue,
          total_revenue_won,
        ]
      listen: {}
      row: 27
      col: 0
      width: 12
      height: 6
    - title: Budget Target
      name: Budget Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields: [events.event_week, adevents.total_cost, campaigns.bid_type]
      pivots: [campaigns.bid_type]
      filters:
        events.event_date: last quarter
        campaigns.bid_type: "-NULL"
      sorts: [events.event_week, campaigns.bid_type]
      limit: 500
      dynamic_fields:
        - table_calculation: spend_adjusted
          label: Spend Adjusted
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(${adevents.total_cost}))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: week_in_quarter
          label: Week in Quarter
          expression: concat("WK",running_total(1))
          value_format:
          value_format_name:
          _kind_hint: dimension
          _type_hint: string
        - table_calculation: budget
          label: Budget
          expression: running_total(max(${spend_display})*0.7/6)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: total_spent
          label: Total Spent
          expression: |-
            if(diff_days(${events.event_week}, now()) < 0,
            null,
            running_total(sum(pivot_row(${adevents.total_cost}))))
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
        - table_calculation: spend_display
          label: Spend Display
          expression: if(running_total(1)<=6,${total_spent},null)
          value_format:
          value_format_name: usd
          _kind_hint: supermeasure
          _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: Display - Revenue Adjusted,
                  name: Display - Revenue Adjusted,
                  axisId: revenue_adjusted,
                },
                { id: Search
                    - Revenue Adjusted, name: Search - Revenue Adjusted, axisId: revenue_adjusted },
                {
                  id: total_revenue_won,
                  name: Total Revenue Won,
                  axisId: total_revenue_won,
                },
                { id: Display - Goal, name: Display - Goal, axisId: goal },
                { id: Search -
                    Goal, name: Search - Goal, axisId: goal },
              ],
            showLabels: true,
            showValues: true,
            valueFormat: "$#,##0",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      series_types:
        CPC - spend_adjusted: column
        Enhanced CPC - spend_adjusted: column
        Target CPA - spend_adjusted: column
        total_spent: area
        spend_display: area
      point_style: none
      series_colors: {}
      series_labels:
        spend_display: Spend
      show_value_labels: false
      label_density: 25
      x_axis_scale: ordinal
      y_axis_combined: true
      reference_lines:
        [
          {
            reference_type: range,
            line_value: mean,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#54538f",
            label: Budget,
          },
        ]
      show_null_points: false
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          quota,
          adevents.total_cost,
          spend_adjusted,
          events.event_week,
          total_spent,
        ]
      listen: {}
      row: 33
      col: 0
      width: 12
      height: 5
    - title: Ad Spend
      name: Ad Spend
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, adevents.total_cost]
      filters:
        events.previous_period: "-NULL"
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "% Change"
          expression: "${adevents.total_cost}/offset(${adevents.total_cost},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Total Spend
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 19
      col: 0
      width: 4
      height: 4
    - title: Revenue
      name: Revenue
      model: thelook_adwords
      explore: events
      type: single_value
      fields: [events.previous_period, session_purchase_facts.revenue]
      filters:
        events.previous_period: "-NULL"
        user_session_fact.site_acquisition_source: Adwords
        events.previous_period_filter: 90 days ago for 90 days
      sorts: [events.previous_period desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: change
          label: "%Change"
          expression: "${session_purchase_facts.revenue}/offset(${session_purchase_facts.revenue},1)-1"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ""
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
      single_value_title: Associated Revenue
      comparison_label: Previous Period
      hidden_fields: []
      value_format: "$#,###"
      y_axes: []
      listen:
        Date: adevents.previous_period_filter
      row: 23
      col: 0
      width: 4
      height: 4
    - title: Active Campaigns - Performance Waterfall
      name: Active Campaigns - Performance Waterfall
      model: thelook_adwords
      explore: events
      type: looker_column
      fields: [campaigns.campaign_name, session_purchase_facts.net_profit]
      filters:
        campaigns.campaign_name_raw: "-NULL"
        campaigns.is_active_now: "Yes"
        adevents.total_cost: ">0"
      sorts: [session_purchase_facts.net_profit desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: offset
          label: offset
          expression: running_total(offset(${session_purchase_facts.net_profit},-1))
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_for_negative
          label: offset for negative
          expression: "${offset} + ${session_purchase_facts.net_profit}"
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: offset_2
          label: Offset
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}<0,if(${offset}>=0,0,${offset}),${offset_for_negative}),${offset})
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: gain
          label: Gain
          expression: if(${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss
          label: Loss+
          expression: |-
            if(${session_purchase_facts.net_profit}<0,
              if(${offset}+${session_purchase_facts.net_profit}>=0,${session_purchase_facts.net_profit}*-1,if(${offset}>=0,${offset},0)),0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
        - table_calculation: loss_
          label: Loss-
          expression: if(${session_purchase_facts.net_profit}<0,${session_purchase_facts.net_profit}+${loss},0)
          value_format:
          value_format_name: usd
          _kind_hint: measure
          _type_hint: number
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
      show_x_axis_label: false
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          expense,
          session_purchase_facts.net_profit,
          offset,
          offset_for_negative,
        ]
      series_colors:
        offset: transparent
        expense_negative: "#294988"
        expense_positive: "#294988"
        offset_2: transparent
        loss: "#294259"
      hide_legend: true
      y_axes:
        [
          {
            label: Rolling Net Profit,
            orientation: left,
            series:
              [
                { id: offset_2, name: Offset, axisId: offset_2 },
                { id: gain, name: Gain, axisId: gain },
                { id: loss, name: Loss+, axisId: loss },
                { id: loss_, name: Loss-, axisId: loss_ },
              ],
            showLabels: true,
            showValues: true,
            minValue: !!null "",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "4"
      listen: {}
      row: 33
      col: 12
      width: 12
      height: 11
    - name: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Clicks and Impressions</span>"
      row: 0
      col: 0
      width: 24
      height: 2
    - name: ""
      type: text
      subtitle_text: How are we doing in search?
      body_text: ""
      row: 2
      col: 0
      width: 8
      height: 2
    - name: " (2)"
      type: text
      subtitle_text: How are we doing in Display?
      row: 2
      col: 8
      width: 8
      height: 2
    - name: " (3)"
      type: text
      title_text: ""
      subtitle_text: How are we doing overall?
      row: 2
      col: 16
      width: 8
      height: 2
    - name: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Revenue and Cost</span>"
      subtitle_text: How are we tracking towards spend budget and revenue goals?
      body_text:
        "**Recommended Action** Dig deeper into under performing campaigns\
        \ and figure out what is going wrong"
      row: 16
      col: 0
      width: 24
      height: 3
    - title: Q Over Q Tracking Revenue Target
      name: Q Over Q Tracking Revenue Target
      model: thelook_adwords
      explore: events
      type: looker_line
      fields:
        [
          campaigns.day_of_quarter,
          campaigns.created_quarter,
          session_purchase_facts.revenue,
        ]
      pivots: [campaigns.created_quarter]
      fill_fields: [campaigns.created_quarter]
      filters:
        campaigns.created_quarter: 5 quarters
        user_session_fact.site_acquisition_source: Adwords
        campaigns.campaign_name: ""
      sorts: [campaigns.day_of_quarter, campaigns.created_quarter desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: running_revenue
          label: Running Revenue
          expression: running_total(${session_purchase_facts.revenue})
          value_format:
          value_format_name: usd_0
          _kind_hint: measure
          _type_hint: number
        - table_calculation: goal_pace
          label: Goal Pace
          expression: |-
            ${running_revenue}
            /
            50000
          value_format:
          value_format_name: percent_1
          _kind_hint: measure
          _type_hint: number
        - table_calculation: to_goal
          label: "% To Goal"
          expression: |
            if(
            diff_days(${date}, date(
            extract_years(now()),
            extract_months(now()),
            extract_days(now()))) < 0,
            null,
            ${goal_pace})
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
          _type_hint: number
        - table_calculation: first_day_of_quarter
          label: First Day of Quarter
          expression: |-
            date(
            extract_years(${campaigns.created_quarter}),
            extract_months(${campaigns.created_quarter}),
            extract_days(${campaigns.created_quarter}))
          value_format:
          value_format_name:
          _kind_hint: measure
          _type_hint: date
        - table_calculation: date
          label: Date
          expression:
            "add_days(${campaigns.day_of_quarter},${first_day_of_quarter})

            "
          value_format:
          value_format_name:
          _kind_hint: measure
          _type_hint: date
        - table_calculation: goal
          label: Goal
          expression: if(is_null(pivot_index(${session_purchase_facts.revenue}-${session_purchase_facts.revenue},1)),1,1)
          value_format:
          value_format_name: percent_0
          _kind_hint: supermeasure
          _type_hint: number
      stacking: ""
      show_value_labels: false
      label_density: 1
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
      show_null_points: false
      point_style: none
      interpolation: monotone
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
        [
          session_purchase_facts.total_attribution,
          goal_pace,
          first_day_of_quarter,
          date,
          running_revenue,
          session_purchase_facts.revenue,
          goal,
        ]
      font_size: medium
      series_colors:
        goal: "#c8c8ca"
      hidden_series: []
      y_axes: []
      listen: {}
      row: 38
      col: 0
      width: 12
      height: 6
    - title: Top Spend Campaigns
      name: Top Spend Campaigns
      model: thelook_adwords
      explore: sessions
      type: looker_grid
      fields:
        [
          campaigns.campaign_name,
          adevents.total_cost,
          session_attribution.ROI,
          session_attribution.total_attribution,
        ]
      filters:
        adevents.created_quarter: 3 months
      sorts: [adevents.total_cost desc 0, session_attribution.ROI desc]
      limit: 10
      column_limit: 50
      show_view_names: false
      show_row_numbers: false
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: false
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: true
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      truncate_header: false
      minimum_column_width: 75
      series_labels:
        session_attribution.total_attribution: Revenue
      series_column_widths:
        campaigns.campaign_name: 316
        adevents.total_cost: 210
        session_attribution.ROI: 202
        session_attribution.total_attribution: 223
      series_cell_visualizations:
        adevents.total_cost:
          is_active: true
          palette:
            palette_id: google-theme-diverging-0
            collection_id: google-theme
        session_attribution.ROI:
          is_active: false
      conditional_formatting:
        [
          {
            type: less than,
            value: 0,
            background_color: "",
            font_color: "#ff1225",
            color_application:
              {
                collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
                palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: false,
                    reverse: false,
                    stepped: true,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.ROI],
          },
          {
            type: along a scale...,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: !!null "",
            color_application:
              {
                collection_id: google-theme,
                palette_id: google-theme-diverging-0,
                options:
                  {
                    constraints:
                      {
                        min: { type: minimum },
                        mid: { type: number, value: 0 },
                        max: { type: maximum },
                      },
                    mirror: true,
                    reverse: false,
                    stepped: false,
                  },
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: [session_attribution.total_attribution],
          },
        ]
      series_value_format:
        session_attribution.ROI:
          name: percent_0
          format_string: "#,##0%"
          label: Percent (0)
      defaults_version: 1
      listen: {}
      row: 27
      col: 12
      width: 12
      height: 6
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 90 days ago for 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook_adwords
      explore: events
      listens_to_filters: []
      field: adevents.created_date
    - name: Location
      title: Location
      type: string_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover

---
- dashboard: agent_performance
  title: Agent Performance
  layout: newspaper
  description: ""
  preferred_slug: YWRiowpHTm2XSksFIRlPkg
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
          label: "Difference in # Calls"
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: transcript.count,
                  id: transcript.count,
                  name: Number of Conversations,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: banking_client_facts.total_in_accounts_yesterday,
                  id: banking_client_facts.total_in_accounts_yesterday,
                  name: Total In Accounts
                    Yesterday,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
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
      fields:
        [
          transcript__messages.number_of_messages,
          transcript__messages.issue_topic,
          transcript.conversation_start_week,
        ]
      pivots: [transcript__messages.issue_topic]
      fill_fields: [transcript.conversation_start_week]
      filters:
        transcript__messages.issue_topic: "-NULL"
        transcript.conversation_start_week: 52 weeks ago for 52 weeks
      sorts:
        [
          transcript__messages.number_of_messages desc 0,
          transcript__messages.issue_topic,
        ]
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
      trellis: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: transcript__messages.number_of_messages,
                  id: transcript__messages.number_of_messages,
                  name: Number of Messages,
                },
              ],
            showLabels: false,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
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
      fields:
        [
          transcript__messages.average_sentiment,
          transcript__messages.average_sentiment_category,
        ]
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
      fields:
        [
          satisfaction_ratings.conversation_id,
          satisfaction_ratings.comment,
          satisfaction_ratings.score,
          transcript.conversation_start_date,
        ]
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
      fields:
        [
          transcript.average_conversation_duration,
          transcript__messages.issue_topic,
          transcript.conversation_start_month,
        ]
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
      trellis: ""
      stacking: ""
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
      fields:
        [
          transcript__messages.total_seconds_agent_speaking,
          transcript__messages.total_seconds_client_speaking,
        ]
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
      trellis: ""
      stacking: ""
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
- dashboard: ai_ga4_overview_
  title: "AI GA4 Overview "
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: asxx9BgNrFu4qjobcoCp6S
  elements:
    - title: Session Count
      name: Session Count
      model: ga4
      explore: sessions
      type: single_value
      fields:
        [
          sessions.total_sessions,
          sessions.total_first_visit_sessions_percentage,
        ]
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
      color_application:
        collection_id: legacy
        palette_id: looker_classic
      custom_color: "#FFF"
      single_value_title: Sessions
      comparison_label: First Visit Sessions
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#F9AB00",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 15
      col: 0
      width: 6
      height: 4
    - name: ""
      type: text
      title_text: ""
      body_text:
        "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
        font-size: 28px;\">GA Overview</h1><h2 style=\"font-size: 16px;\">\nOverview\
        \ of traffic to website</h2></div>\n</div>"
      row: 11
      col: 0
      width: 24
      height: 4
    - title: Bounces
      name: Bounces
      model: ga4
      explore: sessions
      type: single_value
      fields:
        [
          sessions.total_bounced_sessions,
          sessions.total_bounced_sessions_percentage,
        ]
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
      color_application:
        collection_id: legacy
        palette_id: looker_classic
      custom_color: "#FFF"
      single_value_title: Bounces
      comparison_label: Bounce Rate
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#EA4335",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 15
      col: 6
      width: 6
      height: 4
    - title: Avg Session Duration
      name: Avg Session Duration
      model: ga4
      explore: sessions
      type: single_value
      fields: [sessions.average_session_duration]
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
      color_application:
        collection_id: legacy
        palette_id: looker_classic
      custom_color: "#FFF"
      single_value_title: Avg Session Duration
      comparison_label: Bounce Rate
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 15
      col: 18
      width: 6
      height: 4
    - title: Engaged Sessions
      name: Engaged Sessions
      model: ga4
      explore: sessions
      type: single_value
      fields:
        [
          sessions.total_engaged_sessions,
          sessions.total_engaged_sessions_percentage,
        ]
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
      color_application:
        collection_id: legacy
        palette_id: looker_classic
      custom_color: "#FFF"
      single_value_title: Engaged Sessions
      comparison_label: Engaged Session Percentage
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#7CB342",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 15
      col: 12
      width: 6
      height: 4
    - title: Traffic
      name: Traffic
      model: ga4
      explore: sessions
      type: looker_column
      fields:
        [
          sessions.total_sessions,
          sessions.session_data_session_start_week,
          sessions.total_bounced_sessions_percentage,
          sessions.average_session_duration,
        ]
      fill_fields: [sessions.session_data_session_start_week]
      sorts: [sessions.session_data_session_start_week desc]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
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
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: sessions.total_sessions,
                  id: sessions.total_sessions,
                  name: Total Sessions,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.total_bounced_sessions_percentage,
                  id: sessions.total_bounced_sessions_percentage,
                  name: Total Bounced Sessions
                    Percentage,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.average_session_duration,
                  id: sessions.average_session_duration,
                  name: "Average Session Duration (HH:MM:SS)",
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_types:
        sessions.total_bounced_sessions_percentage: line
        sessions.average_session_duration: line
      series_colors:
        sessions.total_sessions: "#F9AB00"
        sessions.average_session_duration: "#1A73E8"
        sessions.total_bounced_sessions_percentage: "#12B5CB"
      series_labels:
        sessions.total_sessions: Sessions
        sessions.total_bounced_sessions_percentage: Bounce Rate
        sessions.average_session_duration: Avg Session Duration
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
      single_value_title: Sessions
      comparison_label: First Visit Sessions
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#F9AB00",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 19
      col: 0
      width: 16
      height: 9
    - title: Session Duration Tier
      name: Session Duration Tier
      model: ga4
      explore: sessions
      type: looker_bar
      fields:
        [sessions.session_data_session_duration_tier, sessions.total_sessions]
      filters:
        sessions.session_data_session_duration_tier: "-Undefined"
      sorts: [sessions.session_data_session_duration_tier]
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
      trellis: ""
      stacking: ""
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
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: sessions.total_sessions,
                  id: sessions.total_sessions,
                  name: Total Sessions,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.total_bounced_sessions_percentage,
                  id: sessions.total_bounced_sessions_percentage,
                  name: Total Bounced Sessions
                    Percentage,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.average_session_duration,
                  id: sessions.average_session_duration,
                  name: "Average Session Duration (HH:MM:SS)",
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors:
        sessions.total_sessions: "#1A73E8"
        sessions.average_session_duration: "#1A73E8"
        sessions.total_bounced_sessions_percentage: "#12B5CB"
      series_labels:
        sessions.total_sessions: Sessions
        sessions.total_bounced_sessions_percentage: Bounce Rate
        sessions.average_session_duration: Avg Session Duration
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
      single_value_title: Sessions
      comparison_label: First Visit Sessions
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#F9AB00",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 19
      col: 16
      width: 8
      height: 9
    - title: Users
      name: Users
      model: ga4
      explore: sessions
      type: single_value
      fields: [sessions.total_users, sessions.percentage_returning_users]
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
      color_application:
        collection_id: legacy
        palette_id: looker_classic
      custom_color: "#FFF"
      single_value_title: Total Users
      comparison_label: Returning Users
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 32
      col: 0
      width: 24
      height: 4
    - title: Sessions by Continent
      name: Sessions by Continent
      model: ga4
      explore: sessions
      type: looker_area
      fields:
        [
          sessions.session_data_session_start_week,
          sessions.total_sessions,
          sessions.geo_data_continent,
        ]
      pivots: [sessions.geo_data_continent]
      fill_fields: [sessions.session_data_session_start_week]
      filters:
        sessions.geo_data_continent: -NULL, -"(not set)"
      sorts: [sessions.session_data_session_start_week desc]
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
      trellis: ""
      stacking: percent
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: time
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: sessions.total_sessions,
                  id: sessions.total_sessions,
                  name: Total Sessions,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.total_bounced_sessions_percentage,
                  id: sessions.total_bounced_sessions_percentage,
                  name: Total Bounced Sessions
                    Percentage,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.average_session_duration,
                  id: sessions.average_session_duration,
                  name: "Average Session Duration (HH:MM:SS)",
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors:
        sessions.total_sessions: "#F9AB00"
        sessions.average_session_duration: "#1A73E8"
        sessions.total_bounced_sessions_percentage: "#12B5CB"
      series_labels:
        sessions.total_sessions: Sessions
        sessions.total_bounced_sessions_percentage: Bounce Rate
        sessions.average_session_duration: Avg Session Duration
      ordering: none
      show_null_labels: false
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
      single_value_title: Sessions
      comparison_label: First Visit Sessions
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#F9AB00",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 36
      col: 0
      width: 9
      height: 8
    - title: Top US States
      name: Top US States
      model: ga4
      explore: sessions
      type: looker_geo_choropleth
      fields: [sessions.total_sessions, sessions.geo_data_region]
      filters:
        sessions.geo_data_country: United States
      sorts: [sessions.total_sessions desc]
      limit: 500
      column_limit: 50
      map: usa
      map_projection: ""
      show_view_names: false
      quantize_colors: false
      colors: ["#f9f9f9", "#4285F4", "#185ABC"]
      color_application:
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: sessions.total_sessions,
                  id: sessions.total_sessions,
                  name: Total Sessions,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.total_bounced_sessions_percentage,
                  id: sessions.total_bounced_sessions_percentage,
                  name: Total Bounced Sessions
                    Percentage,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.average_session_duration,
                  id: sessions.average_session_duration,
                  name: "Average Session Duration (HH:MM:SS)",
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
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
      trellis: ""
      stacking: percent
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      series_colors:
        sessions.total_sessions: "#F9AB00"
        sessions.average_session_duration: "#1A73E8"
        sessions.total_bounced_sessions_percentage: "#12B5CB"
      series_labels:
        sessions.total_sessions: Sessions
        sessions.total_bounced_sessions_percentage: Bounce Rate
        sessions.average_session_duration: Avg Session Duration
      show_value_labels: false
      label_density: 25
      x_axis_scale: time
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      ordering: none
      show_null_labels: false
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
      single_value_title: Sessions
      comparison_label: First Visit Sessions
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#F9AB00",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: custom
      map_scale_indicator: "off"
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
      map_latitude: 36.94989178681327
      map_longitude: -91.142578125
      map_zoom: 3
      hidden_fields: []
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 36
      col: 9
      width: 7
      height: 8
    - title: Top Countries (Non-US)
      name: Top Countries (Non-US)
      model: ga4
      explore: sessions
      type: looker_geo_choropleth
      fields: [sessions.total_sessions, sessions.geo_data_country]
      filters:
        sessions.geo_data_country: "-United States"
      sorts: [sessions.total_sessions desc]
      limit: 500
      column_limit: 50
      map: world
      map_projection: ""
      show_view_names: false
      quantize_colors: false
      colors: ["#f9f9f9", "#4285F4", "#185ABC"]
      color_application:
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: sessions.total_sessions,
                  id: sessions.total_sessions,
                  name: Total Sessions,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.total_bounced_sessions_percentage,
                  id: sessions.total_bounced_sessions_percentage,
                  name: Total Bounced Sessions
                    Percentage,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: sessions.average_session_duration,
                  id: sessions.average_session_duration,
                  name: "Average Session Duration (HH:MM:SS)",
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
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
      trellis: ""
      stacking: percent
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      series_colors:
        sessions.total_sessions: "#F9AB00"
        sessions.average_session_duration: "#1A73E8"
        sessions.total_bounced_sessions_percentage: "#12B5CB"
      series_labels:
        sessions.total_sessions: Sessions
        sessions.total_bounced_sessions_percentage: Bounce Rate
        sessions.average_session_duration: Avg Session Duration
      show_value_labels: false
      label_density: 25
      x_axis_scale: time
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      ordering: none
      show_null_labels: false
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
      single_value_title: Sessions
      comparison_label: First Visit Sessions
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#F9AB00",
            font_color: "#FFF",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: custom
      map_scale_indicator: "off"
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
      map_latitude: 36.94989178681327
      map_longitude: -91.142578125
      map_zoom: 3
      hidden_fields: []
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 36
      col: 16
      width: 8
      height: 8
    - title: Sessions by Source Channel
      name: Sessions by Source Channel
      model: ga4
      explore: sessions
      type: looker_bar
      fields:
        [
          sessions.audience_trait,
          sessions.total_sessions,
          audience_cohorts.rank,
        ]
      pivots: [sessions.audience_trait, audience_cohorts.rank]
      filters:
        sessions.audience_selector: Channel
      sorts: [audience_cohorts.rank, sessions.audience_trait]
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
      trellis: ""
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
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 48
      col: 0
      width: 24
      height: 7
    - title: Top Referrers
      name: Top Referrers
      model: ga4
      explore: sessions
      type: looker_bar
      fields: [sessions.session_attribution_source, sessions.total_sessions]
      filters:
        sessions.session_attribution_medium: referral
      sorts: [sessions.total_sessions desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: of_total
          label: "% of Total"
          expression: "${sessions.total_sessions}/sum(${sessions.total_sessions})"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: true
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
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "10"
      hidden_series: [of_total]
      series_colors:
        sessions.total_sessions: "#F9AB00"
        of_total: "#facb04"
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Channel groups are default, as defined by Google https://support.google.com/analytics/answer/9756891?hl=en
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 55
      col: 0
      width: 12
      height: 11
    - title: Top Landing Pages
      name: Top Landing Pages
      model: ga4
      explore: sessions
      type: looker_bar
      fields: [sessions.total_sessions, events.event_param_page]
      filters:
        events.event_param_page: "-EMPTY"
        events.page_view_rank: "1"
      sorts: [sessions.total_sessions desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - table_calculation: of_total
          label: "% of Total"
          expression: "${sessions.total_sessions}/sum(${sessions.total_sessions})"
          value_format:
          value_format_name: percent_0
          _kind_hint: measure
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: true
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
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "10"
      hidden_series: [of_total]
      series_colors:
        sessions.total_sessions: "#F9AB00"
        of_total: "#facb04"
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Top 10 Landing pages based on Sessions within timeframe
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 55
      col: 12
      width: 12
      height: 11
    - title: Page Views
      name: Page Views
      model: ga4
      explore: sessions
      type: single_value
      fields: [events.total_page_views, events.total_unique_page_views]
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
      custom_color: "#FFF"
      comparison_label: Unique Page Views
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#c73727",
            font_color: !!null "",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 70
      col: 0
      width: 12
      height: 4
    - title: Average Time on Page
      name: Average Time on Page
      model: ga4
      explore: sessions
      type: single_value
      fields: [events.average_time_to_next_page]
      sorts: [events.average_time_to_next_page desc]
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
      single_value_title: Avg Time on Page
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: !!null "",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Avg time spent on each page in session
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 70
      col: 12
      width: 12
      height: 4
    - title: Top Pages
      name: Top Pages
      model: ga4
      explore: sessions
      type: looker_bar
      fields:
        [
          events.total_page_views,
          events.total_unique_page_views,
          events.event_param_page,
        ]
      filters:
        events.event_param_page: "-EMPTY"
      sorts: [events.total_page_views desc]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: true
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
      y_axes:
        [
          {
            label: "",
            orientation: bottom,
            series:
              [
                {
                  axisId: events.total_page_views,
                  id: events.total_page_views,
                  name: Total Page Views,
                },
                {
                  axisId: events.total_unique_page_views,
                  id: events.total_unique_page_views,
                  name: Total Unique Page Views,
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      size_by_field: event_data.total_unique_page_views
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "10"
      series_types:
        events.total_unique_page_views: scatter
      series_colors:
        events.total_page_views: "#B31412"
        events.total_unique_page_views: "#BDC1C6"
      label_color: ["#B31412", transparent]
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
      comparison_label: Unique Page Views
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#c73727",
            font_color: !!null "",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      note_state: collapsed
      note_display: hover
      note_text: Top Pages based on Page Views within timeframe
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 74
      col: 0
      width: 12
      height: 12
    - title: Average Time by Page
      name: Average Time by Page
      model: ga4
      explore: sessions
      type: looker_bar
      fields:
        [
          events.event_param_page,
          events.average_time_to_next_page,
          events.total_page_views,
        ]
      filters:
        events.event_param_page: "-EMPTY"
      sorts: [events.total_page_views desc]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: true
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
      y_axes:
        [
          {
            label: "",
            orientation: bottom,
            series:
              [
                {
                  axisId: events.average_time_to_next_page,
                  id: events.average_time_to_next_page,
                  name: Average Time to Next Event,
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: "10"
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: true
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      single_value_title: Avg Time on Page
      conditional_formatting:
        [
          {
            type: not null,
            value: !!null "",
            background_color: "#1A73E8",
            font_color: !!null "",
            color_application:
              {
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
                palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: [events.total_page_views]
      note_state: collapsed
      note_display: hover
      note_text: Avg time spent on each page in session
      listen:
        Date: sessions.session_date
        Landing Page: sessions.landing_page
      row: 74
      col: 12
      width: 12
      height: 12
    - name: " (2)"
      type: text
      title_text: ""
      body_text:
        "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
        font-size: 28px;\">Behavior\n</h1><h2 style=\"font-size: 16px;\">What are people\
        \ doing on your website?\n</h2></div>\n</div>"
      row: 66
      col: 0
      width: 24
      height: 4
    - name: " (3)"
      type: text
      title_text: ""
      body_text:
        "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
        font-size: 28px;\">Audience</h1><h2 style=\"font-size: 16px;\">Who is visiting\
        \ your website?</h2></div>\n</div>"
      row: 28
      col: 0
      width: 24
      height: 4
    - name: " (4)"
      type: text
      title_text: ""
      body_text:
        "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
        font-size: 28px;\">Acquisition\n</h1><h2 style=\"font-size: 16px;\">How are\
        \ people finding you?</h2></div>\n</div>"
      row: 44
      col: 0
      width: 24
      height: 4
    - name: " (5)"
      type: text
      title_text: ""
      subtitle_text: ""
      body_text:
        "<div style=\"border: solid 1px #1A73E8; border-radius: 5px; padding:\
        \ 3px 10px; background: #eaf1fe; text-align: center; margin-bottom: 10px;\"\
        >\n\t<div>\n\t\t<img style=\"height: 60px; margin-top: 30px;\" src=\"https://www.gstatic.com/analytics-suite/header/suite/v2/ic_analytics.svg\"\
        />\n\t</div><br>\n<nav style=\"font-size: 18px; position: absolute; bottom:\
        \ 0; text-align: center;\">\n  <a style=\"padding: 5px; line-height: 40px;\"\
        \ href=\"/dashboards/PN9nQ4JkxqDkSkYcS97hBp\">\n  \t<svg style=\"height: 16px;\
        \ fill: #4285F4;\" class=\"svg-icon\" viewBox=\"0 0 20 20\">\n\t\t\t\t\t\t\t\
        <path d=\"M17.431,2.156h-3.715c-0.228,0-0.413,0.186-0.413,0.413v6.973h-2.89V6.687c0-0.229-0.186-0.413-0.413-0.413H6.285c-0.228,0-0.413,0.184-0.413,0.413v6.388H2.569c-0.227,0-0.413,0.187-0.413,0.413v3.942c0,0.228,0.186,0.413,0.413,0.413h14.862c0.228,0,0.413-0.186,0.413-0.413V2.569C17.844,2.342,17.658,2.156,17.431,2.156\
        \ M5.872,17.019h-2.89v-3.117h2.89V17.019zM9.587,17.019h-2.89V7.1h2.89V17.019z\
        \ M13.303,17.019h-2.89v-6.651h2.89V17.019z M17.019,17.019h-2.891V2.982h2.891V17.019z\"\
        ></path>\n</svg>\nGA Overview</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
        \ href=\"/dashboards/f1X8ozHDTZlzJEiZxdeEK0\">\n<svg style=\"height: 16px; fill:\
        \ #4285F4;\" class=\"svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M12.075,10.812c1.358-0.853,2.242-2.507,2.242-4.037c0-2.181-1.795-4.618-4.198-4.618S5.921,4.594,5.921,6.775c0,1.53,0.884,3.185,2.242,4.037c-3.222,0.865-5.6,3.807-5.6,7.298c0,0.23,0.189,0.42,0.42,0.42h14.273c0.23,0,0.42-0.189,0.42-0.42C17.676,14.619,15.297,11.677,12.075,10.812\
        \ M6.761,6.775c0-2.162,1.773-3.778,3.358-3.778s3.359,1.616,3.359,3.778c0,2.162-1.774,3.778-3.359,3.778S6.761,8.937,6.761,6.775\
        \ M3.415,17.69c0.218-3.51,3.142-6.297,6.704-6.297c3.562,0,6.486,2.787,6.705,6.297H3.415z\"\
        ></path>\n</svg>\nAudience</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
        \ href=\"/dashboards/aXygLSwfJrHctwWS6Yc07f\">\n<svg style=\"height: 16px; fill:\
        \ #4285F4;\" class=\"svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M8.749,9.934c0,0.247-0.202,0.449-0.449,0.449H4.257c-0.247,0-0.449-0.202-0.449-0.449S4.01,9.484,4.257,9.484H8.3C8.547,9.484,8.749,9.687,8.749,9.934\
        \ M7.402,12.627H4.257c-0.247,0-0.449,0.202-0.449,0.449s0.202,0.449,0.449,0.449h3.145c0.247,0,0.449-0.202,0.449-0.449S7.648,12.627,7.402,12.627\
        \ M8.3,6.339H4.257c-0.247,0-0.449,0.202-0.449,0.449c0,0.247,0.202,0.449,0.449,0.449H8.3c0.247,0,0.449-0.202,0.449-0.449C8.749,6.541,8.547,6.339,8.3,6.339\
        \ M18.631,4.543v10.78c0,0.248-0.202,0.45-0.449,0.45H2.011c-0.247,0-0.449-0.202-0.449-0.45V4.543c0-0.247,0.202-0.449,0.449-0.449h16.17C18.429,4.094,18.631,4.296,18.631,4.543\
        \ M17.732,4.993H2.46v9.882h15.272V4.993z M16.371,13.078c0,0.247-0.202,0.449-0.449,0.449H9.646c-0.247,0-0.449-0.202-0.449-0.449c0-1.479,0.883-2.747,2.162-3.299c-0.434-0.418-0.714-1.008-0.714-1.642c0-1.197,0.997-2.246,2.133-2.246s2.134,1.049,2.134,2.246c0,0.634-0.28,1.224-0.714,1.642C15.475,10.331,16.371,11.6,16.371,13.078M11.542,8.137c0,0.622,0.539,1.348,1.235,1.348s1.235-0.726,1.235-1.348c0-0.622-0.539-1.348-1.235-1.348S11.542,7.515,11.542,8.137\
        \ M15.435,12.629c-0.214-1.273-1.323-2.246-2.657-2.246s-2.431,0.973-2.644,2.246H15.435z\"\
        ></path>\n</svg>\nAcquisition</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
        \ href=\"/dashboards/r2XRtfWM9ZzTOO1xEars61\">\n<svg  style=\"height: 16px;\
        \ fill: #4285F4;\" class=\"svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M17.237,3.056H2.93c-0.694,0-1.263,0.568-1.263,1.263v8.837c0,0.694,0.568,1.263,1.263,1.263h4.629v0.879c-0.015,0.086-0.183,0.306-0.273,0.423c-0.223,0.293-0.455,0.592-0.293,0.92c0.07,0.139,0.226,0.303,0.577,0.303h4.819c0.208,0,0.696,0,0.862-0.379c0.162-0.37-0.124-0.682-0.374-0.955c-0.089-0.097-0.231-0.252-0.268-0.328v-0.862h4.629c0.694,0,1.263-0.568,1.263-1.263V4.319C18.5,3.625,17.932,3.056,17.237,3.056\
        \ M8.053,16.102C8.232,15.862,8.4,15.597,8.4,15.309v-0.89h3.366v0.89c0,0.303,0.211,0.562,0.419,0.793H8.053z\
        \ M17.658,13.156c0,0.228-0.193,0.421-0.421,0.421H2.93c-0.228,0-0.421-0.193-0.421-0.421v-1.263h15.149V13.156z\
        \ M17.658,11.052H2.509V4.319c0-0.228,0.193-0.421,0.421-0.421h14.308c0.228,0,0.421,0.193,0.421,0.421V11.052z\"\
        ></path>\n</svg>\nBehavior</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
        \ href=\"/dashboards/ucpZw7uM0yeve1p8eCiCok\">\n<svg  style=\"height: 16px;\
        \ fill: #4285F4;\" class=\"svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M15.94,10.179l-2.437-0.325l1.62-7.379c0.047-0.235-0.132-0.458-0.372-0.458H5.25c-0.241,0-0.42,0.223-0.373,0.458l1.634,7.376L4.06,10.179c-0.312,0.041-0.446,0.425-0.214,0.649l2.864,2.759l-0.724,3.947c-0.058,0.315,0.277,0.554,0.559,0.401l3.457-1.916l3.456,1.916c-0.419-0.238,0.56,0.439,0.56-0.401l-0.725-3.947l2.863-2.759C16.388,10.604,16.254,10.22,15.94,10.179M10.381,2.778h3.902l-1.536,6.977L12.036,9.66l-1.655-3.546V2.778z\
        \ M5.717,2.778h3.903v3.335L7.965,9.66L7.268,9.753L5.717,2.778zM12.618,13.182c-0.092,0.088-0.134,0.217-0.11,0.343l0.615,3.356l-2.938-1.629c-0.057-0.03-0.122-0.048-0.184-0.048c-0.063,0-0.128,0.018-0.185,0.048l-2.938,1.629l0.616-3.356c0.022-0.126-0.019-0.255-0.11-0.343l-2.441-2.354l3.329-0.441c0.128-0.017,0.24-0.099,0.295-0.215l1.435-3.073l1.435,3.073c0.055,0.116,0.167,0.198,0.294,0.215l3.329,0.441L12.618,13.182z\"\
        ></path>\n</svg>\nConversions</a>\n</nav>\n</div>\n"
      row: 1
      col: 0
      width: 24
      height: 4
    - type: extension
      extension_id: genai_extensions::dashboard-summarization
      title: Dashboard Insights Powered by Vertex AI
      name: Dashboard Insights Powered by Vertex AI
      row: 5
      col: 0
      width: 24
      height: 6
    - type: button
      name: button_3965
      rich_content_json: '{"text":"New Button","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED"}'
      row: 0
      col: 0
      width: 24
      height: 1
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 2020/01/01 to 2023/01/02
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
        options: []
      model: ga4
      explore: sessions
      listens_to_filters: []
      field: sessions.session_date
    - name: Landing Page
      title: Landing Page
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: tag_list
        display: popover
        options: []
      model: ga4
      explore: sessions
      listens_to_filters: []
      field: sessions.landing_page

---
- dashboard: amwell_dash
  title: amwell dash
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: 1PO16VEQpU0cYye6CuUlV7
  elements:
    - title: amwell dash
      name: amwell dash
      model: thelook
      explore: order_items
      type: looker_grid
      fields:
        [
          users.email,
          users.state,
          users.age,
          user_order_facts.lifetime_orders,
          user_order_facts.lifetime_revenue,
          order_items.30_day_repeat_purchase_rate,
        ]
      filters: {}
      sorts: [
          user_order_facts.lifetime_orders desc,
          user_order_facts.lifetime_revenue
          desc,
          order_items.30_day_repeat_purchase_rate desc 0,
        ]
      limit: 500
      column_limit: 50
      y_axes: []
      listen:
        Created Date: order_items.created_date
      row: 0
      col: 0
      width: 12
      height: 8
    - type: extension
      extension_id: genai_extensions::dashboard-summarization
      title: Dashboard Insights Powered by Vertex AI
      name: Dashboard Insights Powered by Vertex AI
      row: 0
      col: 12
      width: 12
      height: 14
  filters:
    - name: Created Date
      title: Created Date
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
      field: order_items.created_date

---
- dashboard: annual_sales_dashboard
  title: Annual sales dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: Nxamze1LPXVmNBHWtC2aQn
  elements:
    - title: Annual sales dashboard
      name: Annual sales dashboard
      model: thelook
      explore: order_items
      type: looker_column
      fields: [order_items.total_sale_price, order_items.created_year]
      filters: {}
      sorts: [order_items.created_year desc 0]
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
      trellis: ""
      stacking: ""
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
      default_value: 4 years
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
- dashboard: apr23_demo
  title: APR23_DEMO
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: oaEyuoXpZtefwkfo0ihAuq
  elements:
    - title: APR23_DEMO
      name: APR23_DEMO
      model: thelook
      explore: order_items
      type: looker_column
      fields:
        [
          products.category,
          order_items.total_sale_price,
          order_items.total_gross_margin,
        ]
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
      trellis: ""
      stacking: ""
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
- dashboard: arjunvijayvargiya
  title: ArjunVijayvargiya
  layout: newspaper
  description: ""
  preferred_slug: eO0tBfXjEMVKDXgJmHAhv4
  elements:
    - title: Untitled
      name: Untitled
      model: thelook
      explore: order_items
      type: looker_google_map
      fields: [users.state, order_items.total_gross_margin]
      filters:
        inventory_items.created_date: 90 days
        order_items.total_gross_margin: ">=10000"
        users.country: USA
      sorts: [order_items.total_gross_margin desc]
      column_limit: 50
      hidden_fields: []
      hidden_points_if_no: []
      series_labels: {}
      show_view_names: true
      defaults_version: 0
      y_axes: []
      row: 0
      col: 0
      width: 8
      height: 6

---
- dashboard: ascension_demo_1
  title: ascension demo 1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: q6mveBtq2DZ9FGDRszInNK
  elements:
    - title: ascension demo 1
      name: ascension demo 1
      model: healthcare_operations
      explore: ortho_procedures
      type: looker_line
      fields:
        [
          ortho_payer.payer,
          ortho_procedures.total_procedural_charges,
          ortho_procedures.actual_start_month,
        ]
      pivots: [ortho_procedures.actual_start_month]
      filters: {}
      sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
      limit: 500
      column_limit: 50
      listen:
        Actual Start Month: ortho_procedures.actual_start_month
      row: 8
      col: 0
      width: 12
      height: 8
    - title: New Tile
      name: New Tile
      model: healthcare_operations
      explore: ortho_procedures
      type: looker_column
      fields:
        [
          ortho_npi_facts.facility_name,
          ortho_procedures.average_cost_per_case,
          ortho_procedures.actual_start_month,
        ]
      pivots: [ortho_npi_facts.facility_name]
      fill_fields: [ortho_procedures.actual_start_month]
      sorts:
        [
          ortho_npi_facts.facility_name 0,
          ortho_procedures.actual_start_month desc,
        ]
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
      trellis: ""
      stacking: ""
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
        Actual Start Month: ortho_procedures.actual_start_month
      row: 0
      col: 12
      width: 12
      height: 8
    - type: extension
      extension_id: genai_extensions::dashboard-summarization
      title: Dashboard Insights Powered by Vertex AI
      name: Dashboard Insights Powered by Vertex AI
      row: 0
      col: 0
      width: 12
      height: 8
  filters:
    - name: Actual Start Month
      title: Actual Start Month
      type: field_filter
      default_value: 2020/07/01 to 2020/08/31
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: healthcare_operations
      explore: ortho_procedures
      listens_to_filters: []
      field: ortho_procedures.actual_start_month

---
- dashboard: avg_order_by_dates
  title: avg order by dates
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: 7tTU1djemBZ3gecC21GD9Y
  elements:
    - title: avg order by dates
      name: avg order by dates
      model: thelook
      explore: order_items
      type: looker_grid
      fields:
        [
          order_items.average_sale_price,
          order_items.total_gross_margin,
          discounts.date_day_of_month,
        ]
      filters: {}
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
      show_view_names: true
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
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      custom_color: forestgreen
      font_size: medium
      text_color: black
      colors:
        [
          "#5245ed",
          "#a2dcf3",
          "#776fdf",
          "#1ea8df",
          "#49cec1",
          "#776fdf",
          "#49cec1",
          "#1ea8df",
          "#a2dcf3",
          "#776fdf",
          "#776fdf",
          "#635189",
        ]
      hidden_fields: []
      y_axes: []
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
      trellis: ""
      stacking: ""
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
      note_text: ""
      listen:
        State: users.state
        City: users.city
        Traffic Source: users.traffic_source
        Gender: users.gender
        Created Date: order_items.created_date
        Location: distribution_centers.location
        Country: users.country
        Date Day of Month: discounts.date_day_of_month
      row: 0
      col: 0
      width: 24
      height: 12
  filters:
    - name: City
      title: City
      type: field_filter
      default_value: ""
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
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: users.traffic_source
    - name: State
      title: State
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: users.state
    - name: Gender
      title: Gender
      type: field_filter
      default_value: ""
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
    - name: Location
      title: Location
      type: field_filter
      default_value: ""
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
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: users.country
    - name: Date Day of Month
      title: Date Day of Month
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: range_slider
        display: inline
        options:
          min: 1
          max: 31
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: discounts.date_day_of_month

---
- dashboard: b__test_dashboard
  title: B - Test Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: I7TeJhS887kExVnLvKcX69
  elements:
    - name: Merge Tile
      title: Merge Tile
      merged_queries:
        - model: thelook
          explore: order_items
          type: looker_donut_multiples
          fields: [users.gender, users.traffic_source, order_items.count]
          filters:
            users.state: ""
            users.city: ""
            users.traffic_source: ""
            users.gender: ""
            order_items.created_date: 90 days
            distribution_centers.location: ""
            users.country: ""
          sorts:
            [
              user_order_facts.lifetime_orders_tier__sort_,
              users.traffic_source,
              order_items.count desc,
            ]
          limit: 500
          column_limit: 15
          show_value_labels: true
          font_size: 15
          hide_legend: false
          colors:
            [
              "#64518A",
              "#8D7FB9",
              "#EA8A2F",
              "#F2B431",
              "#2DA5DE",
              "#57BEBE",
              "#7F7977",
              "#B2A898",
              "#494C52",
            ]
          color_application:
            collection_id: google
            palette_id: google-categorical-0
            options:
              steps: 5
          series_colors:
            Email - order_items.count: "#cd1b1d"
          show_view_names: true
          stacking: ""
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
          note_text: ""
          hidden_pivots: {}
        - model: thelook
          explore: order_items
          type: table
          fields: [users.traffic_source, order_items.order_count]
          limit: 500
          join_fields:
            - field_name: users.traffic_source
              source_field_name: users.traffic_source
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      series_colors:
        Email - order_items.count: "#E52592"
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      hidden_fields: [order_items.order_count]
      hidden_pivots: {}
      type: looker_column
      pivots: [users.traffic_source]
      row: 0
      col: 0
      width: 12
      height: 8
    - title: "Query "
      name: "Query "
      model: thelook
      explore: order_items
      type: looker_donut_multiples
      fields: [users.gender, users.traffic_source, order_items.count]
      pivots: [users.traffic_source]
      filters:
        users.state: ""
        users.city: ""
        users.traffic_source: ""
        users.gender: ""
        order_items.created_date: 90 days
        distribution_centers.location: ""
        users.country: ""
      sorts: [
          user_order_facts.lifetime_orders_tier__sort_,
          users.traffic_source,
          order_items.count
          desc 0,
        ]
      limit: 500
      column_limit: 15
      show_value_labels: true
      font_size: 15
      hide_legend: false
      colors:
        [
          "#64518A",
          "#8D7FB9",
          "#EA8A2F",
          "#F2B431",
          "#2DA5DE",
          "#57BEBE",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      series_colors:
        Email - order_items.count: "#cd1b1d"
      show_view_names: true
      stacking: ""
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
      note_text: ""
      hidden_pivots: {}
      listen: {}
      row: 0
      col: 12
      width: 12
      height: 8

---
- dashboard: bank_dashboard
  title: Bank dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: Gc5oN6Z8zdrts2Ypn8UTvp
  elements:
    - title: Top spending customers
      name: Top spending customers
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
      trellis: ""
      stacking: ""
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
      col: 0
      width: 13
      height: 8
    - title: Last 6 months top customers
      name: Last 6 months top customers
      model: thelook
      explore: order_items
      type: looker_line
      fields: [users.email, user_order_facts.lifetime_revenue]
      filters:
        user_order_facts.latest_order_date: 6 months
      sorts: [user_order_facts.lifetime_revenue desc 0]
      limit: 10
      column_limit: 50
      listen:
        Created Date: order_items.created_date
      row: 0
      col: 13
      width: 9
      height: 8
    - title: Top State
      name: Top State
      model: thelook
      explore: order_items
      type: looker_map
      fields:
        [
          users.email,
          users.state,
          user_order_facts.lifetime_revenue,
          user_order_facts.lifetime_orders,
        ]
      filters:
        user_order_facts.repeat_customer: "Yes"
      sorts: [user_order_facts.lifetime_revenue desc]
      limit: 500
      column_limit: 50
      listen:
        Created Date: order_items.created_date
      row: 8
      col: 0
      width: 13
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
- dashboard: bongsoo
  title: Bongsoo
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: EeydP0EbMZmk1ycE9UNqRa
  elements:
    - title: New Tile
      name: New Tile
      model: thelook
      explore: order_items
      type: looker_google_map
      fields:
        [
          users.email,
          users.state,
          users.age,
          user_order_facts.lifetime_orders,
          user_order_facts.lifetime_revenue,
          user_order_facts.repeat_customer,
        ]
      filters:
        user_order_facts.first_order_date: 18 months ago
      sorts: [
          user_order_facts.lifetime_orders desc,
          user_order_facts.lifetime_revenue
          desc 0,
        ]
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
      type: looker_column
      fields: [products.item_name, order_items.count]
      filters:
        order_items.created_date: this month
      sorts: [order_items.count desc 0]
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
      trellis: ""
      stacking: ""
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
- dashboard: branch_overview
  title: Branch Overview
  layout: newspaper
  description: ""
  preferred_slug: 1bhrNFeChLAMzBhD4aThIq
  elements:
    - title: Total Balance in Accounts Yesterday
      name: Total Balance in Accounts Yesterday
      model: retail_banking
      explore: balances_fact
      type: single_value
      fields: [balances_fact.balance_yesterday, balances_fact.balance_change]
      limit: 500
      column_limit: 50
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      value_format: $0.000,, "M"
      comparison_label: since beginning of time period
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
      note_state: collapsed
      note_display: hover
      note_text:
        This is the total balance across all accounts as of yesterday, compared
        with the total balance across all accounts at the beginning of the time period
        specified in the filter
      listen:
        Date: balances_fact.balance_date
      row: 4
      col: 0
      width: 6
      height: 4
    - title: Attrition Rate
      name: Attrition Rate
      model: retail_banking
      explore: balances_fact
      type: single_value
      fields: [balances_fact.attrition_rate]
      limit: 500
      column_limit: 50
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: change
      comparison_reverse_colors: true
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#B32F37"
      conditional_formatting:
        [
          {
            type: equal to,
            value: !!null "",
            background_color: "#3EB0D5",
            font_color: !!null "",
            color_application:
              {
                collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
                palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Total outflow over balance at beginning of period
      listen:
        Date: balances_fact.balance_date
      row: 4
      col: 12
      width: 6
      height: 4
    - title: Inflow Rate
      name: Inflow Rate
      model: retail_banking
      explore: balances_fact
      type: single_value
      fields: [balances_fact.inflow_rate]
      limit: 500
      column_limit: 50
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: change
      comparison_reverse_colors: true
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
        palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      custom_color: "#08B248"
      conditional_formatting:
        [
          {
            type: equal to,
            value: !!null "",
            background_color: "#3EB0D5",
            font_color: !!null "",
            color_application:
              {
                collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
                palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Total inflow over balance at beginning of period
      listen:
        Date: balances_fact.balance_date
      row: 4
      col: 6
      width: 6
      height: 4
    - title: Number of Clients
      name: Number of Clients
      model: retail_banking
      explore: trans
      type: single_value
      fields: [account.number_of_accounts]
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
      trellis: ""
      stacking: ""
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
      hidden_fields: []
      y_axes: []
      listen: {}
      row: 4
      col: 18
      width: 6
      height: 4
    - name: "<span class='fa fa-tachometer'> Asset Overview </span>"
      type: text
      title_text: "<span class='fa fa-tachometer'> Asset Overview </span>"
      subtitle_text: How are our accounts doing?
      body_text:
        "**Recommended action:** Drill into inflow rate to get a closer look\
        \ at high value accounts. Follow up with clients to schedule an investment meeting\
        \ or to let them know about new offerings"
      row: 0
      col: 0
      width: 24
      height: 4
    - title: Inflow and Outflow Over Time
      name: Inflow and Outflow Over Time
      model: retail_banking
      explore: balances_fact
      type: looker_line
      fields:
        [
          balances_fact.balance_date,
          balances_fact.total_balance,
          trans.total_outflow,
          trans.total_inflow,
        ]
      filters:
        balances_fact.balance_date: 6 months
        account.account_id: ""
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: monotone
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: trans.total_outflow,
                  id: trans.total_outflow,
                  name: Total Outflow,
                },
                {
                  axisId: trans.total_inflow,
                  id: trans.total_inflow,
                  name: Total Inflow,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: balances_fact.total_balance,
                  id: balances_fact.total_balance,
                  name: Total Balance,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors:
        trans.total_outflow: "#B32F37"
        trans.total_inflow: "#72D16D"
        balances_fact.total_balance: "#4276BE"
      series_point_styles:
        balances_fact.total_balance: diamond
      defaults_version: 1
      hidden_fields: []
      listen: {}
      row: 8
      col: 0
      width: 24
      height: 7
    - name: "<span class='fa fa-bank'> Cross Selling</span>"
      type: text
      title_text: "<span class='fa fa-bank'> Cross Selling</span>"
      subtitle_text: What other products do our customers have?
      body_text:
        "**Recommended action:** Explore from here to see what clients may\
        \ benefit from automated outreach for cross-sell opportunities"
      row: 27
      col: 0
      width: 24
      height: 5
    - title: Outflows by Category
      name: Outflows by Category
      model: retail_banking
      explore: trans
      type: looker_column
      fields:
        [
          trans.total_transaction_value,
          trans.category,
          trans.number_of_transactions,
        ]
      filters:
        trans.type: Debit
        trans.total_transaction_value: ">0"
        trans.category: "-Interest Sanctioned"
      sorts: [trans.total_transaction_value desc]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: trans.total_transaction_value,
                  id: trans.total_transaction_value,
                  name: Total Transaction Value,
                },
              ],
            showLabels: false,
            showValues: true,
            valueFormat: '$0.0,,, "B"',
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: trans.number_of_transactions,
                  id: trans.number_of_transactions,
                  name: Number of Transactions,
                },
              ],
            showLabels: false,
            showValues: true,
            valueFormat: '0,
              "K"',
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      font_size: "12"
      label_value_format: ""
      series_types:
        trans.number_of_transactions: line
      series_colors:
        trans.number_of_transactions: "#B32F37"
        trans.total_transaction_value: "#FBB555"
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      hidden_fields: []
      listen: {}
      row: 19
      col: 0
      width: 7
      height: 8
    - title: Clients with Large Outflows this Period
      name: Clients with Large Outflows this Period
      model: retail_banking
      explore: balances_fact
      type: looker_grid
      fields:
        [
          account.account_id,
          account.create_date,
          balances_fact.balance_yesterday,
          trans.total_outflow,
        ]
      filters:
        balances_fact.balance_date: 7 days
      sorts: [trans.total_outflow desc]
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
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      series_labels:
        account.account_id: Account ID
        account.create_date: Client Since
        trans.total_outflow: Outflow this Period
        balances_fact.balance_yesterday: Current Balance
      series_cell_visualizations:
        trans.total_outflow:
          is_active: true
          palette:
            palette_id: b8082353-c148-8a21-077d-fafc86b1c081
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#E57947"
              - "#FBB555"
        balances_fact.balance_yesterday:
          is_active: true
          palette:
            palette_id: 4e438ce5-22c9-8333-bb3d-73afe7f95cfc
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#C2DD67"
              - "#72D16D"
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      listen: {}
      row: 19
      col: 14
      width: 10
      height: 8
    - name: "<span class='fa fa-dollar'> Outflow </span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Outflow </span>"
      subtitle_text: Why are customers withdrawing from accounts?
      body_text:
        "**Recommended action:** Investigate interest rates from other banks\
        \ and drill into the Account Dashboard to understand why clients are taking\
        \ money from their account"
      row: 15
      col: 0
      width: 24
      height: 4
    - title: Transfers to and from External Banks
      name: Transfers to and from External Banks
      model: retail_banking
      explore: trans
      type: looker_column
      fields: [trans.total_transaction_value, trans.bank, trans.type]
      pivots: [trans.type]
      filters:
        trans.operation: Collect from Bank,Remittance to Bank
        trans.bank: "-Internal"
      sorts: [trans.total_transaction_value desc 0, trans.type]
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
      trellis: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: Credit - trans.total_transaction_value,
                  id: Credit - trans.total_transaction_value,
                  name: Outflow,
                },
                { axisId: Debit
                    - trans.total_transaction_value, id: Debit - trans.total_transaction_value, name: Inflow },
              ],
            showLabels: false,
            showValues: true,
            valueFormat: '$0,,
              "M"',
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors:
        Credit - trans.total_transaction_value: "#E57947"
        Debit - trans.total_transaction_value: "#72D16D"
      series_labels:
        Credit - trans.total_transaction_value: Outflow
        Debit - trans.total_transaction_value: Inflow
      hidden_fields: []
      hidden_points_if_no: []
      defaults_version: 1
      listen: {}
      row: 19
      col: 7
      width: 7
      height: 8
    - title: Age Days Between Signing Up for a Credit Card
      name: Age Days Between Signing Up for a Credit Card
      model: retail_banking
      explore: account
      type: looker_column
      fields:
        [card.average_days_between_account_signup, card.type, client.age_tier]
      pivots: [card.type]
      filters:
        card.type: -"Null"
        client.age_tier: "-Below 18"
      sorts:
        [
          card.average_days_between_account_signup desc 0,
          client.age_tier,
          card.type,
        ]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: card.average_days_between_account_signup,
                  id: Looker Junior - 0 - card.average_days_between_account_signup,
                  name: Looker
                    Junior,
                },
                { axisId: card.average_days_between_account_signup, id: Looker
                    Emerald - 1 - card.average_days_between_account_signup, name: Looker
                    Emerald },
                { axisId: card.average_days_between_account_signup, id: Looker
                    Ruby - 2 - card.average_days_between_account_signup, name: Looker Ruby },
                {
                  axisId: card.average_days_between_account_signup,
                  id: Looker Ruby Preferred
                    - 3 - card.average_days_between_account_signup,
                  name: Looker Ruby Preferred,
                },
                {
                  axisId: card.average_days_between_account_signup,
                  id: Looker Business Reserve
                    - 4 - card.average_days_between_account_signup,
                  name: Looker Business
                    Reserve,
                },
              ],
            showLabels: false,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
      defaults_version: 1
      listen: {}
      row: 39
      col: 0
      width: 11
      height: 8
    - name: ""
      type: text
      body_text: "<p>"
      row: 32
      col: 11
      width: 2
      height: 15
    - title: Average Daily Account Balance by Card Type
      name: Average Daily Account Balance by Card Type
      model: retail_banking
      explore: balances_fact
      type: looker_column
      fields: [balances_fact.average_daily_balance, card.type]
      pivots: [card.type]
      filters:
        balances_fact.balance_date: 7 days
        card.type: -"Null"
      sorts: [card.type]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: right
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: balances_fact.average_daily_balance,
                  id: Looker Junior - 0 - balances_fact.average_daily_balance,
                  name: Looker
                    Junior,
                },
                {
                  axisId: balances_fact.average_daily_balance,
                  id: Looker Emerald
                    - 1 - balances_fact.average_daily_balance,
                  name: Looker Emerald,
                },
                {
                  axisId: balances_fact.average_daily_balance,
                  id: Looker Ruby - 2 - balances_fact.average_daily_balance,
                  name: Looker Ruby,
                },
                { axisId: balances_fact.average_daily_balance, id: Looker
                    Ruby Preferred - 3 - balances_fact.average_daily_balance, name: Looker
                    Ruby Preferred },
                { axisId: balances_fact.average_daily_balance, id: Looker
                    Business Reserve - 4 - balances_fact.average_daily_balance, name: Looker
                    Business Reserve },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      hide_legend: true
      series_colors: {}
      defaults_version: 1
      listen: {}
      row: 34
      col: 4
      width: 7
      height: 5
    - title: Clients w/ Loans
      name: Clients w/ Loans
      model: retail_banking
      explore: account
      type: single_value
      fields: [loan.number_of_loans, client.percent_clients_with_loans]
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
      comparison_label: of Clients
      defaults_version: 1
      listen: {}
      row: 34
      col: 13
      width: 4
      height: 5
    - title: Clients w/ Cards
      name: Clients w/ Cards
      model: retail_banking
      explore: account
      type: single_value
      fields: [card.number_of_credit_cards, client.percent_clients_with_cards]
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
      comparison_label: of Clients
      defaults_version: 1
      listen: {}
      row: 34
      col: 0
      width: 4
      height: 5
    - name: Credit Cards
      type: text
      title_text: Credit Cards
      body_text: "[Card Overview Dashboard](https://demoexpo.looker.com/dashboards/304)"
      row: 32
      col: 0
      width: 11
      height: 2
    - name: Loans
      type: text
      title_text: Loans
      row: 32
      col: 13
      width: 11
      height: 2
    - title: Average Days between Signing up for Loan
      name: Average Days between Signing up for Loan
      model: retail_banking
      explore: account
      type: looker_column
      fields: [loan.average_days_between_signup, client.age_tier]
      filters:
        client.age_tier: "-Below 18,-65 to 74,-75 or Above,-Undefined"
      sorts: [loan.average_days_between_signup desc]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: loan.average_days_between_signup,
                  id: loan.average_days_between_signup,
                  name: Average Days Between Signup,
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
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
      row: 34
      col: 17
      width: 7
      height: 5
    - title: Loan Status by Age Tier
      name: Loan Status by Age Tier
      model: retail_banking
      explore: account
      type: looker_donut_multiples
      fields: [client.age_tier, loan.status, loan.number_of_loans]
      pivots: [loan.status]
      filters:
        loan.status: "-Unknown"
        client.age_tier: "-Undefined"
      sorts: [client.age_tier, loan.status]
      limit: 500
      column_limit: 50
      show_value_labels: false
      font_size: 12
      color_application:
        collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
        palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
        options:
          steps: 5
      series_colors:
        Running, OK - 2 - loan.number_of_loans: "#FFD95F"
        Running, In Debt - 3 - loan.number_of_loans: "#E57947"
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
      row: 39
      col: 13
      width: 11
      height: 8
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 1 months
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: retail_banking
      explore: balances_fact
      listens_to_filters: []
      field: balances_fact.balance_date

---
- dashboard: branch_overview_copy
  title: Branch Overview (Copy)
  layout: newspaper
  description: ""
  preferred_slug: Y7cydsFDKOWTtSk9jtt3rN
  elements:
    - title: Ending Balance in Accounts
      name: Ending Balance in Accounts
      model: retail_banking
      explore: balances_fact
      type: single_value
      fields:
        [
          balances_fact.balance_date,
          balances_fact.total_balance,
          balances_fact.balance_at_beginning,
        ]
      fill_fields: [balances_fact.balance_date]
      filters: {}
      sorts: [balances_fact.balance_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
        - category: table_calculation
          expression: max(${balances_fact.balance_at_beginning})
          label: Beginning Balance
          value_format:
          value_format_name: usd
          _kind_hint: measure
          table_calculation: beginning_balance
          _type_hint: number
        - category: table_calculation
          expression: "${balances_fact.total_balance} - ${beginning_balance}"
          label: Change in Balance
          value_format:
          value_format_name: usd_0
          _kind_hint: measure
          table_calculation: change_in_balance
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
      value_format: $0.000,, "M"
      comparison_label: Since Beginning of Time Period
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
      hidden_fields: [balances_fact.balance_at_beginning, beginning_balance]
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text:
        This is the total balance across all accounts as of the end of the
        filtered time period, compared with the total balance across all accounts at
        the beginning of the time period specified in the filter
      hidden_pivots: {}
      listen:
        Date: balances_fact.balance_date
      row: 4
      col: 0
      width: 6
      height: 4
    - title: Attrition Rate
      name: Attrition Rate
      model: retail_banking
      explore: balances_fact
      type: single_value
      fields: [balances_fact.attrition_rate]
      limit: 500
      column_limit: 50
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: change
      comparison_reverse_colors: true
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#B32F37"
      conditional_formatting:
        [
          {
            type: equal to,
            value: !!null "",
            background_color: "#3EB0D5",
            font_color: !!null "",
            color_application:
              {
                collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
                palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Total outflow over balance at beginning of period
      listen:
        Date: balances_fact.balance_date
      row: 4
      col: 12
      width: 6
      height: 4
    - title: Inflow Rate
      name: Inflow Rate
      model: retail_banking
      explore: balances_fact
      type: single_value
      fields: [balances_fact.inflow_rate]
      limit: 500
      column_limit: 50
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: change
      comparison_reverse_colors: true
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
        palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      custom_color: "#08B248"
      conditional_formatting:
        [
          {
            type: equal to,
            value: !!null "",
            background_color: "#3EB0D5",
            font_color: !!null "",
            color_application:
              {
                collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
                palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825,
              },
            bold: false,
            italic: false,
            strikethrough: false,
            fields: !!null "",
          },
        ]
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      note_state: collapsed
      note_display: hover
      note_text: Total inflow over balance at beginning of period
      listen:
        Date: balances_fact.balance_date
      row: 4
      col: 6
      width: 6
      height: 4
    - title: Number of Clients
      name: Number of Clients
      model: retail_banking
      explore: trans
      type: single_value
      fields: [account.number_of_accounts]
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
      trellis: ""
      stacking: ""
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
      hidden_fields: []
      y_axes: []
      listen: {}
      row: 4
      col: 18
      width: 6
      height: 4
    - name: "<span class='fa fa-tachometer'> Asset Overview </span>"
      type: text
      title_text: "<span class='fa fa-tachometer'> Asset Overview </span>"
      subtitle_text: How are our accounts doing?
      body_text:
        "<center> <b>Recommended action: </b>Drill into inflow rate to get\
        \ a closer look at high value accounts. Follow up with clients to schedule an\
        \ investment meeting or to let them know about new offerings <center>"
      row: 0
      col: 0
      width: 24
      height: 4
    - title: Inflow and Outflow Over Time
      name: Inflow and Outflow Over Time
      model: retail_banking
      explore: balances_fact
      type: looker_line
      fields:
        [
          balances_fact.balance_date,
          balances_fact.total_balance,
          trans.total_outflow,
          trans.total_inflow,
        ]
      filters:
        account.account_id: ""
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: monotone
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: trans.total_outflow,
                  id: trans.total_outflow,
                  name: Total Outflow,
                },
                {
                  axisId: trans.total_inflow,
                  id: trans.total_inflow,
                  name: Total Inflow,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: balances_fact.total_balance,
                  id: balances_fact.total_balance,
                  name: Total Balance,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors:
        trans.total_outflow: "#B32F37"
        trans.total_inflow: "#72D16D"
        balances_fact.total_balance: "#4276BE"
      series_point_styles:
        balances_fact.total_balance: diamond
      defaults_version: 1
      hidden_fields: []
      listen:
        Date: balances_fact.balance_date
      row: 8
      col: 0
      width: 24
      height: 7
    - name: "<span class='fa fa-bank'> Cross Selling</span>"
      type: text
      title_text: "<span class='fa fa-bank'> Cross Selling</span>"
      subtitle_text: What other products do our customers have?
      body_text:
        "<center> <b> Recommended action: </b>Explore from here to see what\
        \ clients may benefit from automated outreach for cross-sell opportunities </center>"
      row: 27
      col: 0
      width: 24
      height: 5
    - title: Outflows by Category
      name: Outflows by Category
      model: retail_banking
      explore: trans
      type: looker_column
      fields:
        [
          trans.total_transaction_value,
          trans.category,
          trans.number_of_transactions,
        ]
      filters:
        trans.type: Debit
        trans.total_transaction_value: ">0"
        trans.category: "-Interest Sanctioned"
      sorts: [trans.total_transaction_value desc]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: trans.total_transaction_value,
                  id: trans.total_transaction_value,
                  name: Total Transaction Value,
                },
              ],
            showLabels: false,
            showValues: true,
            valueFormat: '$0.0,,, "B"',
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  axisId: trans.number_of_transactions,
                  id: trans.number_of_transactions,
                  name: Number of Transactions,
                },
              ],
            showLabels: false,
            showValues: true,
            valueFormat: '0,
              "K"',
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      font_size: "12"
      label_value_format: ""
      series_types:
        trans.number_of_transactions: line
      series_colors:
        trans.number_of_transactions: "#B32F37"
        trans.total_transaction_value: "#FBB555"
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      hidden_fields: []
      listen: {}
      row: 19
      col: 0
      width: 7
      height: 8
    - title: Clients with Large Outflows this Period
      name: Clients with Large Outflows this Period
      model: retail_banking
      explore: balances_fact
      type: looker_grid
      fields: [account.account_id, account.create_date, trans.total_outflow]
      filters: {}
      sorts: [trans.total_outflow desc]
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
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      series_labels:
        account.account_id: Account ID
        account.create_date: Client Since
        trans.total_outflow: Outflow this Period
        balances_fact.balance_yesterday: Current Balance
      series_cell_visualizations:
        trans.total_outflow:
          is_active: true
          palette:
            palette_id: b8082353-c148-8a21-077d-fafc86b1c081
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#E57947"
              - "#FBB555"
        balances_fact.balance_yesterday:
          is_active: true
          palette:
            palette_id: 4e438ce5-22c9-8333-bb3d-73afe7f95cfc
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#C2DD67"
              - "#72D16D"
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      hidden_pivots: {}
      listen:
        Date: balances_fact.balance_date
      row: 19
      col: 14
      width: 10
      height: 8
    - name: "<span class='fa fa-dollar'> Outflow </span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Outflow </span>"
      subtitle_text: Why are customers withdrawing from accounts?
      body_text:
        "<center> <b>Recommended action: </b> Investigate interest rates from\
        \ other banks and drill into the Account Dashboard to understand why clients\
        \ are taking money from their account </center>"
      row: 15
      col: 0
      width: 24
      height: 4
    - title: Transfers to and from External Banks
      name: Transfers to and from External Banks
      model: retail_banking
      explore: trans
      type: looker_column
      fields: [trans.total_transaction_value, trans.bank, trans.type]
      pivots: [trans.type]
      filters:
        trans.operation: Collect from Bank,Remittance to Bank
        trans.bank: "-Internal"
      sorts: [trans.total_transaction_value desc 0, trans.type]
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
      trellis: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: Credit - trans.total_transaction_value,
                  id: Credit - trans.total_transaction_value,
                  name: Outflow,
                },
                { axisId: Debit
                    - trans.total_transaction_value, id: Debit - trans.total_transaction_value, name: Inflow },
              ],
            showLabels: false,
            showValues: true,
            valueFormat: '$0,,
              "M"',
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors:
        Credit - trans.total_transaction_value: "#E57947"
        Debit - trans.total_transaction_value: "#72D16D"
      series_labels:
        Credit - trans.total_transaction_value: Outflow
        Debit - trans.total_transaction_value: Inflow
      hidden_fields: []
      hidden_points_if_no: []
      defaults_version: 1
      listen: {}
      row: 19
      col: 7
      width: 7
      height: 8
    - title: Age Days Between Signing Up for a Credit Card
      name: Age Days Between Signing Up for a Credit Card
      model: retail_banking
      explore: account
      type: looker_column
      fields:
        [card.average_days_between_account_signup, card.type, client.age_tier]
      pivots: [card.type]
      filters:
        card.type: -"Null"
        client.age_tier: "-Below 18"
      sorts:
        [
          card.average_days_between_account_signup desc 0,
          client.age_tier,
          card.type,
        ]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: card.average_days_between_account_signup,
                  id: Looker Junior - 0 - card.average_days_between_account_signup,
                  name: Looker
                    Junior,
                },
                { axisId: card.average_days_between_account_signup, id: Looker
                    Emerald - 1 - card.average_days_between_account_signup, name: Looker
                    Emerald },
                { axisId: card.average_days_between_account_signup, id: Looker
                    Ruby - 2 - card.average_days_between_account_signup, name: Looker Ruby },
                {
                  axisId: card.average_days_between_account_signup,
                  id: Looker Ruby Preferred
                    - 3 - card.average_days_between_account_signup,
                  name: Looker Ruby Preferred,
                },
                {
                  axisId: card.average_days_between_account_signup,
                  id: Looker Business Reserve
                    - 4 - card.average_days_between_account_signup,
                  name: Looker Business
                    Reserve,
                },
              ],
            showLabels: false,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
      defaults_version: 1
      listen: {}
      row: 39
      col: 0
      width: 11
      height: 8
    - name: ""
      type: text
      body_text: "<p>"
      row: 32
      col: 11
      width: 2
      height: 15
    - title: Average Daily Account Balance by Card Type
      name: Average Daily Account Balance by Card Type
      model: retail_banking
      explore: balances_fact
      type: looker_bar
      fields: [balances_fact.average_daily_balance, card.type]
      pivots: [card.type]
      filters:
        card.type: -"Null"
      sorts: [card.type]
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
      trellis: ""
      stacking: ""
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
        collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
        palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
        options:
          steps: 5
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: balances_fact.average_daily_balance,
                  id: Looker Junior - 0 - balances_fact.average_daily_balance,
                  name: Looker
                    Junior,
                },
                {
                  axisId: balances_fact.average_daily_balance,
                  id: Looker Emerald
                    - 1 - balances_fact.average_daily_balance,
                  name: Looker Emerald,
                },
                {
                  axisId: balances_fact.average_daily_balance,
                  id: Looker Ruby - 2 - balances_fact.average_daily_balance,
                  name: Looker Ruby,
                },
                { axisId: balances_fact.average_daily_balance, id: Looker
                    Ruby Preferred - 3 - balances_fact.average_daily_balance, name: Looker
                    Ruby Preferred },
                { axisId: balances_fact.average_daily_balance, id: Looker
                    Business Reserve - 4 - balances_fact.average_daily_balance, name: Looker
                    Business Reserve },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      x_axis_zoom: true
      y_axis_zoom: true
      hide_legend: false
      series_colors: {}
      defaults_version: 1
      listen:
        Date: balances_fact.balance_date
      row: 34
      col: 4
      width: 7
      height: 5
    - title: Clients w/ Loans
      name: Clients w/ Loans
      model: retail_banking
      explore: account
      type: single_value
      fields: [loan.number_of_loans, client.percent_clients_with_loans]
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
      comparison_label: of Clients
      defaults_version: 1
      listen: {}
      row: 34
      col: 13
      width: 4
      height: 5
    - title: Clients w/ Cards
      name: Clients w/ Cards
      model: retail_banking
      explore: account
      type: single_value
      fields: [card.number_of_credit_cards, client.percent_clients_with_cards]
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
      comparison_label: of Clients
      defaults_version: 1
      listen: {}
      row: 34
      col: 0
      width: 4
      height: 5
    - name: Credit Cards
      type: text
      title_text: Credit Cards
      subtitle_text: ""
      body_text: ""
      row: 32
      col: 0
      width: 11
      height: 2
    - name: Loans
      type: text
      title_text: Loans
      row: 32
      col: 13
      width: 11
      height: 2
    - title: Average Days between Signing up for Loan
      name: Average Days between Signing up for Loan
      model: retail_banking
      explore: account
      type: looker_column
      fields: [loan.average_days_between_signup, client.age_tier]
      filters:
        client.age_tier: "-Below 18,-65 to 74,-75 or Above,-Undefined"
      sorts: [loan.average_days_between_signup desc]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: loan.average_days_between_signup,
                  id: loan.average_days_between_signup,
                  name: Average Days Between Signup,
                },
              ],
            showLabels: false,
            showValues: false,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
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
      row: 34
      col: 17
      width: 7
      height: 5
    - title: Loan Status by Age Tier
      name: Loan Status by Age Tier
      model: retail_banking
      explore: account
      type: looker_donut_multiples
      fields: [client.age_tier, loan.status, loan.number_of_loans]
      pivots: [loan.status]
      filters:
        loan.status: "-Unknown"
        client.age_tier: "-Undefined"
      sorts: [client.age_tier, loan.status]
      limit: 500
      column_limit: 50
      show_value_labels: false
      font_size: 12
      color_application:
        collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
        palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
        options:
          steps: 5
      series_colors:
        Running, OK - 2 - loan.number_of_loans: "#FFD95F"
        Running, In Debt - 3 - loan.number_of_loans: "#E57947"
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
      stacking: ""
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
      row: 39
      col: 13
      width: 11
      height: 8
  filters:
    - name: Date
      title: Date
      type: field_filter
      default_value: 2023-04
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
        options: []
      model: retail_banking
      explore: balances_fact
      listens_to_filters: []
      field: balances_fact.balance_date

---
- dashboard: brand_lookup
  title: Brand Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  query_timezone: user_timezone
  preferred_slug: IOlEDOPQ12RFCyuUqk38wB
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: "#556d7a"
  elements:
    - title: Total Orders
      name: Total Orders
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.order_count]
      sorts: [order_items.order_count desc]
      limit: 500
      font_size: medium
      text_color: black
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 8
      width: 4
      height: 3
    - title: Total Customers
      name: Total Customers
      model: thelook
      explore: order_items
      type: single_value
      fields: [users.count]
      sorts: [users.count desc]
      limit: 500
      font_size: medium
      text_color: black
      note_state: expanded
      note_display: hover
      note_text: I've added a note
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 0
      width: 4
      height: 3
    - title: Average Order Value
      name: Average Order Value
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.average_sale_price]
      sorts: [order_items.average_sale_price desc]
      limit: 500
      column_limit: 50
      font_size: medium
      text_color: black
      note_state: collapsed
      note_display: below
      note_text: ""
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 4
      width: 4
      height: 3
    - title: Brand Traffic by Source, OS
      name: Brand Traffic by Source, OS
      model: thelook
      explore: events
      type: looker_donut_multiples
      fields: [users.traffic_source, events.os, events.count]
      pivots: [users.traffic_source]
      filters:
        users.traffic_source: "-NULL"
      sorts: [events.count desc 1, users.traffic_source]
      limit: 20
      column_limit: 50
      show_value_labels: true
      font_size: 12
      colors:
        [
          "#64518A",
          "#8D7FB9",
          "#EA8A2F",
          "#F2B431",
          "#2DA5DE",
          "#57BEBE",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      series_colors: {}
      show_view_names: true
      stacking: ""
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_labels: false
      defaults_version: 1
      note_state: collapsed
      note_display: above
      note_text: ""
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 28
      col: 14
      width: 10
      height: 11
    - title: Top Product Categories - Cart vs Conversion
      name: Top Product Categories - Cart vs Conversion
      model: thelook
      explore: events
      type: looker_column
      fields:
        [
          product_viewed.category,
          sessions.overall_conversion,
          sessions.cart_to_checkout_conversion,
          sessions.count_cart_or_later,
        ]
      filters:
        product_viewed.category: "-NULL"
      sorts: [sessions.count_cart_or_later desc]
      limit: 8
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
      trellis: ""
      stacking: ""
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
          reverse: false
      y_axes:
        [
          {
            label: Total Added to Cart,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: sessions.count_cart_or_later,
                  name: "(4) Add to Cart or later",
                },
              ],
          },
          {
            label: "",
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                { id: sessions.overall_conversion, name: Overall Conversion },
                {
                  id: sessions.cart_to_checkout_conversion,
                  name: Cart to Checkout Conversion,
                },
              ],
          },
        ]
      y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
      hide_legend: false
      colors: ["#64518A", "#8D7FB9"]
      series_types:
        sessions.cart_to_checkout_conversion: line
        sessions.overall_conversion: line
      series_colors: {}
      series_labels:
        sessions.cart_to_checkout_conversion: Cart to Checkout Conversion
        sessions.overall_conversion: Overall Conversion
        sessions.count_cart_or_later: "# of Add to Cart Events"
      y_axis_orientation: [right, left]
      x_axis_label_rotation: -45
      label_rotation: 0
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 28
      col: 0
      width: 14
      height: 6
    - title: Top Visitors and Transaction History
      name: Top Visitors and Transaction History
      model: thelook
      explore: events
      type: looker_grid
      fields:
        [
          users.name,
          users.email,
          users.state,
          users.traffic_source,
          sessions.count,
        ]
      filters:
        users.name: "-NULL"
      sorts: [sessions.count desc]
      limit: 15
      column_limit: 50
      show_view_names: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      series_cell_visualizations:
        sessions.count:
          is_active: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting_ignored_fields: []
      truncate_column_names: false
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 42
      col: 12
      width: 12
      height: 8
    - title: Sales and Sale Price Trend
      name: Sales and Sale Price Trend
      model: thelook
      explore: order_items
      type: looker_line
      fields:
        [
          order_items.created_date,
          order_items.total_sale_price,
          order_items.average_sale_price,
        ]
      sorts: [order_items.total_sale_price desc]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: false
      show_null_points: true
      interpolation: monotone
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      y_axis_labels: [Total Sale Amount, Average Selling Price]
      x_axis_label: Order Date
      hide_legend: true
      colors: ["#F2B431", "#57BEBE"]
      series_colors: {}
      y_axis_orientation: [left, right]
      x_axis_datetime: true
      hide_points: true
      color_palette: Custom
      defaults_version: 1
      note_state: collapsed
      note_display: hover
      note_text: ""
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 12
      width: 12
      height: 7
    - title: Top Purchasers of Brand
      name: Top Purchasers of Brand
      model: thelook
      explore: order_items
      type: looker_grid
      fields:
        [
          users.name,
          users.email,
          order_items.count,
          order_items.total_sale_price,
          users.state,
        ]
      sorts: [order_items.count desc]
      limit: 15
      column_limit: 50
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 42
      col: 0
      width: 12
      height: 8
    - title: Website Sessions by Hour of Day and User Lifetime Order Tier
      name: Website Sessions by Hour of Day and User Lifetime Order Tier
      model: thelook
      explore: events
      type: looker_column
      fields:
        [
          user_order_facts.lifetime_orders_tier,
          sessions.count,
          events.event_hour_of_day,
        ]
      pivots: [user_order_facts.lifetime_orders_tier]
      fill_fields: [events.event_hour_of_day]
      sorts: [user_order_facts.lifetime_orders_tier 0, events.event_hour_of_day]
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
      trellis: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      hidden_series: [Undefined]
      colors:
        [
          "#2DA5DE",
          "#57BEBE",
          "#EA8A2F",
          "#F2B431",
          "#64518A",
          "#8D7FB9",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      series_colors: {}
      series_labels:
        "1": 1 Lifetime Purchase
        1 - 2 - sessions.count: "1"
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      note_state: collapsed
      note_display: hover
      note_text: These are order totals by hour of day
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 34
      col: 0
      width: 14
      height: 5
    - title: Most Correlated Items
      name: Most Correlated Items
      model: thelook
      explore: affinity
      type: looker_grid
      fields:
        [
          product_a.item_name,
          product_b.item_name,
          affinity.avg_order_affinity,
          affinity.avg_user_affinity,
        ]
      filters:
        affinity.product_b_id: "-NULL"
        affinity.avg_order_affinity: NOT NULL
        product_b.brand: '"Levi''s"'
      sorts: [affinity.avg_order_affinity desc]
      limit: 15
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
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
        options:
          steps: 5
          reverse: false
      series_cell_visualizations:
        affinity.avg_order_affinity:
          is_active: true
          palette:
            palette_id: 14bc3e56-1edb-5cb6-143e-bc3c0d49dc0f
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
        affinity.avg_user_affinity:
          is_active: true
          palette:
            palette_id: 8182e447-1db4-af27-fe8f-0cc57a1b4132
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
      stacking: ""
      trellis: ""
      colors:
        [
          "#57BEBE",
          "#EA8A2F",
          "#F2B431",
          "#64518A",
          "#8D7FB9",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      point_style: circle_outline
      hidden_series: [product_a.count, product_b.count]
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
      ordering: none
      show_null_labels: false
      color_palette: Custom
      hidden_fields: []
      defaults_version: 1
      y_axes: []
      listen:
        Brand Name: product_a.brand
      row: 18
      col: 0
      width: 14
      height: 8
    - title: Purchasers of This Brand Also Bought (Brand Affinity)
      name: Purchasers of This Brand Also Bought (Brand Affinity)
      model: thelook
      explore: affinity
      type: looker_grid
      fields:
        [
          product_a.brand,
          product_b.brand,
          affinity.avg_order_affinity,
          affinity.avg_user_affinity,
          affinity.combined_affinity,
        ]
      filters:
        affinity.product_b_id: "-NULL"
        affinity.avg_order_affinity: NOT NULL
      sorts: [affinity.combined_affinity desc]
      limit: 15
      column_limit: 50
      show_view_names: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      series_labels:
        product_b.brand: Brand Name
      series_cell_visualizations:
        affinity.avg_order_affinity:
          is_active: true
          palette:
            palette_id: 17151457-0425-49e1-f2ab-69c3b7658883
            collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
        affinity.avg_user_affinity:
          is_active: true
          palette:
            palette_id: 2c7c9b87-e295-002c-4f6f-d50381deac58
            collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting_ignored_fields: []
      stacking: ""
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
      hidden_fields: [affinity.combined_affinity, product_a.brand]
      truncate_column_names: false
      y_axes: []
      listen:
        Brand Name: product_a.brand
      row: 18
      col: 14
      width: 10
      height: 8
    - title: Brand Share of Wallet over Customer Lifetime
      name: Brand Share of Wallet over Customer Lifetime
      model: thelook
      explore: orders_with_share_of_wallet_application
      type: looker_line
      fields:
        [
          order_items.months_since_signup,
          order_items_share_of_wallet.brand_share_of_wallet_within_company,
          order_items_share_of_wallet.total_sale_price_brand_v2,
        ]
      filters:
        order_items.months_since_signup: "<=18"
      sorts: [order_items.months_since_signup]
      limit: 500
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
      trellis: ""
      stacking: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: order_items_share_of_wallet.brand_share_of_wallet_within_company,
                  name: Brand Share of Wallet Within Company,
                  axisId: order_items_share_of_wallet.brand_share_of_wallet_within_company,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  id: order_items_share_of_wallet.total_sale_price_brand_v2,
                  name: Total
                    Sales - This Brand,
                  axisId: order_items_share_of_wallet.total_sale_price_brand_v2,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
      defaults_version: 1
      listen:
        Brand Name: order_items_share_of_wallet.brand
        Date: order_items.created_date
        State: users.state
      row: 9
      col: 12
      width: 12
      height: 6
    - title: Most Popular Categories
      name: Most Popular Categories
      model: thelook
      explore: order_items
      type: looker_column
      fields:
        [products.category, products.department, order_items.total_sale_price]
      pivots: [products.department]
      sorts: [products.department 0, order_items.total_sale_price desc 2]
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
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      y_axes: []
      listen: {}
      row: 5
      col: 0
      width: 12
      height: 10
    - name: "<span class='fa fa-dollar'> Brand Overview </span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Brand Overview </span>"
      subtitle_text: What are the high level revenue metrics for this brand?
      row: 0
      col: 0
      width: 24
      height: 2
    - name: "<span class='fa fa-heart'> Affinity Analysis </span>"
      type: text
      title_text: "<span class='fa fa-heart'> Affinity Analysis </span>"
      subtitle_text: What products and brands have the highest affinity?
      body_text:
        "**Recommended Action** Plan advertising campaign to recommend products\
        \ to users based on affinity"
      row: 15
      col: 0
      width: 24
      height: 3
    - name: "<span class='fa fa-laptop'> Web Analytics </span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Web Analytics </span>"
      subtitle_text: How are users interacting with our website?
      row: 26
      col: 0
      width: 24
      height: 2
    - name: "<span class='fa fa-users'> Top Customers </span>"
      type: text
      title_text: "<span class='fa fa-users'> Top Customers </span>"
      subtitle_text: Who are our highest valued customers?
      body_text:
        "**Recommended Action** Explore from here to see what products a user\
        \ has purchased and include them in a targeted advertising campaign"
      row: 39
      col: 0
      width: 24
      height: 3
  filters:
    - name: Brand Name
      title: Brand Name
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
    - name: Date
      title: Date
      type: date_filter
      default_value: 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
    - name: State
      title: State
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: users.state

---
- dashboard: brand_lookup
  title: Brand Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  query_timezone: user_timezone
  preferred_slug: z3hRDVMSAm3vAXMrKZlHYr
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: "#556d7a"
  elements:
    - title: Total Orders
      name: Total Orders
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.order_count]
      sorts: [order_items.order_count desc]
      limit: 500
      query_timezone: America/Los_Angeles
      font_size: medium
      text_color: black
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 8
      width: 4
      height: 3
    - title: Total Customers
      name: Total Customers
      model: thelook
      explore: order_items
      type: single_value
      fields: [users.count]
      sorts: [users.count desc]
      limit: 500
      query_timezone: America/Los_Angeles
      font_size: medium
      text_color: black
      note_state: expanded
      note_display: hover
      note_text: I've added a note
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 0
      width: 4
      height: 3
    - title: Average Order Value
      name: Average Order Value
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.average_sale_price]
      sorts: [order_items.average_sale_price desc]
      limit: 500
      column_limit: 50
      query_timezone: America/Los_Angeles
      font_size: medium
      text_color: black
      note_state: collapsed
      note_display: below
      note_text: ""
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 4
      width: 4
      height: 3
    - title: Brand Traffic by Source, OS
      name: Brand Traffic by Source, OS
      model: thelook
      explore: events
      type: looker_donut_multiples
      fields: [users.traffic_source, events.os, events.count]
      pivots: [users.traffic_source]
      filters:
        users.traffic_source: "-NULL"
      sorts: [events.count desc 1, users.traffic_source]
      limit: 20
      column_limit: 50
      query_timezone: America/Los_Angeles
      show_value_labels: true
      font_size: 12
      colors:
        [
          "#64518A",
          "#8D7FB9",
          "#EA8A2F",
          "#F2B431",
          "#2DA5DE",
          "#57BEBE",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      series_colors: {}
      show_view_names: true
      stacking: ""
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_labels: false
      defaults_version: 1
      note_state: collapsed
      note_display: above
      note_text: ""
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 28
      col: 14
      width: 10
      height: 11
    - title: Top Product Categories - Cart vs Conversion
      name: Top Product Categories - Cart vs Conversion
      model: thelook
      explore: events
      type: looker_column
      fields:
        [
          product_viewed.category,
          sessions.overall_conversion,
          sessions.cart_to_checkout_conversion,
          sessions.count_cart_or_later,
        ]
      filters:
        product_viewed.category: "-NULL"
      sorts: [sessions.count_cart_or_later desc]
      limit: 8
      column_limit: 50
      query_timezone: America/Los_Angeles
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
      trellis: ""
      stacking: ""
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
          reverse: false
      y_axes:
        [
          {
            label: Total Added to Cart,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: sessions.count_cart_or_later,
                  name: "(4) Add to Cart or later",
                },
              ],
          },
          {
            label: "",
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                { id: sessions.overall_conversion, name: Overall Conversion },
                {
                  id: sessions.cart_to_checkout_conversion,
                  name: Cart to Checkout Conversion,
                },
              ],
          },
        ]
      y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
      hide_legend: false
      colors: ["#64518A", "#8D7FB9"]
      series_types:
        sessions.cart_to_checkout_conversion: line
        sessions.overall_conversion: line
      series_colors: {}
      series_labels:
        sessions.cart_to_checkout_conversion: Cart to Checkout Conversion
        sessions.overall_conversion: Overall Conversion
        sessions.count_cart_or_later: "# of Add to Cart Events"
      y_axis_orientation: [right, left]
      x_axis_label_rotation: -45
      label_rotation: 0
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 28
      col: 0
      width: 14
      height: 6
    - title: Top Visitors and Transaction History
      name: Top Visitors and Transaction History
      model: thelook
      explore: events
      type: looker_grid
      fields:
        [
          users.name,
          users.email,
          users.state,
          users.traffic_source,
          sessions.count,
        ]
      filters:
        users.name: "-NULL"
      sorts: [sessions.count desc]
      limit: 15
      column_limit: 50
      query_timezone: America/Los_Angeles
      show_view_names: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      series_cell_visualizations:
        sessions.count:
          is_active: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting_ignored_fields: []
      truncate_column_names: false
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 42
      col: 12
      width: 12
      height: 8
    - title: Sales and Sale Price Trend
      name: Sales and Sale Price Trend
      model: thelook
      explore: order_items
      type: looker_line
      fields:
        [
          order_items.created_date,
          order_items.total_sale_price,
          order_items.average_sale_price,
        ]
      sorts: [order_items.total_sale_price desc]
      limit: 500
      query_timezone: America/Los_Angeles
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: false
      show_null_points: true
      interpolation: monotone
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      y_axis_labels: [Total Sale Amount, Average Selling Price]
      x_axis_label: Order Date
      hide_legend: true
      colors: ["#F2B431", "#57BEBE"]
      series_colors: {}
      y_axis_orientation: [left, right]
      x_axis_datetime: true
      hide_points: true
      color_palette: Custom
      defaults_version: 1
      note_state: collapsed
      note_display: hover
      note_text: ""
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 12
      width: 12
      height: 7
    - title: Top Purchasers of Brand
      name: Top Purchasers of Brand
      model: thelook
      explore: order_items
      type: looker_grid
      fields:
        [
          users.name,
          users.email,
          order_items.count,
          order_items.total_sale_price,
          users.state,
        ]
      sorts: [order_items.count desc]
      limit: 15
      column_limit: 50
      query_timezone: America/Los_Angeles
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 42
      col: 0
      width: 12
      height: 8
    - title: Website Sessions by Hour of Day and User Lifetime Order Tier
      name: Website Sessions by Hour of Day and User Lifetime Order Tier
      model: thelook
      explore: events
      type: looker_column
      fields:
        [
          user_order_facts.lifetime_orders_tier,
          sessions.count,
          events.event_hour_of_day,
        ]
      pivots: [user_order_facts.lifetime_orders_tier]
      fill_fields: [events.event_hour_of_day]
      sorts: [user_order_facts.lifetime_orders_tier 0, events.event_hour_of_day]
      limit: 500
      column_limit: 50
      query_timezone: America/Los_Angeles
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
      trellis: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      hidden_series: [Undefined]
      colors:
        [
          "#2DA5DE",
          "#57BEBE",
          "#EA8A2F",
          "#F2B431",
          "#64518A",
          "#8D7FB9",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      series_colors: {}
      series_labels:
        "1": 1 Lifetime Purchase
        1 - 2 - sessions.count: "1"
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      note_state: collapsed
      note_display: hover
      note_text: These are order totals by hour of day
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 34
      col: 0
      width: 14
      height: 5
    - title: Most Correlated Items
      name: Most Correlated Items
      model: thelook
      explore: affinity
      type: looker_grid
      fields:
        [
          product_a.item_name,
          product_b.item_name,
          affinity.avg_order_affinity,
          affinity.avg_user_affinity,
        ]
      filters:
        affinity.product_b_id: "-NULL"
        affinity.avg_order_affinity: NOT NULL
        product_b.brand: '"Levi''s"'
      sorts: [affinity.avg_order_affinity desc]
      limit: 15
      query_timezone: America/Los_Angeles
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
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
        options:
          steps: 5
          reverse: false
      series_cell_visualizations:
        affinity.avg_order_affinity:
          is_active: true
          palette:
            palette_id: 14bc3e56-1edb-5cb6-143e-bc3c0d49dc0f
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
        affinity.avg_user_affinity:
          is_active: true
          palette:
            palette_id: 8182e447-1db4-af27-fe8f-0cc57a1b4132
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
      stacking: ""
      trellis: ""
      colors:
        [
          "#57BEBE",
          "#EA8A2F",
          "#F2B431",
          "#64518A",
          "#8D7FB9",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      point_style: circle_outline
      hidden_series: [product_a.count, product_b.count]
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
      ordering: none
      show_null_labels: false
      color_palette: Custom
      hidden_fields: []
      defaults_version: 1
      y_axes: []
      listen:
        Brand Name: product_a.brand
      row: 18
      col: 0
      width: 14
      height: 8
    - title: Purchasers of This Brand Also Bought (Brand Affinity)
      name: Purchasers of This Brand Also Bought (Brand Affinity)
      model: thelook
      explore: affinity
      type: looker_grid
      fields:
        [
          product_a.brand,
          product_b.brand,
          affinity.avg_order_affinity,
          affinity.avg_user_affinity,
          affinity.combined_affinity,
        ]
      filters:
        affinity.product_b_id: "-NULL"
        affinity.avg_order_affinity: NOT NULL
      sorts: [affinity.combined_affinity desc]
      limit: 15
      column_limit: 50
      query_timezone: America/Los_Angeles
      show_view_names: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      series_labels:
        product_b.brand: Brand Name
      series_cell_visualizations:
        affinity.avg_order_affinity:
          is_active: true
          palette:
            palette_id: 17151457-0425-49e1-f2ab-69c3b7658883
            collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
        affinity.avg_user_affinity:
          is_active: true
          palette:
            palette_id: 2c7c9b87-e295-002c-4f6f-d50381deac58
            collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting_ignored_fields: []
      stacking: ""
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
      hidden_fields: [affinity.combined_affinity, product_a.brand]
      truncate_column_names: false
      y_axes: []
      listen:
        Brand Name: product_a.brand
      row: 18
      col: 14
      width: 10
      height: 8
    - title: Brand Share of Wallet over Customer Lifetime
      name: Brand Share of Wallet over Customer Lifetime
      model: thelook
      explore: orders_with_share_of_wallet_application
      type: looker_line
      fields:
        [
          order_items.months_since_signup,
          order_items_share_of_wallet.brand_share_of_wallet_within_company,
          order_items_share_of_wallet.total_sale_price_brand_v2,
        ]
      filters:
        order_items.months_since_signup: "<=18"
      sorts: [order_items.months_since_signup]
      limit: 500
      query_timezone: America/Los_Angeles
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
      trellis: ""
      stacking: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: order_items_share_of_wallet.brand_share_of_wallet_within_company,
                  name: Brand Share of Wallet Within Company,
                  axisId: order_items_share_of_wallet.brand_share_of_wallet_within_company,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  id: order_items_share_of_wallet.total_sale_price_brand_v2,
                  name: Total
                    Sales - This Brand,
                  axisId: order_items_share_of_wallet.total_sale_price_brand_v2,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
      defaults_version: 1
      listen:
        Brand Name: order_items_share_of_wallet.brand
        Date: order_items.created_date
        State: users.state
      row: 9
      col: 12
      width: 12
      height: 6
    - title: Most Popular Categories
      name: Most Popular Categories
      model: thelook
      explore: order_items
      type: looker_column
      fields:
        [products.category, products.department, order_items.total_sale_price]
      pivots: [products.department]
      sorts: [products.department 0, order_items.total_sale_price desc 2]
      limit: 500
      column_limit: 50
      row_total: right
      query_timezone: user_timezone
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      y_axes: []
      listen: {}
      row: 5
      col: 0
      width: 12
      height: 10
    - name: "<span class='fa fa-dollar'> Brand Overview </span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Brand Overview </span>"
      subtitle_text: What are the high level revenue metrics for this brand?
      row: 0
      col: 0
      width: 24
      height: 2
    - name: "<span class='fa fa-heart'> Affinity Analysis </span>"
      type: text
      title_text: "<span class='fa fa-heart'> Affinity Analysis </span>"
      subtitle_text: What products and brands have the highest affinity?
      body_text:
        "**Recommended Action** Plan advertising campaign to recommend products\
        \ to users based on affinity"
      row: 15
      col: 0
      width: 24
      height: 3
    - name: "<span class='fa fa-laptop'> Web Analytics </span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Web Analytics </span>"
      subtitle_text: How are users interacting with our website?
      row: 26
      col: 0
      width: 24
      height: 2
    - name: "<span class='fa fa-users'> Top Customers </span>"
      type: text
      title_text: "<span class='fa fa-users'> Top Customers </span>"
      subtitle_text: Who are our highest valued customers?
      body_text:
        "**Recommended Action** Explore from here to see what products a user\
        \ has purchased and include them in a targeted advertising campaign"
      row: 39
      col: 0
      width: 24
      height: 3
  filters:
    - name: Brand Name
      title: Brand Name
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
    - name: Date
      title: Date
      type: date_filter
      default_value: 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
    - name: State
      title: State
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: users.state

---
- dashboard: brand_lookup_3_deal_ids
  title: Brand Lookup 3 deal ids
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  query_timezone: user_timezone
  preferred_slug: rsYvkEe1ZnIGYvXmb23S75
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: "#556d7a"
  elements:
    - title: Total Orders
      name: Total Orders
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.order_count]
      sorts: [order_items.order_count desc]
      limit: 500
      font_size: medium
      text_color: black
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 8
      width: 4
      height: 3
    - title: Total Customers
      name: Total Customers
      model: thelook
      explore: order_items
      type: single_value
      fields: [users.count]
      sorts: [users.count desc]
      limit: 500
      font_size: medium
      text_color: black
      note_state: expanded
      note_display: hover
      note_text: I've added a note
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 0
      width: 4
      height: 3
    - title: Average Order Value
      name: Average Order Value
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.average_sale_price]
      sorts: [order_items.average_sale_price desc]
      limit: 500
      column_limit: 50
      font_size: medium
      text_color: black
      note_state: collapsed
      note_display: below
      note_text: ""
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 4
      width: 4
      height: 3
    - title: Brand Traffic by Source, OS
      name: Brand Traffic by Source, OS
      model: thelook
      explore: events
      type: looker_donut_multiples
      fields: [users.traffic_source, events.os, events.count]
      pivots: [users.traffic_source]
      filters:
        users.traffic_source: "-NULL"
      sorts: [events.count desc 1, users.traffic_source]
      limit: 20
      column_limit: 50
      show_value_labels: true
      font_size: 12
      colors:
        [
          "#64518A",
          "#8D7FB9",
          "#EA8A2F",
          "#F2B431",
          "#2DA5DE",
          "#57BEBE",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      series_colors: {}
      show_view_names: true
      stacking: ""
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      show_null_labels: false
      defaults_version: 1
      note_state: collapsed
      note_display: above
      note_text: ""
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 28
      col: 14
      width: 10
      height: 11
    - title: Top Product Categories - Cart vs Conversion
      name: Top Product Categories - Cart vs Conversion
      model: thelook
      explore: events
      type: looker_column
      fields:
        [
          product_viewed.category,
          sessions.overall_conversion,
          sessions.cart_to_checkout_conversion,
          sessions.count_cart_or_later,
        ]
      filters:
        product_viewed.category: "-NULL"
      sorts: [sessions.count_cart_or_later desc]
      limit: 8
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
      trellis: ""
      stacking: ""
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
          reverse: false
      y_axes:
        [
          {
            label: Total Added to Cart,
            maxValue: !!null "",
            minValue: !!null "",
            orientation: left,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                {
                  id: sessions.count_cart_or_later,
                  name: "(4) Add to Cart or later",
                },
              ],
          },
          {
            label: "",
            maxValue: !!null "",
            minValue: !!null "",
            orientation: right,
            showLabels: true,
            showValues: true,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
            unpinAxis: false,
            valueFormat: !!null "",
            series:
              [
                { id: sessions.overall_conversion, name: Overall Conversion },
                {
                  id: sessions.cart_to_checkout_conversion,
                  name: Cart to Checkout Conversion,
                },
              ],
          },
        ]
      y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
      hide_legend: false
      colors: ["#64518A", "#8D7FB9"]
      series_types:
        sessions.cart_to_checkout_conversion: line
        sessions.overall_conversion: line
      series_colors: {}
      series_labels:
        sessions.cart_to_checkout_conversion: Cart to Checkout Conversion
        sessions.overall_conversion: Overall Conversion
        sessions.count_cart_or_later: "# of Add to Cart Events"
      y_axis_orientation: [right, left]
      x_axis_label_rotation: -45
      label_rotation: 0
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 28
      col: 0
      width: 14
      height: 6
    - title: Top Visitors and Transaction History
      name: Top Visitors and Transaction History
      model: thelook
      explore: events
      type: looker_grid
      fields:
        [
          users.name,
          users.email,
          users.state,
          users.traffic_source,
          sessions.count,
        ]
      filters:
        users.name: "-NULL"
      sorts: [sessions.count desc]
      limit: 15
      column_limit: 50
      show_view_names: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      series_cell_visualizations:
        sessions.count:
          is_active: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting_ignored_fields: []
      truncate_column_names: false
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 42
      col: 12
      width: 12
      height: 8
    - title: Sales and Sale Price Trend
      name: Sales and Sale Price Trend
      model: thelook
      explore: order_items
      type: looker_line
      fields:
        [
          order_items.created_date,
          order_items.total_sale_price,
          order_items.average_sale_price,
        ]
      sorts: [order_items.total_sale_price desc]
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
      trellis: ""
      stacking: ""
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: false
      show_null_points: true
      interpolation: monotone
      color_application:
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      y_axis_labels: [Total Sale Amount, Average Selling Price]
      x_axis_label: Order Date
      hide_legend: true
      colors: ["#F2B431", "#57BEBE"]
      series_colors: {}
      y_axis_orientation: [left, right]
      x_axis_datetime: true
      hide_points: true
      color_palette: Custom
      defaults_version: 1
      note_state: collapsed
      note_display: hover
      note_text: ""
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 2
      col: 12
      width: 12
      height: 7
    - title: Top Purchasers of Brand
      name: Top Purchasers of Brand
      model: thelook
      explore: order_items
      type: looker_grid
      fields:
        [
          users.name,
          users.email,
          order_items.count,
          order_items.total_sale_price,
          users.state,
        ]
      sorts: [order_items.count desc]
      limit: 15
      column_limit: 50
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      y_axes: []
      listen:
        Brand Name: products.brand
        Date: order_items.created_date
        State: users.state
      row: 42
      col: 0
      width: 12
      height: 8
    - title: Website Sessions by Hour of Day and User Lifetime Order Tier
      name: Website Sessions by Hour of Day and User Lifetime Order Tier
      model: thelook
      explore: events
      type: looker_column
      fields:
        [
          user_order_facts.lifetime_orders_tier,
          sessions.count,
          events.event_hour_of_day,
        ]
      pivots: [user_order_facts.lifetime_orders_tier]
      fill_fields: [events.event_hour_of_day]
      sorts: [user_order_facts.lifetime_orders_tier 0, events.event_hour_of_day]
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
      trellis: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      hidden_series: [Undefined]
      colors:
        [
          "#2DA5DE",
          "#57BEBE",
          "#EA8A2F",
          "#F2B431",
          "#64518A",
          "#8D7FB9",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      series_colors: {}
      series_labels:
        "1": 1 Lifetime Purchase
        1 - 2 - sessions.count: "1"
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      note_state: collapsed
      note_display: hover
      note_text: These are order totals by hour of day
      y_axes: []
      listen:
        Brand Name: product_viewed.brand
        Date: events.event_date
        State: users.state
      row: 34
      col: 0
      width: 14
      height: 5
    - title: Most Correlated Items
      name: Most Correlated Items
      model: thelook
      explore: affinity
      type: looker_grid
      fields:
        [
          product_a.item_name,
          product_b.item_name,
          affinity.avg_order_affinity,
          affinity.avg_user_affinity,
        ]
      filters:
        affinity.product_b_id: "-NULL"
        affinity.avg_order_affinity: NOT NULL
        product_b.brand: '"Levi''s"'
      sorts: [affinity.avg_order_affinity desc]
      limit: 15
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
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
        options:
          steps: 5
          reverse: false
      series_cell_visualizations:
        affinity.avg_order_affinity:
          is_active: true
          palette:
            palette_id: 14bc3e56-1edb-5cb6-143e-bc3c0d49dc0f
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
        affinity.avg_user_affinity:
          is_active: true
          palette:
            palette_id: 8182e447-1db4-af27-fe8f-0cc57a1b4132
            collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
      stacking: ""
      trellis: ""
      colors:
        [
          "#57BEBE",
          "#EA8A2F",
          "#F2B431",
          "#64518A",
          "#8D7FB9",
          "#7F7977",
          "#B2A898",
          "#494C52",
        ]
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      point_style: circle_outline
      hidden_series: [product_a.count, product_b.count]
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
      ordering: none
      show_null_labels: false
      color_palette: Custom
      hidden_fields: []
      defaults_version: 1
      y_axes: []
      listen:
        Brand Name: product_a.brand
      row: 18
      col: 0
      width: 14
      height: 8
    - title: Purchasers of This Brand Also Bought (Brand Affinity)
      name: Purchasers of This Brand Also Bought (Brand Affinity)
      model: thelook
      explore: affinity
      type: looker_grid
      fields:
        [
          product_a.brand,
          product_b.brand,
          affinity.avg_order_affinity,
          affinity.avg_user_affinity,
          affinity.combined_affinity,
        ]
      filters:
        affinity.product_b_id: "-NULL"
        affinity.avg_order_affinity: NOT NULL
      sorts: [affinity.combined_affinity desc]
      limit: 15
      column_limit: 50
      show_view_names: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      series_labels:
        product_b.brand: Brand Name
      series_cell_visualizations:
        affinity.avg_order_affinity:
          is_active: true
          palette:
            palette_id: 17151457-0425-49e1-f2ab-69c3b7658883
            collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
        affinity.avg_user_affinity:
          is_active: true
          palette:
            palette_id: 2c7c9b87-e295-002c-4f6f-d50381deac58
            collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
            custom_colors:
              - "#f20265"
              - "#FFD95F"
              - "#72D16D"
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting_ignored_fields: []
      stacking: ""
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
      hidden_fields: [affinity.combined_affinity, product_a.brand]
      truncate_column_names: false
      y_axes: []
      listen:
        Brand Name: product_a.brand
      row: 18
      col: 14
      width: 10
      height: 8
    - title: Brand Share of Wallet over Customer Lifetime
      name: Brand Share of Wallet over Customer Lifetime
      model: thelook
      explore: orders_with_share_of_wallet_application
      type: looker_line
      fields:
        [
          order_items.months_since_signup,
          order_items_share_of_wallet.brand_share_of_wallet_within_company,
          order_items_share_of_wallet.total_sale_price_brand_v2,
        ]
      filters:
        order_items.months_since_signup: "<=18"
      sorts: [order_items.months_since_signup]
      limit: 500
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
      trellis: ""
      stacking: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
          reverse: false
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  id: order_items_share_of_wallet.brand_share_of_wallet_within_company,
                  name: Brand Share of Wallet Within Company,
                  axisId: order_items_share_of_wallet.brand_share_of_wallet_within_company,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
          {
            label: !!null "",
            orientation: right,
            series:
              [
                {
                  id: order_items_share_of_wallet.total_sale_price_brand_v2,
                  name: Total
                    Sales - This Brand,
                  axisId: order_items_share_of_wallet.total_sale_price_brand_v2,
                },
              ],
            showLabels: true,
            showValues: true,
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 5,
            type: linear,
          },
        ]
      series_colors: {}
      defaults_version: 1
      listen:
        Brand Name: order_items_share_of_wallet.brand
        Date: order_items.created_date
        State: users.state
      row: 9
      col: 12
      width: 12
      height: 6
    - title: Most Popular Categories
      name: Most Popular Categories
      model: thelook
      explore: order_items
      type: looker_column
      fields:
        [products.category, products.department, order_items.total_sale_price]
      pivots: [products.department]
      sorts: [products.department 0, order_items.total_sale_price desc 2]
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
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ""
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
        collection_id: google
        palette_id: google-categorical-0
        options:
          steps: 5
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      y_axes: []
      listen: {}
      row: 5
      col: 0
      width: 12
      height: 10
    - name: "<span class='fa fa-dollar'> Brand Overview </span>"
      type: text
      title_text: "<span class='fa fa-dollar'> Brand Overview </span>"
      subtitle_text: What are the high level revenue metrics for this brand?
      row: 0
      col: 0
      width: 24
      height: 2
    - name: "<span class='fa fa-heart'> Affinity Analysis </span>"
      type: text
      title_text: "<span class='fa fa-heart'> Affinity Analysis </span>"
      subtitle_text: What products and brands have the highest affinity?
      body_text:
        "**Recommended Action** Plan advertising campaign to recommend products\
        \ to users based on affinity"
      row: 15
      col: 0
      width: 24
      height: 3
    - name: "<span class='fa fa-laptop'> Web Analytics </span>"
      type: text
      title_text: "<span class='fa fa-laptop'> Web Analytics </span>"
      subtitle_text: How are users interacting with our website?
      row: 26
      col: 0
      width: 24
      height: 2
    - name: "<span class='fa fa-users'> Top Customers </span>"
      type: text
      title_text: "<span class='fa fa-users'> Top Customers </span>"
      subtitle_text: Who are our highest valued customers?
      body_text:
        "**Recommended Action** Explore from here to see what products a user\
        \ has purchased and include them in a targeted advertising campaign"
      row: 39
      col: 0
      width: 24
      height: 3
  filters:
    - name: Brand Name
      title: Brand Name
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
    - name: Date
      title: Date
      type: date_filter
      default_value: 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
    - name: State
      title: State
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      listens_to_filters: []
      field: users.state

---
- dashboard: breachlock_test
  title: BreachLock test
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: K8raUKhiOV01ZGomUF5YJ6
  elements:
    - title: BreachLock test
      name: BreachLock test
      model: thelook
      explore: order_items
      type: looker_column
      fields:
        [
          order_items.created_date,
          order_items.total_gross_margin,
          order_items.status,
        ]
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
      trellis: ""
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
        collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
        palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
        options:
          steps: 5
      x_axis_zoom: true
      y_axis_zoom: true
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
      listen:
        Created Date: order_items.created_date
      row: 0
      col: 0
      width: 16
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
- dashboard: brealty_marketing_dashboard
  title: Brealty Marketing Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ""
  preferred_slug: vetWJcRPvXDDWqqe2tHCxz
  elements:
    - title: Top 10 spending customer
      name: Top 10 spending customer
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
      trellis: ""
      stacking: ""
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
      width: 14
      height: 9
    - title: Last 6 month top customers
      name: Last 6 month top customers
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
      col: 14
      width: 10
      height: 9

---
- dashboard: brick_and_mortar_decision_dashboard
  title: Brick and Mortar Decision Dashboard
  layout: newspaper
  description: ""
  preferred_slug: 23Du670veIXtIZMaxpIbM7
  elements:
    - title: Change - Income per Capita (2011-2017)
      name: Change - Income per Capita (2011-2017)
      model: retail_banking
      explore: acs_changes_2011_2017
      type: looker_map
      fields:
        [
          acs_changes_2011_2017.Zip_Code,
          acs_changes_2011_2017.Income_Per_Capita,
          acs_changes_2011_2017.rate_bachelors_degree_or_higher_25_64,
        ]
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
      map_scale_indicator: "off"
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
      map_latitude: 40.67031230812051
      map_longitude: -111.75599813461305
      map_zoom: 9
      map_value_colors: ["#EA4335", "#FBBC04", "#34A853"]
      map_value_scale_clamp_min: -1
      map_value_scale_clamp_max: 10000
      defaults_version: 1
      listen:
        Zip Code: acs_changes_2011_2017.Zip_Code
      row: 8
      col: 0
      width: 12
      height: 6
    - title: Share of Population (25-64) with Bachelor's degree
      name: Share of Population (25-64) with Bachelor's degree
      model: retail_banking
      explore: acs_2017_zipcodes
      type: looker_column
      fields:
        [
          acs_2017_zipcodes.Zip_Code,
          acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
        ]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "% of Adults (25-64)",
            orientation: left,
            series:
              [
                {
                  axisId: acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
                  id: acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
                  name: Rate
                    Bachelors Degree or Higher 25 64,
                },
              ],
            showLabels: true,
            showValues: true,
            maxValue: !!null "",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 47,
            type: linear,
          },
        ]
      reference_lines:
        [
          {
            reference_type: line,
            range_start: max,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#7d7d7d",
            line_value: "33.3",
            label: Utah Avg,
          },
        ]
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: fit_data
      map_scale_indicator: "off"
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
      row: 14
      col: 0
      width: 12
      height: 6
    - title: Banks per 10,000 Residents
      name: Banks per 10,000 Residents
      model: retail_banking
      explore: acs_2017_zipcodes_and_banks
      type: looker_map
      fields:
        [
          acs_2017_zipcodes_and_banks.Zip_Code,
          acs_2017_zipcodes_and_banks.Banks_per_10000_Residents,
        ]
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
      map_scale_indicator: "off"
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
      map_latitude: 40.89354823043405
      map_longitude: -111.97276353836061
      map_zoom: 8
      map_value_colors: ["#0D652D", "#34A853", "#E6F4EA"]
      map_value_scale_clamp_min: 1
      defaults_version: 1
      listen: {}
      row: 0
      col: 12
      width: 12
      height: 8
    - title: Household Income Distribution
      name: Household Income Distribution
      model: retail_banking
      explore: acs_2017_zipcodes
      type: looker_column
      fields:
        [
          acs_2017_zipcodes.percent_income_15000_19999,
          acs_2017_zipcodes.percent_income_20000_24999,
          acs_2017_zipcodes.percent_income_25000_29999,
          acs_2017_zipcodes.percent_income_30000_34999,
          acs_2017_zipcodes.percent_income_35000_39999,
          acs_2017_zipcodes.percent_income_40000_44999,
          acs_2017_zipcodes.percent_income_45000_49999,
          acs_2017_zipcodes.percent_income_50000_59999,
          acs_2017_zipcodes.percent_income_60000_74999,
          acs_2017_zipcodes.percent_income_75000_99999,
          acs_2017_zipcodes.percent_income_100000_124999,
          acs_2017_zipcodes.percent_income_125000_149999,
          acs_2017_zipcodes.percent_income_150000_199999,
          acs_2017_zipcodes.percent_income_200000_or_More,
        ]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: acs_2017_zipcodes.percent_income_15000_19999,
                  id: acs_2017_zipcodes.percent_income_15000_19999,
                  name: "15,000 - 19,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_20000_24999,
                  id: acs_2017_zipcodes.percent_income_20000_24999,
                  name: "20,000 - 24,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_25000_29999,
                  id: acs_2017_zipcodes.percent_income_25000_29999,
                  name: "25,000 - 29,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_30000_34999,
                  id: acs_2017_zipcodes.percent_income_30000_34999,
                  name: "30,000 - 34,99",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_35000_39999,
                  id: acs_2017_zipcodes.percent_income_35000_39999,
                  name: "35,000 - 39,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_40000_44999,
                  id: acs_2017_zipcodes.percent_income_40000_44999,
                  name: "40,000 - 44,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_45000_49999,
                  id: acs_2017_zipcodes.percent_income_45000_49999,
                  name: "45,000 - 49,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_50000_59999,
                  id: acs_2017_zipcodes.percent_income_50000_59999,
                  name: "50,000 - 59,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_60000_74999,
                  id: acs_2017_zipcodes.percent_income_60000_74999,
                  name: "60,000 - 74,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_75000_99999,
                  id: acs_2017_zipcodes.percent_income_75000_99999,
                  name: "75,000 - 99,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_100000_124999,
                  id: acs_2017_zipcodes.percent_income_100000_124999,
                  name: "100,000 - 124,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_125000_149999,
                  id: acs_2017_zipcodes.percent_income_125000_149999,
                  name: "125,000 - 149,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_150000_199999,
                  id: acs_2017_zipcodes.percent_income_150000_199999,
                  name: "150,000 - 199,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_200000_or_More,
                  id: acs_2017_zipcodes.percent_income_200000_or_More,
                  name: "200,000 or greater",
                },
              ],
            showLabels: true,
            showValues: true,
            maxValue: !!null "",
            minValue: 0,
            valueFormat: "#\\%",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 18,
            type: linear,
          },
        ]
      x_axis_label: "Range: $15,000 to $200,000+"
      hide_legend: true
      font_size: ""
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
      leftAxisLabel: ""
      rightAxisLabelVisible: false
      rightAxisLabel: ""
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
      row: 20
      col: 0
      width: 24
      height: 6
    - title: Owner-Occupied Home Value Distributions
      name: Owner-Occupied Home Value Distributions
      model: retail_banking
      explore: acs_2017_zipcodes_and_banks
      type: looker_boxplot
      fields:
        [
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile,
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_median_value,
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_upper_value_quartile,
          acs_2017_zipcodes_and_banks.Zip_Code,
        ]
      sorts: [
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile
          desc,
        ]
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
      trellis: ""
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
      map_scale_indicator: "off"
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
      row: 14
      col: 12
      width: 12
      height: 6
    - title: Change - Vacant Housing Units for Sales (2011-2017)
      name: Change - Vacant Housing Units for Sales (2011-2017)
      model: retail_banking
      explore: acs_changes_2011_2017
      type: looker_map
      fields:
        [
          acs_changes_2011_2017.Zip_Code,
          acs_changes_2011_2017.vacant_housing_units_for_sale,
          acs_changes_2011_2017.owner_occupied_housing_units_median_value,
        ]
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
      map_scale_indicator: "off"
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
      map_latitude: 40.67100399398882
      map_longitude: -111.87074303627016
      map_zoom: 9
      map_value_colors: ["#EA4335", "#FBBC04", "#34A853"]
      map_value_scale_clamp_min: -300
      map_value_scale_clamp_max: 300
      defaults_version: 1
      listen:
        Zip Code: acs_changes_2011_2017.Zip_Code
      row: 8
      col: 12
      width: 12
      height: 6
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
      map_scale_indicator: "off"
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
      map_latitude: 40.90130114538435
      map_longitude: -111.69531583786012
      map_zoom: 8
      map_value_colors: ["#0D652D", "#34A853", "#E6F4EA"]
      map_value_scale_clamp_min: 1000
      defaults_version: 1
      listen: {}
      row: 0
      col: 0
      width: 12
      height: 8
  filters:
    - name: Zip Code
      title: Zip Code
      type: field_filter
      default_value: ""
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
- dashboard: brick_and_mortar_decision_dashboard_imported
  title: Brick and Mortar Decision Dashboard (imported)
  layout: newspaper
  description: ""
  preferred_slug: RF7W9OgkG5sasKDIqbRW3P
  elements:
    - title: Change - Income per Capita (2011-2017)
      name: Change - Income per Capita (2011-2017)
      model: retail_banking
      explore: acs_changes_2011_2017
      type: looker_map
      fields:
        [
          acs_changes_2011_2017.Zip_Code,
          acs_changes_2011_2017.Income_Per_Capita,
          acs_changes_2011_2017.rate_bachelors_degree_or_higher_25_64,
        ]
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
      map_scale_indicator: "off"
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
      fields:
        [
          acs_2017_zipcodes.Zip_Code,
          acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
        ]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "% of Adults (25-64)",
            orientation: left,
            series:
              [
                {
                  axisId: acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
                  id: acs_2017_zipcodes.rate_bachelors_degree_or_higher_25_64,
                  name: Rate
                    Bachelors Degree or Higher 25 64,
                },
              ],
            showLabels: true,
            showValues: true,
            maxValue: !!null "",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 47,
            type: linear,
          },
        ]
      reference_lines:
        [
          {
            reference_type: line,
            range_start: max,
            range_end: min,
            margin_top: deviation,
            margin_value: mean,
            margin_bottom: deviation,
            label_position: right,
            color: "#7d7d7d",
            line_value: "33.3",
            label: Utah Avg,
          },
        ]
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: fit_data
      map_scale_indicator: "off"
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
    - title: Banks per 10,000 Residents
      name: Banks per 10,000 Residents
      model: retail_banking
      explore: acs_2017_zipcodes_and_banks
      type: looker_map
      fields:
        [
          acs_2017_zipcodes_and_banks.Zip_Code,
          acs_2017_zipcodes_and_banks.Banks_per_10000_Residents,
        ]
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
      map_scale_indicator: "off"
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
      fields:
        [
          acs_2017_zipcodes.percent_income_15000_19999,
          acs_2017_zipcodes.percent_income_20000_24999,
          acs_2017_zipcodes.percent_income_25000_29999,
          acs_2017_zipcodes.percent_income_30000_34999,
          acs_2017_zipcodes.percent_income_35000_39999,
          acs_2017_zipcodes.percent_income_40000_44999,
          acs_2017_zipcodes.percent_income_45000_49999,
          acs_2017_zipcodes.percent_income_50000_59999,
          acs_2017_zipcodes.percent_income_60000_74999,
          acs_2017_zipcodes.percent_income_75000_99999,
          acs_2017_zipcodes.percent_income_100000_124999,
          acs_2017_zipcodes.percent_income_125000_149999,
          acs_2017_zipcodes.percent_income_150000_199999,
          acs_2017_zipcodes.percent_income_200000_or_More,
        ]
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
      trellis: ""
      stacking: ""
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
      y_axes:
        [
          {
            label: "",
            orientation: left,
            series:
              [
                {
                  axisId: acs_2017_zipcodes.percent_income_15000_19999,
                  id: acs_2017_zipcodes.percent_income_15000_19999,
                  name: "15,000 - 19,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_20000_24999,
                  id: acs_2017_zipcodes.percent_income_20000_24999,
                  name: "20,000 - 24,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_25000_29999,
                  id: acs_2017_zipcodes.percent_income_25000_29999,
                  name: "25,000 - 29,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_30000_34999,
                  id: acs_2017_zipcodes.percent_income_30000_34999,
                  name: "30,000 - 34,99",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_35000_39999,
                  id: acs_2017_zipcodes.percent_income_35000_39999,
                  name: "35,000 - 39,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_40000_44999,
                  id: acs_2017_zipcodes.percent_income_40000_44999,
                  name: "40,000 - 44,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_45000_49999,
                  id: acs_2017_zipcodes.percent_income_45000_49999,
                  name: "45,000 - 49,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_50000_59999,
                  id: acs_2017_zipcodes.percent_income_50000_59999,
                  name: "50,000 - 59,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_60000_74999,
                  id: acs_2017_zipcodes.percent_income_60000_74999,
                  name: "60,000 - 74,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_75000_99999,
                  id: acs_2017_zipcodes.percent_income_75000_99999,
                  name: "75,000 - 99,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_100000_124999,
                  id: acs_2017_zipcodes.percent_income_100000_124999,
                  name: "100,000 - 124,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_125000_149999,
                  id: acs_2017_zipcodes.percent_income_125000_149999,
                  name: "125,000 - 149,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_150000_199999,
                  id: acs_2017_zipcodes.percent_income_150000_199999,
                  name: "150,000 - 199,999",
                },
                {
                  axisId: acs_2017_zipcodes.percent_income_200000_or_More,
                  id: acs_2017_zipcodes.percent_income_200000_or_More,
                  name: "200,000 or greater",
                },
              ],
            showLabels: true,
            showValues: true,
            maxValue: !!null "",
            minValue: 0,
            valueFormat: "#\\%",
            unpinAxis: false,
            tickDensity: default,
            tickDensityCustom: 18,
            type: linear,
          },
        ]
      x_axis_label: "Range: $15,000 to $200,000+"
      hide_legend: true
      font_size: ""
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
      leftAxisLabel: ""
      rightAxisLabelVisible: false
      rightAxisLabel: ""
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
      fields:
        [
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile,
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_median_value,
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_upper_value_quartile,
          acs_2017_zipcodes_and_banks.Zip_Code,
        ]
      sorts: [
          acs_2017_zipcodes_and_banks.owner_occupied_housing_units_lower_value_quartile
          desc,
        ]
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
      trellis: ""
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
      map_scale_indicator: "off"
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
      fields:
        [
          acs_changes_2011_2017.Zip_Code,
          acs_changes_2011_2017.vacant_housing_units_for_sale,
          acs_changes_2011_2017.owner_occupied_housing_units_median_value,
        ]
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
      map_scale_indicator: "off"
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
      map_scale_indicator: "off"
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
      default_value: ""
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
- dashboard: business_glossary_ux
  title: Business Glossary UX
  layout: newspaper
  description: ""
  preferred_slug: BzYip4Bm5I44N8uSly8QWY
  elements:
    - type: button
      name: button_3664
      rich_content_json: '{"text":"Data Dictionary","description":"Our Business Glossary","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://demowest.cloud.looker.com/extensions/marketplace_extension_data_dictionary::data-dictionary/"}'
      row: 0
      col: 20
      width: 4
      height: 2
    - title: INFORMATION SCHEMA from BQ
      name: INFORMATION SCHEMA from BQ
      model: thelook
      explore: columns
      type: looker_grid
      fields: [columns.column_name, column_field_paths.description]
      sorts: [columns.column_name]
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
      listen: {}
      row: 3
      col: 14
      width: 10
      height: 6
    - name: External
      type: text
      title_text: External
      subtitle_text: ""
      body_text: <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Microsoft_Office_Excel_%282019%E2%80%93present%29.svg/2203px-Microsoft_Office_Excel_%282019%E2%80%93present%29.svg.png">
      row: 0
      col: 9
      width: 2
      height: 3
    - name: Revenue
      type: text
      title_text: Revenue
      subtitle_text: ""
      body_text:
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtE1_XJ2MJE6usDfIN6JFa6vBwOiyoQbUJow&s"
        href="https://demowest.cloud.looker.com/dashboards/thelook::ecommerce_discount_portal?Days+in+Inventory=80+to+159">
      row: 0
      col: 7
      width: 2
      height: 3
    - title: Key Dashboards
      name: Key Dashboards
      model: system__activity
      explore: dashboard
      type: looker_grid
      fields:
        [
          dashboard.title,
          dashboard.link,
          dashboard.description,
          dashboard.updated_date,
          user.name,
        ]
      filters:
        dashboard.moved_to_trash: "No"
        dashboard.description: "-EMPTY"
      sorts: [dashboard.updated_date desc]
      limit: 500
      column_limit: 50
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: false
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: "12"
      rows_font_size: "12"
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      truncate_header: false
      minimum_column_width: 75
      series_column_widths:
        dashboard.title: 210
        dashboard.link: 112
        dashboard.description: 246
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
      trellis: ""
      stacking: ""
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
      row: 3
      col: 0
      width: 14
      height: 6
    - name: ""
      type: text
      title_text: ""
      subtitle_text: ""
      body_text: '[{"type":"h1","children":[{"text":"Field Level Glossary"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"vabtj"}]'
      rich_content_json: '{"format":"slate"}'
      row: 0
      col: 14
      width: 6
      height: 3
    - name: " (2)"
      type: text
      title_text: ""
      subtitle_text: ""
      body_text: '[{"type":"h1","children":[{"text":"Dashboard Overview"}],"align":"center"}]'
      rich_content_json: '{"format":"slate"}'
      row: 0
      col: 0
      width: 7
      height: 3
