# everything okay
explore: test1 {
  view_name: test
  sql_always_where: ${test.foo} ;;
}

# everything okay
explore: test2 {
  from: test
  sql_always_where: ${test2.foo} ;;
}

# Could not find a field named "test3.foo"
explore: test3 {
  view_name: test
  from: test
  sql_always_where: ${test3.foo} ;;
}

# the field references should succeed
explore: test4 {
  view_name: test
  from: test
  sql_always_where: ${test.foo} ;;
}

# Could not find a field named "test5.foo"
explore: test5 {
  view_name: test
  from: test
  sql_always_where: ${test5.foo} ;;
}

# everything okay
explore: test6 {
  view_name: test6
  from: test
  sql_always_where: ${test6.foo} ;;
}

# Explore name must match a view name, or the explore must provide a 'from:' or 'view_name:' property
explore: test7 {}

view: test {
  dimension: foo {}
}