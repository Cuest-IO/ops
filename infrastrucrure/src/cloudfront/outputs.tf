output "stage_bucket_distribution_domain_name" {
  value = aws_cloudfront_distribution.stage_bucket_distribution.domain_name  
}

output "docs_stage_bucket_distribution_domain_name" {
  value = aws_cloudfront_distribution.docs_stage_bucket_distribution.domain_name 
}

output "console_stage_bucket_distribution_domain_name" {
  value = aws_cloudfront_distribution.console_stage_bucket_distribution.domain_name  
}
