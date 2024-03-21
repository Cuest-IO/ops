variable "domain_name" {
  type = string
}

variable "bucket" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_regional_domain" {
  description = "The regional domain name of the S3 bucket"
  type        = string
}

variable "website_bucket_name" {
  description = "The name of the website S3 bucket"
  type        = string
}

variable "stage_bucket_regional_domain_name" {
  description = "Regional domain name for the stage bucket"
  default     = "cuest-stage-bucket.s3-us-west-1.amazonaws.com"
}

variable "docs_bucket_name" {
  description = "The name of the docs S3 bucket"
  type        = string
}

variable "docs_stage_bucket_regional_domain_name" {
  description = "Regional domain name for the docs stage bucket"
  default     = "cuest-docs-stage-bucket.s3-us-west-1.amazonaws.com"
}

variable "console_bucket_name" {
  description = "The name of the console S3 bucket"
  type        = string
}

variable "console_stage_bucket_name" {
  description = "Name of the console stage bucket"
  type        = string
}


variable "console_stage_bucket_regional_domain_name" {
  description = "Regional domain name for the console stage bucket"
  default     = "cuest-console-stage-bucket.s3-us-west-1.amazonaws.com"
}

variable "acm_certificate_arn" {
  description = "ACM Certificate ARN for Cloudfront"
  type        = string
}
variable "bucket_name" {
  description = "Name of the bucket to be used with CloudFront"
  type        = string
}


variable "comment_prefix" {
  description = "Prefix for the CloudFront comment"
  default     = "CloudFront for"
}

variable "enabled" {
  description = "Enable or disable CloudFront distribution"
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Enable or disable IPv6 on CloudFront distribution"
  default     = true
}

variable "default_root_object" {
  description = "Default root object for CloudFront distribution"
  default     = "index.html"
}

variable "price_class" {
  description = "Price class for CloudFront distribution"
  default     = "PriceClass_100"
}

variable "stage_bucket_website_domain" {
  description = "The website domain for the stage bucket"
  type        = string
}

variable "docs_stage_bucket_website_domain" {
  description = "The website domain for the docs stage bucket"
  type        = string
}

variable "console_stage_bucket_website_domain" {
  description = "The website domain for the console stage bucket"
  type        = string
}


