resource "aws_s3_bucket" "app_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "app-s3-bucket"
  }
}


resource "aws_efs_file_system" "app_efs" {
  creation_token = "app-efs"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "app-efs"
  }
}

resource "aws_efs_mount_target" "efs_mt" {
  for_each = toset(var.private_subnet_ids)

  file_system_id  = aws_efs_file_system.app_efs.id
  subnet_id       = each.value
  security_groups = [var.efs_sg_id]
}
