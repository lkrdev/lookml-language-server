connection: "my_connection"

view: _global_sales_aggregated_raw {
  sql_table_name: my_schema.global_sales ;;

  dimension_group: day {
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.day ;;
  }

  dimension: ecosystem {
    type: string
    sql: ${TABLE}.ecosystem ;;
  }

  dimension: country_id {
    type: string
    sql: ${TABLE}.country_id ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
}

view: global_sales_aggregated {
  extends: [_global_sales_aggregated_raw]

  drill_fields: [day_date, ecosystem, customer]

  dimension: combined {
    type: string
    sql: ${day_date} || ' ' || ${ecosystem} ;;
  }
}

view: global_sales_aggregated_drill_error {
  extends: [_global_sales_aggregated_raw]

  drill_fields: [day_date2, ecosystem, customer]

  dimension: combined {
    type: string
    sql: ${day_date} || ' ' || ${ecosystem} ;;
  }
}

view: global_sales_aggregated_day_reference_error {
  extends: [_global_sales_aggregated_raw]

  drill_fields: [day_date, ecosystem, customer]

  dimension: combined {
    type: string
    sql: ${day_date3} || ' ' || ${ecosystem} ;;
  }
}

explore: global_sales_aggregated {}
explore: global_sales_aggregated_drill_error {}
explore: global_sales_aggregated_day_reference_error {}
