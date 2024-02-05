module "nginx" {
  source          = "../../../self-modules/compute"
  instance_type   = "t2.small"
  volume_size     = 8
  public_sg       = module.nginx-network.ssh_sg
  public_subnet   = module.nginx-network.public_subnet_id[0]
  name_tag        = "NGINX-1"
  key_name        = var.key_name
  public_key_path = var.public_key_path
}

module "nginx-network" {
  source = "../../../self-modules/networking-eks"
  vpc_cidr         = local.vpc_cidr
  public_cidrs     = local.public_cidrs
  private_cidrs    = local.private_cidrs
  public_sn_count  = 1
  private_sn_count = 0
  azs              = local.azs
  db_subnet_group  = false
  name_tag         = "VPC-2"
  env_tag          = "DEV"
}