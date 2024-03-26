// Docs
output "docs_certificate_arn" {
  value       = aws_acm_certificate.docs_cert.arn
}

output "docs_certificate_validation" {
  value       = aws_acm_certificate_validation.docs_cert_validation
}

// Console
output "console_certificate_arn" {
  value       = aws_acm_certificate.console_cert.arn
}

output "console_certificate_validation" {
  value       = aws_acm_certificate_validation.console_cert_validation
}

// Web
output "web_certificate_arn" {
  value       = aws_acm_certificate.web_cert.arn
}

output "web_certificate_validation" {
  value       = aws_acm_certificate_validation.web_cert_validation
}

