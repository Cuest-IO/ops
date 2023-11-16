data "aws_route53_zone" "route53_zone" {
  name         = var.domain_name
  private_zone = false
}

locals {
  env = {
    dev = {
      domain_name             = var.domain_name
      project_name            = var.project_name
      record_name             = "dev.${var.domain_name}"
      alias_target            = var.alias_target["dev"]
      deployment_bucket_name  = var.deployment_bucket_name
    }
    stage = {
      domain_name             = var.domain_name
      project_name            = var.project_name
      record_name             = "stage.${var.domain_name}"
      alias_target            = var.alias_target["stage"]
      deployment_bucket_name  = var.deployment_bucket_name
    }
    prod = {
      domain_name             = var.domain_name
      project_name            = var.project_name
      record_name             = "prod.${var.domain_name}"
      alias_target            = var.alias_target["prod"]
      deployment_bucket_name  = var.deployment_bucket_name
    }
  }
  environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "dev"
  workspace   = merge(local.env["dev"], local.env[local.environment])
}
