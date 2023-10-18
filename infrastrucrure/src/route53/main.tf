resource "aws_route53_zone" "cuest_route53" {
    name = var.domain_name
    tags = {
        project     = var.project_name,
        environment = var.environment,
        Name        = "route53_zone-${var.project_name}-${var.environment}"
    }
}

resource "aws_route53_record" "stage_record" {
  zone_id = aws_route53_zone.cuest_route53.zone_id
  name    = "stage.${var.domain_name}"
  type    = "A"
  alias {
    name                   = "${var.project_name}-console-stage-bucket.s3-website-${var.region_name}.amazonaws.com"

    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_stage_record" {
  zone_id = aws_route53_zone.cuest_route53.zone_id
  name    = "www.stage.${var.domain_name}"
  type    = "A"
  alias {
    name                   = "${var.project_name}-stage-bucket.s3-website.${var.region_name}.amazonaws.com"
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "docs_stage_record" {
  zone_id = aws_route53_zone.cuest_route53.zone_id
  name    = "docs.stage.${var.domain_name}"
  type    = "A"
  alias {
    name                   = "${var.project_name}-docs-stage-bucket.s3-website.${var.region_name}.amazonaws.com"
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_docs_stage_record" {
  zone_id = aws_route53_zone.cuest_route53.zone_id
  name    = "www.docs.stage.${var.domain_name}"
  type    = "A"
  alias {
    name                   = "${var.project_name}-docs-stage-bucket.s3-website.${var.region_name}.amazonaws.com"
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "console_stage_record" {
  zone_id = aws_route53_zone.cuest_route53.zone_id
  name    = "console.stage.${var.domain_name}"
  type    = "A"
  alias {
    name                   = "${var.project_name}-console-stage-bucket.s3-website.${var.region_name}.amazonaws.com"
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_console_stage_record" {
  zone_id = aws_route53_zone.cuest_route53.zone_id
  name    = "www.console.stage.${var.domain_name}"
  type    = "A"
  alias {
    name                   = "${var.project_name}-console-stage-bucket.s3-website.${var.region_name}.amazonaws.com"
    zone_id                = var.s3_website_zone_id
    evaluate_target_health = false
  }
}
