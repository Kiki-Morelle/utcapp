variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "ec2_sg_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
}

variable "auto_scaling_group_name" {
  description = "Name of the auto scaling group"
  type        = string
}



variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name for EC2"
}
