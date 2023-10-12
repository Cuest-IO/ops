locals {
  env = {
    dev = {
      domain_name             = "dev.cuest.io"
      project_name            = "cuest"
      record_name             = "dev.cuest.io"
      alias_target            = "cuest-dev-bucket.s3-website.us-east-1.amazonaws.com"
      deployment_bucket_name  = "cuest-dev-bucket"
    }
    stage = {
      domain_name             = "stage.cuest.io"
      project_name            = "cuest"
      record_name             = "stage.cuest.io"
      alias_target            = "cuest-stage-bucket.s3-website.us-east-1.amazonaws.com"
      deployment_bucket_name  = "cuest-stage-bucket"
    }
    prod = {
      domain_name             = "prod.cuest.io"
      project_name            = "cuest"
      record_name             = "prod.cuest.io"
      alias_target            = "cuest-prod-bucket.s3-website.us-east-1.amazonaws.com"
      deployment_bucket_name  = "cuest-prod-bucket"
    }
  }
  environment = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "dev"
  workspace   = merge(local.env["dev"], local.env[local.environment])
}
