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

view: sales {
  extends: [order_items]
}

explore: sales {
  sql_always_where: ${sales.created_date} IS NOT NULL ;;
}

