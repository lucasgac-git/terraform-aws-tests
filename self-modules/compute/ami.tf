# AMI SEARCH
# aws ec2 describe-images --image-ids ami-0fb4cf3a99aa89f72 --region sa-east-1

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20231207"]

  }
}