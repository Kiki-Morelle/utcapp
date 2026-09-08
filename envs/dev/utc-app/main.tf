provider "aws" {
  region = var.aws_region
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic to notify on ASG events"
  type        = string
  default     = null
}

module "networking" {
  source    = "../../../modules/network"
  aws_region = var.aws_region
  vpc_cidr  = var.vpc_cidr

  public_subnet_cidrs      = ["10.30.0.0/26", "10.30.0.64/26"]
  private_app_subnet_cidrs = ["10.30.0.128/26", "10.30.0.192/26"]
  private_db_subnet_cidrs  = ["10.30.1.0/26", "10.30.1.64/26"]
}

module "security" {
  source             = "../../../modules/security"
  vpc_id             = module.networking.vpc_id
  my_ip              = "129.0.60.24/32"
  private_subnet_ids = module.networking.private_app_subnet_ids
}

module "compute" {
  source             = "../../../modules/compute"
  private_subnet_ids = module.networking.private_app_subnet_ids
  ec2_sg_id          = module.security.ec2_sg_id
  ami_id             = "ami-002db1d61667182d2" # your region’s Amazon Linux or Ubuntu AMI
  instance_type      = "t3.micro"
 

  # Required arguments for launch template and auto scaling group
  launch_template_name      = "app-launch-template"
  auto_scaling_group_name   = "app-auto-scaling-group"
  instance_profile_name     = module.iam.ec2_instance_profile_name
}



module "storage" {
  source             = "../../../modules/storage"
  s3_bucket_name     = "my-app-bucket-12345-morelle-utcapp"
  private_subnet_ids = module.networking.private_app_subnet_ids
  efs_sg_id          = module.security.efs_sg_id
}

module "iam" {
  source = "../../../modules/iam"
}

module "notifications" {
  source                 = "../../../modules/notifications"
  auto_scaling_group_name = module.compute.app_asg_name
  sns_topic_arn           = var.sns_topic_arn
}

module "monitoring" {
  source                 = "../../../modules/monitoring"
  auto_scaling_group_name = module.compute.app_asg_name
  sns_topic_arn          = module.notifications.sns_topic_arn
}

