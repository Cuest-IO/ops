locals {
  callback_url = [
    "https://${var.environment}.console.${var.domain_name}/callback",
    "https://www.${var.environment}.console.${var.domain_name}/callback",
    "https://${var.environment}.docs.${var.domain_name}/callback",
    "https://www.${var.environment}.docs.${var.domain_name}/callback"
  ]
  logout_url = [
    "https://${var.environment}.console.${var.domain_name}/logout",
    "https://www.${var.environment}.console.${var.domain_name}/logout",
    "https://${var.environment}.docs.${var.domain_name}/logout",
    "https://www.${var.environment}.docs.${var.domain_name}/logout"
  ]
}
