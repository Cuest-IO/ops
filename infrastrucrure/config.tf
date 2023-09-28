locals {
  env = {
    dev = {
        domain_name =            "cuest.io"
        project_name =           "cuest"
        zone_id =                "Z07964423DC23BZLNJZNT"
        record_name =            "record.cuest.io"
        record_type =            "A"
        alias_target =           "d36w6f0mlqjgzj.cloudfront.net."
        cloudfront_zone_id =     "Z2FDTNDATAQYW2"
        deployment_bucket_name = "cuest_dev_bucket"
    }

    stage = {
    }

    prod = {
    }
  }
  environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "dev"
  workspace   = merge(local.env["dev"], local.env[local.environment])
}
