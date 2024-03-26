// Docs
resource "aws_acm_certificate" "docs_cert" {
  domain_name       = "${var.environment}.docs.${var.domain_name}"
  validation_method = "DNS" //EMAIL

  subject_alternative_names = [
    "www.${var.environment}.docs.${var.domain_name}"
  ]

  tags = {
    project     = var.project_name,
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "docs_cert_validation" {
  certificate_arn         = aws_acm_certificate.docs_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.docs_route53_record : record.fqdn]
}

// Console
resource "aws_acm_certificate" "console_cert" {
  domain_name       = "${var.environment}.console.${var.domain_name}"
  validation_method = "DNS" //EMAIL

  subject_alternative_names = [
    "www.${var.environment}.console.${var.domain_name}"
  ]

  tags = {
    project     = var.project_name,
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "console_cert_validation" {
  certificate_arn         = aws_acm_certificate.console_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.console_route53_record : record.fqdn]
}
