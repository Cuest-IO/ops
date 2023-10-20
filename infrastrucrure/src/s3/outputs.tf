output "stage_bucket_website_domain" {
  value = aws_s3_bucket.stage_bucket.website_domain
  description = "Website domain for stage bucket"
}

output "docs_stage_bucket_website_domain" {
  value = aws_s3_bucket.docs_stage_bucket.website_domain
  description = "Website domain for docs stage bucket"
}

output "console_stage_bucket_website_domain" {
  value = aws_s3_bucket.console_stage_bucket.website_domain
  description = "Website domain for console stage bucket"
}
