resource "solacebroker_msg_vpn_acl_profile" "solace" {
  acl_profile_name               = "solace"
  client_connect_default_action  = "allow"
  msg_vpn_name                   = var.msg_vpn_name
  publish_topic_default_action   = "allow"
  subscribe_topic_default_action = "allow"
}

resource "random_password" "asset_pwd" {
  length  = 16
  special = true
}

variable "default_password" {
  type        = string
  default     = "P@ssw0rd2025"
  description = "Mot de passe par défaut (pour test)"
}
