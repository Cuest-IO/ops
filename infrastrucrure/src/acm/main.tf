resource "aws_acm_certificate" "cert" {
  domain_name       = "stage.cuest.io"
  validation_method = "DNS"

  subject_alternative_names = [
    "www.stage.cuest.io",
    "docs.stage.cuest.io",
    "www.docs.stage.cuest.io",
    "console.stage.cuest.io",
    "www.console.stage.cuest.io"
  ]

  tags = {
    project     = var.project_name,
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
