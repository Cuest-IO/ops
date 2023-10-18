terraform {
  backend "s3" {
    bucket  = "cuest-state-bucket"
    key     = "cuest-project/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
