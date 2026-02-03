view: users {
  sql_table_name: `looker-private-demo.ecomm.users` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
}

view: order_items {
  sql_table_name: `looker-private-demo.ecomm.order_items` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
}
