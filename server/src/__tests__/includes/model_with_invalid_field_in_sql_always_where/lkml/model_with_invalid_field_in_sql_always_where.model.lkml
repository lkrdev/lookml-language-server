include: "order_items.view.lkml"

explore: order_items {
    sql_always_where: ${order_items.does_not_exist} ;;
}