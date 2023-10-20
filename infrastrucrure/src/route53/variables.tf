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
  default = "Z3AQBSTGFYJSTF"
}

variable "zone_id" {
  type = string
  default = "Z06509522CN5N0BIKFAVE"
}

variable "type" {
  type = string
  default = "A"
}

variable "stage_bucket_domain" {
  description = "The domain of the stage bucket"
  type        = string
  default     = "cuest-stage-bucket.s3-website-us-east-1.amazonaws.com"
}

variable "docs_stage_bucket_website_domain" {
  description = "The domain of the docs stage bucket"
  type        = string
  default     = "cuest-stage-bucket.s3-website-us-east-1.amazonaws.com"  
}

variable "console_stage_bucket_website_domain" {
  description = "The domain of the console stage bucket"
  type        = string
  default     = "cuest-console-stage-bucket.s3-website-us-east-1.amazonaws.com"  
}




