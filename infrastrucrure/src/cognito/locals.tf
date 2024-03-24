locals {
  console_callback_url = [
    "https://console.${var.domain_name}/callback",
    "https://www.console.${var.domain_name}/callback"
  ]
  console_logout_url = [
    "https://console.${var.domain_name}/logout",
    "https://www.console.${var.domain_name}/logout"
  ]
  doc_callback_url = [
    "https://docs.${var.domain_name}/callback",
    "https://www.docs.${var.domain_name}/callback"
  ]
  doc_logout_url = [
    "https://docs.${var.domain_name}/logout",
    "https://www.docs.${var.domain_name}/logout"
  ]
}
