explore: test_from_pass {
  view_name: test
  sql_always_where: ${test.foo} ;;
}

explore: test_view_name_pass {
  from: test
  sql_always_where: ${test_view_name_pass.foo} ;;
}

explore: test_from_fail {
  view_name: test
  sql_always_where: ${test_from_fail.foo} ;;
}

explore: test_view_name_fail {
  from: test
  sql_always_where: ${test_view_name_fail.foo} ;;
}

view: test {
  dimension: foo {}
}