resource "aws_route53_zone" "cuest_route53" {

    name = var.domain_name

    tags = {
    project     = var.project_name,
    environment = terraform.workspace,
    Name        = "route53_zone-${var.project_name}-${terraform.workspace}"
  }
}

resource "aws_route53_record" "cuest_route53_record" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = var.record_type

  alias {
    name                   = var.alias_target
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}





