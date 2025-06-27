resource "solacebroker_msg_vpn_client_username" "user_user-service" {
  acl_profile_name = solacebroker_msg_vpn_acl_profile.solace.acl_profile_name

  client_username = "user-service"
  password        = var.default_password
  enabled         = true
  msg_vpn_name    = var.msg_vpn_name
}


module "user_service_queue" {
  source = "registry.terraform.io/SolaceProducts/queue-endpoint/solacebroker"

  msg_vpn_name  = var.msg_vpn_name
  endpoint_type = "queue"
  endpoint_name = "user-service"
  permission    = "consume"
  access_type   = "exclusive"
  owner         = solacebroker_msg_vpn_client_username.user_user-service.client_username

  queue_subscription_topics = ["solace/user/>"]
}

output "user_service_provisioned_queue" {
  value       = module.user_service_queue.queue
  description = "The provisioned queue resource"
}

output "user_service_provisioned_queue_subscriptions" {
  value       = module.user_service_queue.queue_subscriptions
  description = "The provisioned queue subscription resources"
}