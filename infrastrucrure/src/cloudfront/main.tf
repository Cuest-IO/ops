resource "aws_cloudfront_distribution" "docs_bucket_distribution" {
  origin {
    domain_name = var.doc_bucket_website_domain
    origin_id   = "${var.environment}-DocsBucketS3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.docs_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.comment_prefix} ${var.doc_bucket_website_domain}"
  default_root_object = "index.html"
  aliases = ["${var.environment}.docs.${var.domain_name}", "www.${var.environment}.docs.${var.domain_name}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.environment}-DocsBucketS3Origin"

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

  custom_error_response {
    error_code            = 403
    error_caching_min_ttl = var.error_ttl
    response_code         = 403
    response_page_path    = "/error.html"
  }

  custom_error_response {
    error_code            = 404
    error_caching_min_ttl = var.error_ttl
    response_code         = 404
    response_page_path    = "/error.html"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.docs_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  depends_on = [var.docs_certificate_validation]
}

resource "aws_cloudfront_distribution" "console_bucket_distribution" {
  origin {
    domain_name = var.console_bucket_website_domain
    origin_id   = "${var.environment}-ConsoleBucketS3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.console_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.comment_prefix} ${var.console_bucket_website_domain}"
  default_root_object = "index.html"
  aliases = ["${var.environment}.console.${var.domain_name}", "www.${var.environment}.console.${var.domain_name}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.environment}-ConsoleBucketS3Origin"

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

  custom_error_response {
    error_code            = 403
    error_caching_min_ttl = var.error_ttl
    response_code         = 403
    response_page_path    = "/error.html"
  }

  custom_error_response {
    error_code            = 404
    error_caching_min_ttl = var.error_ttl
    response_code         = 404
    response_page_path    = "/error.html"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

 viewer_certificate {
    acm_certificate_arn      = var.console_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  depends_on = [var.console_certificate_validation]
}


resource "aws_cloudfront_origin_access_identity" "docs_oai" {
  comment = "OAI for ${var.doc_bucket_website_domain}"
}

resource "aws_cloudfront_origin_access_identity" "console_oai" {
  comment = "OAI for ${var.console_bucket_website_domain}"
}


