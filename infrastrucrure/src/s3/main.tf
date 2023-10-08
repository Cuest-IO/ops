resource "aws_s3_bucket" "cuest_deploy_bucket" {
  bucket = "${var.project_name}-${var.environment}-bucket"

  tags = {
    project     = var.project_name,
    environment = var.environment,
    Name        = "${var.project_name}-${var.environment}-bucket"
  }
}