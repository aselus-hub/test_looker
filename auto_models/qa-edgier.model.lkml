connection: "qa-edgier"

include: "/views/**/*.view"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

##### Explores #####


explore: api_delivery {
  label: "Delivery & Robot"
#   access_filter: {
#     field: api_robot.name
#     user_attribute: robot_name
#   }
  join: api_robot {
    relationship: many_to_one
    sql_on: ${api_delivery.robot} = ${api_robot.name} ;;
    type: left_outer
  }
}

explore: api_robot {
  label: "Robot"
}

##### Permissions  #####

# access_grant: can_see_sensitive_data {
#   allowed_values: ["finance"]
#   user_attribute: department
# }

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
