resource "aws_s3_bucket" "b1" {
  bucket = "${var.bucket_name}-versioned-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
