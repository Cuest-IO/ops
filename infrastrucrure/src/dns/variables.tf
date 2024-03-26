variable "project_name" {
  type        = string
  default     = "cuest"
}

variable "domain_name" {
  type        = string
  default     = "dev.cuest.io"
}

variable "environment" {
  type        = string
  default     = "dev"
}


variable "region_name" {
  type = string
}


variable "cloudfront_zone_id" {
  description = "The CloudFront zone ID"
  type        = string
}

// Bucket Names

variable "web_bucket_name" {
  description = "Name of the docs stage bucket"
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

// Distribution Domain Names

variable "web_bucket_distribution_domain_name" {
  description = "Domain name for the docs stage bucket distribution"
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