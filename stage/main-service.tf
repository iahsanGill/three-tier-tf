locals {
  all_ips                     = "0.0.0.0/0"
  frontend_tier               = "web"
  backend_tier                = "app"
  backend_vpc_zone_identifier = slice(module.three-tier-test-vpc.private_subnet_ids, 0, 2)
}

module "three-tier-test-web" {
  source = "../modules/services/server-cluster"

  project_name                = var.project_name
  tier                        = local.frontend_tier
  associate_public_ip_address = true
  load_balancer_listener_configuration = {
    port     = 443
    protocol = "HTTPS"
  }
  vpc_id              = module.three-tier-test-vpc.vpc_id
  vpc_zone_identifier = module.three-tier-test-vpc.public_subnet_ids
  ingress_cidr_blocks = [local.all_ips]

}

module "three-tier-test-app" {
  source = "../modules/services/server-cluster"

  project_name        = var.project_name
  tier                = local.backend_tier
  vpc_id              = module.three-tier-test-vpc.vpc_id
  vpc_zone_identifier = local.backend_vpc_zone_identifier
  ingress_cidr_blocks = module.three-tier-test-vpc.public_subnet_cidr_blocks
}
