resource "solacebroker_msg_vpn_client_username" "user_asset-service" {
  acl_profile_name = solacebroker_msg_vpn_acl_profile.solace.acl_profile_name

  client_username = "asset-service"
  password        = var.default_password
  enabled         = true
  msg_vpn_name    = var.msg_vpn_name
}

module "asset_service_queue" {
  source = "registry.terraform.io/SolaceProducts/queue-endpoint/solacebroker"

  msg_vpn_name  = var.msg_vpn_name
  endpoint_type = "queue"
  endpoint_name = "asset-service"
  permission    = "consume"
  access_type   = "exclusive"
  owner         = solacebroker_msg_vpn_client_username.user_asset-service.client_username

  queue_subscription_topics = ["solace/asset/>"]
}

output "asset_service_provisioned_queue" {
  value       = module.asset_service_queue.queue
  description = "The provisioned queue resource"
}

output "asset_service_provisioned_queue_subscriptions" {
  value       = module.asset_service_queue.queue_subscriptions
  description = "The provisioned queue subscription resources"
}