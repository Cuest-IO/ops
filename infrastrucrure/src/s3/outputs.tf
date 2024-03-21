
output "docs_bucket_name" {
  value = aws_s3_bucket.docs_stage_bucket.bucket
}

output "website_bucket_name" {
  value = aws_s3_bucket.website_bucket_names.bucket
}

output "console_stage_bucket_name" {
  value = aws_s3_bucket.console_stage_bucket.bucket
}
output "stage_bucket_website_domain" {
  value = aws_s3_bucket.stage_bucket.website_domain
}

output "docs_stage_bucket_website_domain" {
  value = aws_s3_bucket.docs_stage_bucket.website_domain
}

output "console_stage_bucket_website_domain" {
  value = aws_s3_bucket.console_stage_bucket.website_domain
}

output "stage_bucket_arn" {
  value = aws_s3_bucket.stage_bucket.arn
}

output "docs_stage_bucket_arn" {
  value = aws_s3_bucket.docs_stage_bucket.arn
}

output "console_stage_bucket_arn" {
  value = aws_s3_bucket.console_stage_bucket.arn
}
