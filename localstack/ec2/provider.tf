provider "aws" {
  profile                     = var.aws_profile
  region                      = var.aws_region
  skip_requesting_account_id  = true
  skip_credentials_validation = true

  endpoints {
    s3       = "http://localhost:4566"
    ec2      = "http://localhost:4566"
  }
}