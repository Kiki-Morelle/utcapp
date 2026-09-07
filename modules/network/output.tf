output "vpc_id" {
  value = aws_vpc.main.id
}


output "private_app_subnet_ids" {
  description = "IDs of private app subnets"
  value       = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id
  ]
}
