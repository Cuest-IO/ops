// Doc

output "docs_bucket_name" {
  value = aws_s3_bucket.docs_bucket.bucket
}

output "docs_bucket_website_domain" {
  value = aws_s3_bucket.docs_bucket.bucket_regional_domain_name
}

output "docs_bucket_arn" {
  value = aws_s3_bucket.docs_bucket.arn
}

// Console

output "console_bucket_name" {
  value = aws_s3_bucket.console_bucket.bucket
}

output "console_bucket_website_domain" {
  value = aws_s3_bucket.console_bucket.bucket_regional_domain_name
}

output "console_bucket_arn" {
  value = aws_s3_bucket.console_bucket.arn
}

// Web

output "web_bucket_name" {
  value = aws_s3_bucket.web_bucket.bucket
}

output "web_bucket_website_domain" {
  value = aws_s3_bucket.web_bucket.bucket_regional_domain_name
}

output "web_bucket_arn" {
  value = aws_s3_bucket.web_bucket.arn
}
