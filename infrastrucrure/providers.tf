provider "aws" {
    region = "eu-west-1" 
}

terraform {
  backend "s3" {
    bucket  = "cuest-terraform-state-bucket" 
    key     = "stage/cuest-project/terraform.tfstate" 
    region  = "eu-west-1" 
    encrypt = true
  }
}
