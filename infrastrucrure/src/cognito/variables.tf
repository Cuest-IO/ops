variable "project_name" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "callback_urls" {
  description = "List of allowed callback URLs for the identity providers."
  type        = list(string)
  default     = []
}

variable "logout_urls" {
  description = "List of allowed logout URLs for the identity providers."
  type        = list(string)
  default     = []
}
