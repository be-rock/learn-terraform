variable "aws_region" {}
variable "aws_profile" {}
variable "environment" {
  default = "dev"
}
variable "vpc_cidr_range" {
  default = "10.0.0.0/16"
}
variable "public_subnets" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

}
variable "private_subnets" {
  type    = list(string)
  default = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]

}
variable "environments" {
  type = map(any)
  default = {
    dev = "dev-env"
    prp = "preprod-env"
    prd = "prod-env"
  }
}