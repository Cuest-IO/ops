variable "project_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region_name" {
  type = string
}

variable "s3_website_zone_id" {
  type        = string
  # default = "Z3AQBSTGFYJSTF"
}

variable "type" {
  type = string
  default = "A"
}

variable "cloudfront_zone_id" {
  description = "The CloudFront zone ID"
  type        = string
}

variable "website_bucket_name" {
  description = "Name of the stage bucket"
  type        = string
}

variable "docs_bucket_name" {
  description = "Name of the docs stage bucket"
  type        = string
}

variable "console_stage_bucket_name" {
  description = "Name of the console stage bucket"
  type        = string
}

variable "stage_bucket_distribution_domain_name" {
  description = "Domain name for the stage bucket distribution"
  type        = string
}

variable "docs_stage_bucket_distribution_domain_name" {
  description = "Domain name for the docs stage bucket distribution"
  type        = string
}

variable "console_stage_bucket_distribution_domain_name" {
  description = "Domain name for the console stage bucket distribution"
  type        = string
}

variable "cuest_zone_id" {
  type        = string
  default     = "cuest.io"
}