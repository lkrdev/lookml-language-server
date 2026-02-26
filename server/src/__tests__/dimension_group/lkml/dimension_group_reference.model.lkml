view: order_items {
  dimension: id { type: number sql: ${TABLE}.id ;; }
  measure: count { type: count }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
    timeframes: [date, time, raw]
  }

  dimension_group: duration_test {
    type: duration
    sql_start: ${TABLE}.start_at ;;
    sql_end: ${TABLE}.end_at ;;
    intervals: [day, week]
  }

  dimension: no_view_reference {
    type: string
    sql: ${created_date} ;;
  }
  dimension: view_reference {
    type: string
    sql: ${order_items.created_date} ;;
  }
}

explore: order_items {}

view: sales {
  dimension: id { type: number sql: ${TABLE}.id ;; }
  measure: count { type: count }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: duration_test {
    type: duration
    sql_start: ${TABLE}.start_at ;;
    sql_end: ${TABLE}.end_at ;;
  }

  dimension: no_view_reference {
    type: string
    sql: ${created} ;;  
  }
  dimension: view_reference {
    type: string
    sql: ${order_items.created} ;;  
  }
}

explore: sales {
  # This should be invalid
  sql_always_where: ${sales.created_date} IS NOT NULL ;;

  # This should be INVALID (referencing group name)
  join: order_items {
    sql_on: ${sales.created} = ${order_items.created_date} ;;
  }
}