provider "aws" {
  profile                     = var.profile
  region                      = var.region
  skip_requesting_account_id  = true
  skip_credentials_validation = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}
