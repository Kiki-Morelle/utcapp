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



resource "aws_launch_template" "app_lt" {
  name_prefix   = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    security_groups = [var.ec2_sg_id]
  }

 
  iam_instance_profile {
    name = var.instance_profile_name
  }
}


resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

}


