variable "project_name" {
  type        = string
  description = "Project name for tagging and naming resources."
}

variable "environment" {
  type     = string
  default  = "dev"
}

variable "domain_name" {
  type        = string
  description = "Main domain name for callback and logout URLs."
  default     = "dev.cuest.lol" 
}

# variable "callback_urls" {
#   description = "List of allowed callback URLs for the identity providers."
#   type        = list(string)
# }

# variable "logout_urls" {
#   description = "List of allowed logout URLs for the identity providers."
#   type        = list(string)
# }
