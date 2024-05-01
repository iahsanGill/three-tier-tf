# VPC
resource "aws_vpc" "three-tier-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${var.project_name}-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public-subnets" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 4, count.index + 1)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-pub-sub-${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private-subnets" {
  count                   = length(var.availability_zones) * 2
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 4, count.index + local.num_public_subnets + 1)
  availability_zone       = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-pvt-sub-${count.index + 1}"
  }
}
