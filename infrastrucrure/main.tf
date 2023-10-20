module "route53" {
  source                              = "./src/route53"
  project_name                        = local.workspace.project_name
  domain_name                         = local.workspace.domain_name
  environment                         = local.environment
  region_name                         = var.region_name
  s3_website_zone_id                  = var.s3_website_zone_id 
  stage_bucket_domain                 = module.s3.stage_bucket_website_domain
  docs_stage_bucket_website_domain    = module.s3.docs_stage_bucket_website_domain
  console_stage_bucket_website_domain = module.s3.console_stage_bucket_website_domain
}

module "s3" {
  source        = "./src/s3"
  project_name  = local.workspace.project_name
  environment   = local.environment
}


module "acm" {
  source        = "./src/acm"
  project_name  = local.workspace.project_name
  domain_name   = local.workspace.domain_name
  environment   = local.environment
}

module "cognito" {
  source         = "./src/cognito"
  project_name   = local.workspace.project_name
  environment    = local.environment
  callback_urls  = [
  "https://stage.cuest.io/callback",
  "https://www.stage.cuest.io/callback",
  "https://docs.stage.cuest.io/callback",
  "https://www.docs.stage.cuest.io/callback",
  "https://console.stage.cuest.io/callback",
  "https://www.console.stage.cuest.io/callback"
]

logout_urls    = [
  "https://stage.cuest.io/logout",
  "https://www.stage.cuest.io/logout",
  "https://docs.stage.cuest.io/logout",
  "https://www.docs.stage.cuest.io/logout",
  "https://console.stage.cuest.io/logout",
  "https://www.console.stage.cuest.io/logout"
]

  
}
