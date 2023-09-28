module "route53" {
  source       = "./src/route53"
}

module "s3" {
  source                  = "./src/s3"
  project_name            = var.project_name
}
