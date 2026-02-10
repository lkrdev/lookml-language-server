include: "order_items.view.lkml"
explore: order_items {}
explore: order_items2 {
    from: order_items
    view_name: order_items
    sql_always_where: ${order_items.does_not_exist} ;;
}