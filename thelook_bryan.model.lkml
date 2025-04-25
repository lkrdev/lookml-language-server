connection: "bg-pdt-override-test"

explore: inventory_items {
  view_name: inventory_items
  
  join: products {
    type: left_outer
    sql_on: ${inventory_items.inventory_item_id} = ${products.id} ;;
    relationship: many_to_one
  }
  
  join: order_items {
    type: left_outer
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    relationship: one_to_many
  }
} 