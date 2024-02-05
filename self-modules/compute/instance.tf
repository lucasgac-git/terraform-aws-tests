resource "aws_instance" "webserver" {

  instance_type          = var.instance_type
  ami                    = data.aws_ami.server_ami.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnet
  key_name               = aws_key_pair.webserver_key.id
  user_data              = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.name_tag
    Environment  = "TEST"
  }
}

resource "aws_key_pair" "webserver_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}