connection: "test"

# View with two primary keys in the same view — should error
view: two_pks {
  dimension: pk1 {
    primary_key: yes
    sql: ${TABLE}.id1 ;;
  }
  dimension: pk2 {
    primary_key: yes
    sql: ${TABLE}.id2 ;;
  }
  dimension: normal_dim {
    sql: ${TABLE}.name ;;
  }
}

# View with exactly one primary key — should be fine
view: single_pk {
  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: name {
    sql: ${TABLE}.name ;;
  }
}

# View with no primary keys — should be fine
view: no_pk {
  dimension: name {
    sql: ${TABLE}.name ;;
  }
}

# Base view with one PK, extended view adds another PK — should error on the child
view: base_with_pk {
  extension: required
  dimension: base_id {
    primary_key: yes
    sql: ${TABLE}.base_id ;;
  }
  dimension: base_name {
    sql: ${TABLE}.name ;;
  }
}

view: child_adds_pk {
  extends: [base_with_pk]
  dimension: child_id {
    primary_key: yes
    sql: ${TABLE}.child_id ;;
  }
}

explore: two_pks {}
explore: single_pk {}
explore: no_pk {}
explore: child_adds_pk {}
