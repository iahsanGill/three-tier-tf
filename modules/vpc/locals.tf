locals {
  all_ips             = "0.0.0.0/0"
  num_public_subnets  = length(aws_subnet.public-subnets)
  num_private_subnets = length(aws_subnet.private-subnets)
  num_nat_gateways    = length(aws_nat_gateway.three-tier-natgws)
}
