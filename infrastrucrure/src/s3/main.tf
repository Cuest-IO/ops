resource "aws_s3_bucket" "stage_bucket" {
  bucket = "cuest-stage-bucket"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket" "docs_stage_bucket" {
  bucket = "cuest-docs-stage-bucket"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket" "console_stage_bucket" {
  bucket = "cuest-console-stage-bucket"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}