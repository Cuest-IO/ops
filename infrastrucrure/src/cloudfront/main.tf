resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "EMAIL" //DNS 

  tags = {
    Name = "cuest-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_name]

  depends_on = [aws_acm_certificate.cert]
}




resource "aws_cloudfront_distribution" "stage_bucket_distribution" {
  origin {
    domain_name = var.stage_bucket_regional_domain_name
    origin_id   = "StageBucketS3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.stage_oai.cloudfront_access_identity_path
    }
  }
 enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.comment_prefix} ${var.stage_bucket_regional_domain_name}"
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "StageBucketS3Origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  depends_on = [aws_acm_certificate_validation.cert_validation]

}

resource "aws_cloudfront_distribution" "docs_stage_bucket_distribution" {
  origin {
    domain_name = var.docs_stage_bucket_regional_domain_name
    origin_id   = "DocsStageBucketS3Origin"


    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.docs_stage_oai.cloudfront_access_identity_path
    }
  }
 enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.comment_prefix} ${var.docs_stage_bucket_regional_domain_name}"
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "DocsStageBucketS3Origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  depends_on = [aws_acm_certificate_validation.cert_validation]

}

resource "aws_cloudfront_distribution" "console_stage_bucket_distribution" {
  origin {
    domain_name = var.console_stage_bucket_regional_domain_name
    origin_id   = "ConsoleStageBucketS3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.console_stage_oai.cloudfront_access_identity_path
    }
  }

 enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.comment_prefix} ${var.console_stage_bucket_regional_domain_name}"
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "ConsoleStageBucketS3Origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  depends_on = [aws_acm_certificate_validation.cert_validation]

}

resource "aws_cloudfront_origin_access_identity" "stage_oai" {
  comment = "OAI for ${var.stage_bucket_website_domain}"
}

resource "aws_cloudfront_origin_access_identity" "docs_stage_oai" {
  comment = "OAI for ${var.docs_stage_bucket_website_domain}"
}

resource "aws_cloudfront_origin_access_identity" "console_stage_oai" {
  comment = "OAI for ${var.console_stage_bucket_website_domain}"
}


