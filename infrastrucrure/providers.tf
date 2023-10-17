terraform {
  backend "s3" {
    bucket  = "cuest-terraform-state-bucket"
    key     = "cuest-project/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}
