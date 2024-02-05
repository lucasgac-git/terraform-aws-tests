module "vpc-1" {
  source           = "../../../self-modules/networking-eks"
  vpc_cidr         = local.vpc_cidr
  public_cidrs     = local.public_cidrs
  private_cidrs    = local.private_cidrs
  public_sn_count  = 2
  private_sn_count = 2
  azs              = local.azs
  db_subnet_group  = false
  name_tag         = "VPC-1"
  env_tag          = "DEV"
}

resource "aws_ssm_parameter" "test" {
  name = "/test/network/public-subnet"
  description = "Public Subnet Id"
  type = "SecureString"
  value = join(",", module.vpc-1.public_subnet_id)
}