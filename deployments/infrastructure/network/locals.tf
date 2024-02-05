locals {
  vpc_cidr      = "10.124.0.0/16"
  public_cidrs  = ["10.124.1.0/24", "10.124.2.0/24"]
  private_cidrs = ["10.124.3.0/24", "10.124.4.0/24"]
  azs           = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]
}