connection: "test"

include: "*.view.lkml"

view: dollar_in_string {
  sql_table_name: `my_table` ;;

  dimension: raw_name {
    type: string
    sql: ${TABLE}.raw_name ;;
  }

  dimension: cleaned_name {
    type: string
    sql: REGEXP_REPLACE(${raw_name}, r' - [^-]+$', '') ;;
  }

  dimension: extracted_suffix {
    type: string
    sql: INITCAP(REGEXP_EXTRACT(${raw_name}, r' - ([^-]+)$')) ;;
  }

  dimension: with_dollar_literal {
    type: string
    sql: CONCAT(${raw_name}, ' costs $100') ;;
  }
}

view: truly_malformed {
  sql_table_name: `my_table` ;;

  dimension: bad_ref {
    type: string
    sql: $foo ;;
  }
}
