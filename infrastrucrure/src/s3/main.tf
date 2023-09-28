resource "aws_s3_bucket" "cuest_deploy_bucket" {
  bucket = var.deployment_bucket_name

  tags = {
    project     = var.project_name,
    environment = terraform.workspace,
    Name        = "cuest-bucket-${var.project_name}-${terraform.workspace}"
  }
}

