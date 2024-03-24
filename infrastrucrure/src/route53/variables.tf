variable "project_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "environment" {
  type     = string
  default  = "dev"
}

variable "region_name" {
  type = string
}


variable "type" {
  type = string
  default = "A"
}

variable "cloudfront_zone_id" {
  description = "The CloudFront zone ID"
  type        = string
}


variable "docs_bucket_name" {
  description = "Name of the docs stage bucket"
  type        = string
}

variable "console_bucket_name" {
  description = "Name of the console stage bucket"
  type        = string
}


variable "docs_bucket_distribution_domain_name" {
  description = "Domain name for the docs stage bucket distribution"
  type        = string
}

variable "console_bucket_distribution_domain_name" {
  description = "Domain name for the console stage bucket distribution"
  type        = string
}

