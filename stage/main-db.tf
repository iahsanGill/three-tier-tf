module "three-tier-db" {
  source = "../modules/data-store/db"

  project_name        = var.project_name
  subnets_ids         = slice(module.three-tier-test-vpc.private_subnet_ids, 2, 4)
  ingress_cidr_blocks = slice(module.three-tier-test-vpc.private_subnet_cidr_blocks, 0, 2)
  db_username         = var.db_username
  db_password         = var.db_password
}
