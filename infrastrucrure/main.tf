module "route53" {  
  source                                          = "./src/route53"
  project_name                                    = local.workspace.project_name
  domain_name                                     = local.workspace.domain_name
  environment                                     = local.environment
  region_name                                     = var.region_name
  s3_website_zone_id                              = var.s3_website_zone_id 
  stage_bucket_name                               = module.s3.stage_bucket_website_domain
  docs_stage_bucket_name                          = module.s3.docs_stage_bucket_name
  console_stage_bucket_name                       = module.s3.console_stage_bucket_name
  cloudfront_zone_id                              = var.cloudfront_zone_id
  stage_bucket_distribution_domain_name           = module.cloudfront["stage"].stage_bucket_distribution_domain_name
  docs_stage_bucket_distribution_domain_name      = module.cloudfront["docs"].stage_bucket_distribution_domain_name
  console_stage_bucket_distribution_domain_name   = module.cloudfront["console"].stage_bucket_distribution_domain_name
  cuest_zone_id                                   = data.aws_route53_zone.route53_zone.zone_id
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

module "cloudfront" {
  source  = "./src/cloudfront"
  for_each = toset(["stage", "docs", "console"])

  bucket = {
    "stage"   = module.s3.stage_bucket_website_domain,
    "docs"    = module.s3.docs_stage_bucket_website_domain,
    "console" = module.s3.console_stage_bucket_website_domain
  }[each.key]

  bucket_name = {
    "stage"   = module.s3.stage_bucket_website_domain,
    "docs"    = module.s3.docs_stage_bucket_website_domain,
    "console" = module.s3.console_stage_bucket_website_domain
  }[each.key]

  stage_bucket_name                   = module.s3.stage_bucket_website_domain
  docs_bucket_name                    = module.s3.docs_stage_bucket_website_domain
  console_bucket_name                 = module.s3.console_stage_bucket_website_domain
  docs_stage_bucket_name              = module.s3.docs_stage_bucket_website_domain
  console_stage_bucket_name           = module.s3.console_stage_bucket_website_domain
  stage_bucket_website_domain         = module.s3.stage_bucket_website_domain
  docs_stage_bucket_website_domain    = module.s3.docs_stage_bucket_website_domain
  console_stage_bucket_website_domain = module.s3.console_stage_bucket_website_domain

  bucket_regional_domain = {
    "stage"   = module.s3.stage_bucket_website_domain != "" ? "${module.s3.stage_bucket_website_domain}.s3-us-west-1.amazonaws.com" : "cuest-stage-bucket.s3-us-west-1.amazonaws.com",
    "docs"    = module.s3.docs_stage_bucket_website_domain != "" ? "${module.s3.docs_stage_bucket_website_domain}.s3-us-west-1.amazonaws.com" : "cuest-docs-bucket.s3-us-west-1.amazonaws.com",
    "console" = module.s3.console_stage_bucket_website_domain != "" ? "${module.s3.console_stage_bucket_website_domain}.s3-us-west-1.amazonaws.com" : "cuest-console-bucket.s3-us-west-1.amazonaws.com"
  }[each.key]

  acm_certificate_arn = module.acm.certificate_arn
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = "PriceClass_100"
  comment_prefix      = "CloudFront for"
}
