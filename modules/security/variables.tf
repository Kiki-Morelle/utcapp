variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address for SSH access (e.g., 203.0.113.25/32)"
  type        = string
}
 



variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EFS ingress"
}
