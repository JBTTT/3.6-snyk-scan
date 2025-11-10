module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.0"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.150.0/24", "10.0.160.0/24", "10.0.170.0/24"]
  public_subnets  = ["10.0.151.0/24", "10.0.161.0/24", "10.0.171.0/24"]

  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Created_by  = var.created_by
    Cohort      = "CE11"
  }
}
