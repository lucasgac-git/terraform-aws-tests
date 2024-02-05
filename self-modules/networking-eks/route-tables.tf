resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "PUBLIC-ROUTE-TABLE"
    Environment = var.env_tag
  }
}

resource "aws_route" "default_rt" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id

  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_route_table_association" "public_association" {
  count = var.public_sn_count
  subnet_id = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_default_route_table" "private_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name = "PRIVATE-RT"
    Environment = var.env_tag
  }
}