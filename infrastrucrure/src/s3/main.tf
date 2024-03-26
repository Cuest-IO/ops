// Docs

resource "aws_s3_bucket" "docs_bucket" {
  bucket = "${var.environment}.docs.${var.domain_name}"
}

resource "aws_s3_bucket_website_configuration" "docs_bucket_website" {
  bucket = aws_s3_bucket.docs_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "docs_bucket" {
  bucket = aws_s3_bucket.docs_bucket.id
  policy = data.aws_iam_policy_document.docs_bucket.json
}

data "aws_iam_policy_document" "docs_bucket" {
  statement {
    sid       = "DocsBucketGetObjectForCloudFront"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.docs_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [var.docs_cloudfront_origin_access_identity_iam]
    }
  }
}

// Console
resource "aws_s3_bucket" "console_bucket" {
  bucket = "${var.environment}.console.${var.domain_name}"
}

resource "aws_s3_bucket_website_configuration" "console_bucket_website" {
  bucket = aws_s3_bucket.console_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "console_bucket" {
  bucket = aws_s3_bucket.console_bucket.id
  policy = data.aws_iam_policy_document.console_bucket.json
}

data "aws_iam_policy_document" "console_bucket" {
  statement {
    sid       = "ConsoleBucketGetObjectForCloudFront"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.console_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [var.console_cloudfront_origin_access_identity_iam]

    }
  }
}

// Web
resource "aws_s3_bucket" "web_bucket" {
  bucket = "${var.environment}.web.${var.domain_name}"
}

resource "aws_s3_bucket_website_configuration" "web_bucket_website" {
  bucket = aws_s3_bucket.web_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "web_bucket" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = data.aws_iam_policy_document.web_bucket.json
}

data "aws_iam_policy_document" "web_bucket" {
  statement {
    sid       = "WebBucketGetObjectForCloudFront"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [var.web_cloudfront_origin_access_identity_iam]
    }
  }
}

