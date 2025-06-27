variable "solace_username" {
  type        = string
  description = "Solace broker SEMP username"
}

variable "solace_password" {
  type        = string
  description = "Solace broker SEMP password"
  sensitive   = true # Optionnel : recommandé pour une donnée sensible
}

variable "solace_url" {
  type        = string
  description = "Solace broker SEMP url, including SEMP port"
}

variable "msg_vpn_name" {
  type        = string
  description = "msg vpn name"
}