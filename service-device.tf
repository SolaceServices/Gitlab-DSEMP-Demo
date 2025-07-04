resource "solacebroker_msg_vpn_client_username" "user_device-service" {
  acl_profile_name = solacebroker_msg_vpn_acl_profile.solace.acl_profile_name

  client_username = "device-service"
  password        = var.default_password
  enabled         = true
  msg_vpn_name    = var.msg_vpn_name
}


module "device_service_queue" {
  source = "registry.terraform.io/SolaceProducts/queue-endpoint/solacebroker"

  msg_vpn_name  = var.msg_vpn_name
  endpoint_type = "queue"
  endpoint_name = "device-service"
  permission    = "consume"
  access_type   = "exclusive"
  owner         = solacebroker_msg_vpn_client_username.user_device-service.client_username

  queue_subscription_topics = ["solace/device/>"]
}

output "device_service_provisioned_queue" {
  value       = module.device_service_queue.queue
  description = "The provisioned queue resource"
}

output "device_service_provisioned_queue_subscriptions" {
  value       = module.device_service_queue.queue_subscriptions
  description = "The provisioned queue subscription resources"
}