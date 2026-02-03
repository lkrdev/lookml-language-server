include: "order_items.view.lkml"
include: "order_items.refinement.lkml"
include: "nested/order_items.refinement.lkml"
explore: order_items {}
explore: order_items2 {
    from: order_items
    view_name: order_items
    sql_always_where: ${order_items.i_am_refined} ;;
}

# missing order_items.not_included
explore: order_items3 {
    from: order_items
    view_name: order_items
    sql_always_where: ${order_items.not_included} ;;
}

explore: order_items4 {
    from: order_items
    view_name: order_items
    sql_always_where: ${order_items.included_in_nested_refinement} ;;
}