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
    s3       = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "b1" {
  bucket = "versioned-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "b2" {
  bucket = "nonversioned-bucket"
  acl    = "private"

  versioning {
    enabled = false
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}