variable "project_name" {
  type    = string
  default = "cuest"
}

variable "region_name" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type = map(string)
  default = {
    "dev"   = "dev.cuest.lol",
    "stage" = "stage.cuest.lol",
    "prod"  = "prod.cuest.lol"
  }
}

variable "environments" {
  type    = string
  default = "dev"
}


variable "cloudfront_zone_id" {
  description = "CloudFront hosted zone ID"
  type        = string
  default     = "Z2FDTNDATAQYW2"
}


