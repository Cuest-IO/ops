resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "EMAIL" //DNS

  subject_alternative_names = [
    "www.${var.domain_name}",
    "docs.${var.domain_name}",
    "www.docs.${var.domain_name}",
    "console.${var.domain_name}",
    "www.console.${var.domain_name}"
  ]

  tags = {
    project     = var.project_name,
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_value]
}
