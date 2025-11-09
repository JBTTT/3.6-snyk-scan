module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.0"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Created_by  = var.created_by
    Cohort      = "CE11"
  }
}
