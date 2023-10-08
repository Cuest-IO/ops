locals {
  env = {
    dev = {
        domain_name =            var.domain_name
        project_name =           var.project_name
        record_name =            var.record_name
        record_type =            var.record_type
        alias_target =           var.alias_target
        cloudfront_zone_id =     var.cloudfront_zone_id
        deployment_bucket_name = var.deployment_bucket_name
    }
    stage = {

   }
    prod = {

   }
  }
  environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "dev"
  workspace   = merge(local.env["dev"], local.env[local.environment])
}


