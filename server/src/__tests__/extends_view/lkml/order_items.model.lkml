view: order_items {
    dimension: id {
        primary_key: yes
        type: number
    }
}

view: order_items2 {
    extends: [order_items]
    dimension: id2 {
        type: number
    }
}

view: order_items_extended {
    extends: [order_items]
}

view: order_items_double_extended {
  extends: [order_items, order_items2]
}

explore: order_items_extended {
  sql_always_where: ${order_items_extended.id} IS NOT NULL ;;
}

explore: order_items2 {
  sql_always_where: ${order_items2.id} IS NOT NULL AND ${order_items2.id2} IS NOT NULL ;;
}

explore: order_items_double_extended {
  sql_always_where: ${order_items_double_extended.id} IS NOT NULL AND ${order_items_double_extended.id2} IS NOT NULL ;;
}
