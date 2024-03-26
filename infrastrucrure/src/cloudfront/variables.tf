variable "environment" {
  type     = string
  default  = "dev"
}

variable "domain_name" {
  type = string
}

variable "doc_bucket_website_domain" {
  type = string
}

variable "console_bucket_website_domain" {
  type = string
}


variable "docs_certificate_arn" {
  description = "ACM Certificate ARN for Cloudfront"
  type        = string
}

variable "console_certificate_arn" {
  description = "ACM Certificate ARN for Cloudfront"
  type        = string
}

variable "docs_certificate_validation" {
  description = "ACM Certificate Validation"
}

variable "console_certificate_validation" {
  description = "ACM Certificate Validation"
}

variable "comment_prefix" {
  description = "Prefix for the CloudFront comment"
  default     = "CloudFront for"
}

variable "error_ttl" {
  type        = number
  default     = 10
  description = "The minimum amount of time, in seconds, that you want CloudFront to cache the HTTP status code specified in ErrorCode"
}




