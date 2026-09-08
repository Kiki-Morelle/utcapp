variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EFS mount targets"
}

variable "efs_sg_id" {
  type        = string
  description = "Security group ID for EFS"
}
