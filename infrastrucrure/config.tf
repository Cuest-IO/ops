locals {
  env = {
    dev = {
      domain_name            = var.domain_name["dev"]
      project_name           = var.project_name
      record_name            = var.domain_name["dev"]
      profile                = "cuest_dev"
    }
    stage = {
      domain_name            = var.domain_name["stage"]
      project_name           = var.project_name
      record_name            = var.domain_name["stage"]
      profile                = "cuest_stage"
    }
    prod = {
      domain_name            = var.domain_name["prod"]
      project_name           = var.project_name
      record_name            = var.domain_name["prod"]
      profile                = "cuest_prod"
    }
  }
  environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "dev"
  workspace   = merge(local.env["dev"], local.env[local.environment])
}
