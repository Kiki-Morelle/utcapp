resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnet_ids, 0)
  vpc_security_group_ids = [var.ec2_sg_id]

  tags = {
    Name = "app-server"
  }
}

data "http" "my_ip" {
  url = "https://ifconfig.me"
}



