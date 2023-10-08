provider "aws" {
    region = var.region_name
}

terraform {
  backend "s3" {
    bucket  = var.state_bucket_name
    key     = var.state_bucket_key
    region  = var.region_name
    encrypt = true
  }
}
