variable "auto_scaling_group_name" {
  type        = string
  description = "Name of the Auto Scaling Group to monitor"
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN for alarm notifications"
}
