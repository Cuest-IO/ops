provider "aws" {
    region = var.region_name
}

terraform {
  backend "s3" {
    bucket  = "cuest-terraform-state-bucket"
    key     = "${terraform.workspace}/cuest-project/terraform.tfstate"
    region  = var.region_name
    encrypt = true
  }
}
