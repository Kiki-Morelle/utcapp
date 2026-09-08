resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws/ec2/app"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when CPU exceeds 70%"
  dimensions = {
    AutoScalingGroupName = var.auto_scaling_group_name
  }
  actions_enabled     = true
  alarm_actions       = [var.sns_topic_arn]
}

