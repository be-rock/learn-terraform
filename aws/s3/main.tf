terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile                     = "localstack"
  region                      = "us-east-1"
  skip_requesting_account_id  = true
  skip_credentials_validation = true

  endpoints {
    dynamodb = "http://localhost:4566"
    s3       = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}