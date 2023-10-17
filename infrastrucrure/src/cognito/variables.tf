variable "project_name" {
  type        = string
  description = "Project name for tagging and naming resources."
}

variable "environment" {
  type        = string
  description = "Environment for the project (e.g., prod, dev, stage)."
}

variable "domain_name" {
  type        = string
  description = "Main domain name for callback and logout URLs."
  default     = "console.cuest.io" 
}

variable "callback_urls" {
  description = "List of allowed callback URLs for the identity providers."
  type        = list(string)
  default     = ["https://console.${var.environment}.${var.domain_name}/callback"]
}

variable "logout_urls" {
  description = "List of allowed logout URLs for the identity providers."
  type        = list(string)
  default     = ["https://console.${var.environment}.${var.domain_name}/logout"]
}
