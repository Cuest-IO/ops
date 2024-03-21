resource "aws_route53_zone" "route53_zone" {
  name         = var.domain_name
}

resource "aws_route53_record" "www_stage_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "www.${var.website_bucket_name}"
  type    = "A"

  alias {
    name                   = var.stage_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_docs_stage_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "www.${var.docs_bucket_name}"
  type    = "A"

  alias {
    name                   = var.docs_stage_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_console_stage_record" {
  zone_id = resource.aws_route53_zone.route53_zone.zone_id
  name    = "www.${var.console_stage_bucket_name}"
  type    = "A"

  alias {
    name                   = var.console_stage_bucket_distribution_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
