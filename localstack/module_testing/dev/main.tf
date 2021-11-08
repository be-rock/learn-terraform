# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.27"
#     }
#   }
# }

module "create-bucket" {
    source = "../modules"

    environment = var.environment
    bucket_name = var.bucket_name
}