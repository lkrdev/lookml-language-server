connection: "test"

view: view1 {
  dimension: foo {
    sql: ${view2.bar} ;;
  }
}

view: view2 {
  dimension: bar {
    sql: ${view1.foo} ;;
  }
}

explore: view1 {
  join: view2 {
    sql_on: 1=2 ;;
  }
}

view: sql_view1 {
  derived_table: {
    sql: SELECT 1 AS foo FROM ${sql_view2.SQL_TABLE_NAME} ;;
  }
  dimension: foo {}
}

view: sql_view2 {
  derived_table: {
    sql: SELECT 1 AS bar FROM ${sql_view1.SQL_TABLE_NAME} ;;
  }
  dimension: bar {}
}

explore: sql_view1 {
  join: sql_view2 {
    sql_on: 1=2 ;;
  }
}

view: dimension_self_reference {
  dimension: silly {
    sql: ${silly} ;;
  }
  dimension: silly2 {
    sql: ${dimension_self_reference.silly2} ;;
  }
}

explore: dimension_self_reference {}

view: dimension_sql_table_name_circular_no_error1 {
  dimension: foo {
    sql: (SELECT 1 FROM ${dimension_sql_table_name_circular_no_error2.SQL_TABLE_NAME}) ;;
  }
}

view: dimension_sql_table_name_circular_no_error2 {
  dimension: foo {
    sql: (SELECT 1 FROM ${dimension_sql_table_name_circular_no_error1.SQL_TABLE_NAME}) ;;
  }
}


explore: dimension_sql_table_name_circular_no_error1 {} 