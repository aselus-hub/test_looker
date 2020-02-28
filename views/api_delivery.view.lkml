view: api_delivery {
  sql_table_name: public.api_delivery ;;
  # paramterize via user_attribute
  drill_fields: [id, robot]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
#     required_access_grants: [can_see_sensitive_data]
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created" ;;
  }

  dimension: day_of_year {
    type: number
    sql: ${TABLE}."day_of_year" ;;
  }

  dimension: delivery_type {
    type: string
    sql: ${TABLE}."delivery_type" ;;
  }

  dimension: distance_traveled {
    type: number
    sql: ${TABLE}."distance_traveled" ;;
  }

  dimension: elapsed_time {
    type: number
    sql: ${TABLE}."elapsed_time" ;;
  }

  dimension: hour_of_day {
    type: number
    sql: ${TABLE}."hour_of_day" ;;
  }

  dimension_group: modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."modified" ;;
  }

  dimension: month_of_year {
    type: number
    sql: ${TABLE}."month_of_year" ;;
  }

  dimension: productive_time {
    type: number
    sql: ${TABLE}."productive_time" ;;
  }

  dimension: robot {
    type: string
    sql: ${TABLE}."robot" ;;
  }

  dimension: robot_base_type {
    type: string
    sql: ${TABLE}."robot_base_type" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: terminated_at {
    type: number
    sql: ${TABLE}."terminated_at" ;;
  }

  dimension: week_of_year {
    type: number
    sql: ${TABLE}."week_of_year" ;;
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: { label: "Break down by Day" value: "day" }
    allowed_value: { label: "Break down by Month" value: "month" }
  }

#   dimension: date {
#     label: "Selected Date"
#     type:  date_raw
#     sql:
#     {% if date_granularity._parameter_value == 'day' %}
#       to_date(${created_date}, 'YYYY-MM-DD')
#     {% elsif date_granularity._parameter_value == 'month' %}
#       to_date(${created_month}, 'YYYY-MM')
#     {% else %}
#       to_date(${created_date}, 'YYYY-MM-DD')
#     {% endif %};;
#   }

  dimension: date {
    label: "Selected Date"
    type:  date
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${created_date}
    {% elsif date_granularity._parameter_value == 'month' %}
      concat(${created_month},-01)
    {% else %}
      ${created_date}
    {% endif %};;
  }

  measure: count {
    label: "Number of Deliveries"
    type: count
    drill_fields: [id]
  }

  measure: total_distance_traveled {
    label: "Total Distance Traveled (m)"
    type: sum
    sql:  ${distance_traveled};;
    precision: 3
  }

  measure: max_distance_traveled {
    label: "Max Distance Traveled (m)"
    type: max
    sql: ${distance_traveled} ;;
  }

  # might want to exclude zeros
  measure: min_distance_traveled {
    label: "Min Distance Traveled (m)"
    type: number
    sql: MIN(NULLIF(${distance_traveled}, 0));;
  }

  measure: total_duration_seconds {
    label: "Total Delivery Time (s)"
    drill_fields: [robot]
    type:  sum
    sql:  ${elapsed_time} / 1000 ;;
  }


  measure: average_distance {
    label: "Average Distance Traveled (m)"
    type: average
    sql: ${distance_traveled} ;;
  }

  measure: average_duration_seconds {
    label: "Average Delivery Time (m)"
    type: average
    sql:  ${elapsed_time} / 1000 ;;
  }
}
