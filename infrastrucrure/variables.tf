variable "project_name" {
  type        = string
  default     = "cuest"
}

variable "region_name" {
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  type        = string
}

variable "record_name" {
  type        = string
}

variable "record_type" {
  type        = string
  default     = "A"
}

variable "alias_target" {
  type        = string
}

variable "cloudfront_zone_id" {
  type        = string
}

variable "deployment_bucket_name" {
  type        = string
}

variable "state_bucket_name" {
  type        = string
}

variable "state_bucket_key" {
  type        = string
}
