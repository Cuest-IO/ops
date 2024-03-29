terraform {
  backend "s3" {
    encrypt = true
  }
}

module "cognito" {
  source       = "./src/cognito"
  project_name = var.project_name
  domain_name  = var.domain_name
  environment  = var.environment
}


module "s3" {
  source                                        = "./src/s3"
  project_name                                  = var.project_name
  domain_name                                   = var.domain_name
  environment                                   = var.environment
 
  docs_cloudfront_origin_access_identity_iam    = module.cloudfront.docs_cloudfront_origin_access_identity_iam
  console_cloudfront_origin_access_identity_iam = module.cloudfront.console_cloudfront_origin_access_identity_iam
}

module "dns" {
  source                                   = "./src/dns"
  project_name                             = var.project_name
  domain_name                              = var.domain_name
  environment                              = var.environment
  region_name                              = var.region_name
  docs_bucket_name                         = module.s3.docs_bucket_name
  console_bucket_name                      = module.s3.console_bucket_name

  cloudfront_zone_id                       = var.cloudfront_zone_id
  docs_bucket_distribution_domain_name     = module.cloudfront.docs_bucket_distribution_domain_name
  console_bucket_distribution_domain_name  = module.cloudfront.console_bucket_distribution_domain_name
}

module "cloudfront" {
  source                         = "./src/cloudfront"
  environment                    = var.environment
  domain_name                    = var.domain_name
  comment_prefix                 = "CloudFront for"

  doc_bucket_website_domain      = module.s3.docs_bucket_website_domain
  console_bucket_website_domain  = module.s3.console_bucket_website_domain

  docs_certificate_arn           = module.dns.docs_certificate_arn
  console_certificate_arn        = module.dns.console_certificate_arn

  docs_certificate_validation    = module.dns.docs_certificate_validation
  console_certificate_validation = module.dns.console_certificate_validation

}


