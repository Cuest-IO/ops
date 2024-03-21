variable "project_name" {
  type    = string
  default = "cuest"
}

variable "region_name" {
  type    = string
  default = "us-east-1"
}

variable "aws_profiles" {
  type = map(string)
  default = {
    "dev" = "cuest_dev",
    "stage" = "cuest_stage",
    "prod" = "cuest_prod"
  }
}
variable "domain_name" {
  type = map(string)
  default = {
    "dev"   = "dev.cuest.io",
    "stage" = "stage.cuest.io",
    "prod"  = "prod.cuest.io"
  }
}

variable "environments" {
  type    = list(string)
  default = ["dev", "stage", "prod"]
}

variable "subdomains" {
  description = "Subdomains to be created under each environment"
  type        = list(string)
  default     = ["www", "docs", "console"]
}

variable "record_type" {
  type    = string
  default = "A"
}

variable "alias_target" {
  description = "The alias DNS target"
  type        = map(string)
  default = {
    "dev"   = "cuest-dev-bucket.s3-website.us-east-1.amazonaws.com",
    "stage" = "cuest-stage-bucket.s3-website.us-east-1.amazonaws.com",
    "prod"  = "cuest-prod-bucket.s3-website.us-east-1.amazonaws.com"
  }
}

variable "cloudfront_zone_id" {
  description = "CloudFront hosted zone ID"
  type        = string
  default     = "Z2FDTNDATAQYW2"
}

variable "s3_website_zone_id" {
  description = "The zone ID for the S3 website endpoint"
  type        = string
  default     = "Z3AQBSTGFYJSTF"
}

variable "record_name" {
  type    = string
  default = "stage.cuest.io"
}

variable "deployment_bucket_name" {
  type    = string
  default = "cuest-deployment-bucket"
}
variable "stage_bucket_domain" {
  description = "The domain of the stage bucket"
  type        = string
  default     = "cuest-stage-bucket.s3-website-us-east-1.amazonaws.com"
}

variable "docs_stage_bucket_domain" {
  description = "The domain of the docs stage bucket"
  type        = string
  default     = "cuest-stage-bucket.s3-website-us-east-1.amazonaws.com"
}

variable "console_stage_bucket_domain" {
  description = "The domain of the console stage bucket"
  type        = string
  default     = "cuest-console-stage-bucket.s3-website-us-east-1.amazonaws.com"
}
