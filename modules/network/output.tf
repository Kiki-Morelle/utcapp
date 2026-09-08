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


output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.nat.id
  description = "ID of the NAT Gateway"
}
