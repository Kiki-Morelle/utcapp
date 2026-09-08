# Create the VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "utc-vpc"
  }
}

# Public subnets
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = { Name = "public-subnet-a" }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = { Name = "public-subnet-b" }
}

# Private app subnets
resource "aws_subnet" "private_app_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_app_subnet_cidrs[0]
  availability_zone = "${var.aws_region}a"

  tags = { Name = "private-app-subnet-a" }
}

resource "aws_subnet" "private_app_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_app_subnet_cidrs[1]
  availability_zone = "${var.aws_region}b"

  tags = { Name = "private-app-subnet-b" }
}

# Private DB subnets
resource "aws_subnet" "private_db_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet_cidrs[0]
  availability_zone = "${var.aws_region}a"

  tags = { Name = "private-db-subnet-a" }
}

resource "aws_subnet" "private_db_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet_cidrs[1]
  availability_zone = "${var.aws_region}b"

  tags = { Name = "private-db-subnet-b" }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "utc-igw" }
}

resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "nat-gateway"
  }
}
