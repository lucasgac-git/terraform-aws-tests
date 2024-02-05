locals {
  vpc_cidr      = "10.125.0.0/16"
  public_cidrs  = ["10.125.1.0/24"]
  private_cidrs = []
  azs           = ["sa-east-1a"]
}