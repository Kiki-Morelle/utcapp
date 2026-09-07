provider "aws" {
  region = var.aws_region
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
  source = "../../../modules/security"
  vpc_id = module.networking.vpc_id
  my_ip  = "129.0.60.24/32"
}

module "compute" {
  source             = "../../../modules/compute"
  private_subnet_ids = module.networking.private_app_subnet_ids
  ec2_sg_id          = module.security.ec2_sg_id
  ami_id             = "ami-002db1d61667182d2" # your region’s Amazon Linux or Ubuntu AMI
  instance_type      = "t3.micro"
}
