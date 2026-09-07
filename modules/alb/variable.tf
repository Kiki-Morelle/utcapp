variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for ALB"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "alb_sg_id" {
  type        = string
  description = "Security group for ALB"
}
