resource "aws_route53_zone" "cuest_route53" {
    name = local.workspace["domain_name"]

    tags = {
    project     = local.workspace["project_name"],
    environment = terraform.workspace,
    Name        = "route53_zone-${local.workspace["project_name"]}-${terraform.workspace}"
  }
}

resource "aws_route53_record" "cuest_route53_record" {
  zone_id = local.workspace["zone_id"]
  name    = local.workspace["record_name"]
  type    = local.workspace["record_type"]

  alias {
    name                   = local.workspace["alias_target"]
    zone_id                = local.workspace["cloudfront_zone_id"]
    evaluate_target_health = false
  }
}
