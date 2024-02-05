output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "ssh_sg" {
  value = aws_security_group.ssh_sg.id
}

output "generalpurpose_sg" {
  value = aws_security_group.generalpurpose_sg.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.*.id
}
