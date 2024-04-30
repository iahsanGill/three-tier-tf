module "vpc_three_tier" {
  source = "../modules/vpc"

  project_name       = var.project_name
  region             = var.region
  vpc_cidr_block     = var.vpc_cidr_block
  availability_zones = var.availability_zones
}
