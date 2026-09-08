output "ec2_sg_id" {
  description = "EC2 security group ID"
  value       = aws_security_group.ec2_sg.id
}

output "efs_sg_id" {
  value       = aws_security_group.efs_sg.id
  description = "EFS security group ID"
}


