locals {
  all_ips      = "0.0.0.0/0"
  tcp_protocol = "tcp"
  any_protocol = "-1"

  rds_ingress_rules = [{
    port        = 3306
    description = "Allow MySQL access"
  }]

  egress_rules = [{
    port        = 0
    description = "Allow all Egress traffic"
  }]
}
