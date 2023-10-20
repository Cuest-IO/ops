resource "aws_route53_record" "www_stage_record" {
  zone_id = var.zone_id
  name    = "www.${var.stage_bucket_domain}"
  type    = var.type

  alias {
    name                   = var.stage_bucket_domain
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_docs_stage_record" {
  zone_id = var.zone_id
  name    = "www.${var.docs_stage_bucket_website_domain}"
   type    = var.type

  alias {
    name                   = var.docs_stage_bucket_website_domain
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_console_stage_record" {
  zone_id = var.zone_id
  name    = "www.${var.console_stage_bucket_website_domain}"
  type    = var.type

  alias {
    name                   = var.console_stage_bucket_website_domain
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}
