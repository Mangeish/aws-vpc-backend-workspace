
provider "aws" {
  version = "~> 2.70"
  region  = local.cfg["region"]
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.cfg["network"]["vpc_name"]
  cidr = local.cfg["network"]["cidr"]

  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = local.cfg["network"]["private_subnets"]
  

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
  }
}