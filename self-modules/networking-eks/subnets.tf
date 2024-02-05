resource "aws_subnet" "public_subnet" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.azs[count.index]

  tags = {
    Name = "PUBLIC-SN-${count.index + 1}"
    Environment = var.env_tag
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "PRIVATE-SN-${count.index + 1}"
    Environment = var.env_tag
  }
}

resource "aws_db_subnet_group" "db_subnetgroup" {
  count      = var.db_subnet_group == true ? 1 : 0
  name       = "db_subnetgroup"
  subnet_ids = aws_subnet.private_subnet.*.id

  tags = {
    Name = "db_subnetgroup"
    Environment = var.env_tag
  }
}