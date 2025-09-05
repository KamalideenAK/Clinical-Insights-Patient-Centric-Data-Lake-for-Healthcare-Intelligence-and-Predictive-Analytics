output "landing_bucket" {
  value = aws_s3_bucket.landing.bucket
}

output "curated_bucket" {
  value = aws_s3_bucket.curated.bucket
}
