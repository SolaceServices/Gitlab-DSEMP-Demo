# output "asset_pwd_out" {
#   value     = random_password.asset_pwd.result
#   sensitive = false
# }

output "mdp_print_console" {
  value = var.default_password
}