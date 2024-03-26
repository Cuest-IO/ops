resource "aws_route53_zone" "route53_zone" {
  name         = var.domain_name
  comment      = "Managed by Terraform"
}

// Docs

resource "aws_route53_record" "www_docs_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "www.${var.docs_bucket_name}"
  type    = "A"

  alias {
    name                   = var.docs_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

# create a record set in route 53 for domain validatation
resource "aws_route53_record" "docs_route53_record" {
  for_each = {
    for dvo in aws_acm_certificate.docs_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.route53_zone.zone_id
}

resource "aws_route53_record" "docs_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "${var.docs_bucket_name}"
  type    = "A"

  alias {
    name                   = var.docs_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

// Console

resource "aws_route53_record" "www_console_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "www.${var.console_bucket_name}"
  type    = "A"

  alias {
    name                   = var.console_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

# create a record set in route 53 for domain validatation
resource "aws_route53_record" "console_route53_record" {
  for_each = {
    for dvo in aws_acm_certificate.console_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.route53_zone.zone_id
}

resource "aws_route53_record" "console_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "${var.console_bucket_name}"
  type    = "A"

  alias {
    name                   = var.console_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
