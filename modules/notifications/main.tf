resource "aws_sns_topic" "alerts" {
  name = "app-alerts-topic"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "sorellebadelsorelle@gmail.com"   # replace with your email
}

