resource "aws_s3_bucket" "stage_bucket" {
  bucket = "${var.project_name}-stage-bucket"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    project     = var.project_name,
    environment = "stage",
    Name        = "${var.project_name}-stage-bucket"
  }
}

resource "aws_s3_bucket" "docs_stage_bucket" {
  bucket = "${var.project_name}-docs-stage-bucket"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    project     = var.project_name,
    environment = "docs.stage",
    Name        = "${var.project_name}-docs-stage-bucket"
  }
}

resource "aws_s3_bucket" "console_stage_bucket" {
  bucket = "${var.project_name}-console-stage-bucket"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    project     = var.project_name,
    environment = "console.stage",
    Name        = "${var.project_name}-console-stage-bucket"
  }
}
