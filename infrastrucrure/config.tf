# data "aws_route53_zone" "route53_zone" {
#   name         = local.workspace.domain_name
#   private_zone = false
# }

locals {
  env = {
    dev = {
      domain_name            = var.domain_name["dev"]
      project_name           = var.project_name
      record_name            = var.domain_name["dev"]
      alias_target           = var.alias_target["dev"]
      deployment_bucket_name = var.deployment_bucket_name
      profile                = "cuest_dev"
    }
    stage = {
      domain_name            = var.domain_name["stage"]
      project_name           = var.project_name
      record_name            = var.domain_name["stage"]
      alias_target           = var.alias_target["stage"]
      deployment_bucket_name = var.deployment_bucket_name
      profile                = "cuest_stage"
    }
    prod = {
      domain_name            = var.domain_name["stage"]
      project_name           = var.project_name
      record_name            = var.domain_name["prod"]
      alias_target           = var.alias_target["prod"]
      deployment_bucket_name = var.deployment_bucket_name
      profile                = "cuest_prod"
    }
  }
  environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "dev"
  workspace   = merge(local.env["dev"], local.env[local.environment])
}
