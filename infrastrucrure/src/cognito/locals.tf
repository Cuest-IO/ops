locals {
  callback_url = [
    "https://console.${var.domain_name}/callback",
    "https://www.console.${var.domain_name}/callback",
    "https://docs.${var.domain_name}/callback",
    "https://www.docs.${var.domain_name}/callback"
  ]
  logout_url = [
    "https://console.${var.domain_name}/logout",
    "https://www.console.${var.domain_name}/logout",
    "https://docs.${var.domain_name}/logout",
    "https://www.docs.${var.domain_name}/logout"
  ]
}
