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

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for ALB"
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 zone ID"
}

variable "domain_name" {
  type        = string
  description = "Domain name for ALB DNS record"
}
