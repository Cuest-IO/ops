provider "aws" {
    region = var.region_name
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-cuest"
    key     = "cloud_infra_terraform_state"
    region  = "us-east-1"
    encrypt = true
  }
}
