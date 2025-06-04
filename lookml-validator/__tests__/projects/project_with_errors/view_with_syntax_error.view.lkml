view: view_with_syntax_error {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;; # Missing closing brace for view
