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
}

explore: sales {}