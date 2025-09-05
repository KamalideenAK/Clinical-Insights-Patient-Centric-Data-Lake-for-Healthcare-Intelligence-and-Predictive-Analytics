provider "aws" {
  region = var.region
}

resource "aws_kms_key" "datalake" {
  description             = "KMS key for clinical data lake"
  deletion_window_in_days = 30
}

resource "aws_s3_bucket" "landing" {
  bucket = "clinical-insights-landing-${var.env}"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.datalake.arn
      }
    }
  }
}

resource "aws_s3_bucket" "curated" {
  bucket = "clinical-insights-curated-${var.env}"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.datalake.arn
      }
    }
  }
}
