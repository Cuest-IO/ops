output "certificate_arn" {
  value       = aws_acm_certificate.cert.arn
}

output "cert_validation_record_names" {
  value       = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_name]
}

output "cert_validation_record_types" {
  value       = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_type]
}

output "cert_validation_record_values" {
  value       = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_value]
}
