view: api_robot {
  sql_table_name: public.api_robot ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: aligned {
    type: yesno
    sql: ${TABLE}."aligned" ;;
  }

  dimension: ap_mac_address {
    type: string
    sql: ${TABLE}."ap_mac_address" ;;
  }

  dimension: ap_ssid {
    type: string
    sql: ${TABLE}."ap_ssid" ;;
  }

  dimension: auth0_user_id {
    type: string
    sql: ${TABLE}."auth0_user_id" ;;
  }

  dimension: cart_footprint_id {
    type: string
    sql: ${TABLE}."cart_footprint_id" ;;
  }

  dimension: charging_state {
    type: yesno
    sql: ${TABLE}."charging_state" ;;
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

  dimension: current_version {
    type: string
    sql: ${TABLE}."current_version" ;;
  }

  dimension: error_status {
    type: string
    sql: ${TABLE}."error_status" ;;
  }

  dimension: footprint_id {
    type: string
    sql: ${TABLE}."footprint_id" ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}."ip" ;;
  }

  dimension_group: last_boot {
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
    sql: ${TABLE}."last_boot" ;;
  }

  dimension_group: last_charge {
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
    sql: ${TABLE}."last_charge" ;;
  }

  dimension_group: last_connection {
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
    sql: ${TABLE}."last_connection_time" ;;
  }

  dimension_group: last_status_change {
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
    sql: ${TABLE}."last_status_change" ;;
  }

  dimension: localized {
    type: yesno
    sql: ${TABLE}."localized" ;;
  }

  dimension: low_battery_mode {
    type: yesno
    sql: ${TABLE}."low_battery_mode" ;;
  }

  dimension: manual_mode {
    type: yesno
    sql: ${TABLE}."manual_mode" ;;
  }

  dimension: map_id {
    type: number
    sql: ${TABLE}."map_id" ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: payload_footprint {
    type: string
    sql: ${TABLE}."payload_footprint" ;;
  }

  dimension: safety_field_violation {
    type: yesno
    sql: ${TABLE}."safety_field_violation" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: task_manager {
    type: string
    sql: ${TABLE}."task_manager" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
