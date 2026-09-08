output "s3_bucket_name" {
  value       = aws_s3_bucket.app_bucket.bucket
  description = "S3 bucket name"
}

output "efs_id" {
  value       = aws_efs_file_system.app_efs.id
  description = "EFS filesystem ID"
}
