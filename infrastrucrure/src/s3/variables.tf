variable "project_name" {
  type = string
}

variable "environment" {
  type     = string
  default  = "dev"
}

variable "domain_name" {}

variable "docs_cloudfront_origin_access_identity_iam" {}

variable "console_cloudfront_origin_access_identity_iam" {}



