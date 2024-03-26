// doc
output "docs_bucket_distribution_domain_name" {
  value = aws_cloudfront_distribution.docs_bucket_distribution.domain_name 
}

output "docs_cloudfront_origin_access_identity_iam" {
  value = aws_cloudfront_origin_access_identity.docs_oai.iam_arn
}

//console
output "console_bucket_distribution_domain_name" {
  value = aws_cloudfront_distribution.console_bucket_distribution.domain_name  
}

output "console_cloudfront_origin_access_identity_iam" {
  value = aws_cloudfront_origin_access_identity.console_oai.iam_arn
}

//web
output "web_bucket_distribution_domain_name" {
  value = aws_cloudfront_distribution.web_bucket_distribution.domain_name  
}

output "web_cloudfront_origin_access_identity_iam" {
  value = aws_cloudfront_origin_access_identity.web_oai.iam_arn
}
