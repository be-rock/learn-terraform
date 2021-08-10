resource "aws_eip" "nat" {
  count = 3
  vpc   = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-${var.environment}-vpc"
  cidr = var.vpc_cidr_range

  azs = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  #   azs             = slice(data.aws_availability_zones.azs.names, 0, 3)
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    terraform   = "true"
    environment = var.environment
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
output "private_subnet" {
  value = module.vpc.private_subnets
}
output "public_subnets" {
  value = module.vpc.public_subnets

}