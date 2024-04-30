locals {
  all_ips               = "0.0.0.0/0"
  public_subnets_count  = length(aws_subnet.public-subnets)
  private_subnets_count = length(aws_subnet.private-subnets)
  nat_gateways_count    = length(aws_nat_gateway.three-tier-natgws)
}
