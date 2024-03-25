output "docs_certificate_arn" {
  value       = aws_acm_certificate.docs_cert.arn
}

output "docs_certificate_validation" {
  value       = aws_acm_certificate_validation.docs_cert_validation
}

output "console_certificate_arn" {
  value       = aws_acm_certificate.console_cert.arn
}

output "console_certificate_validation" {
  value       = aws_acm_certificate_validation.console_cert_validation
}

# output "cert_validation_record_names" {
#   value       = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_name]
# }

# output "cert_validation_record_types" {
#   value       = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_type]
# }

# output "cert_validation_record_values" {
#   value       = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_value]
# }
