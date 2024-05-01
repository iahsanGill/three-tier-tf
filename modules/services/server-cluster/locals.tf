locals {
  all_ips      = "0.0.0.0/0"
  tcp_protocol = "tcp"
  any_protocol = "-1"

  lb_ingress_rules = [{
    port        = 80
    description = "Allow HTTP access"
    },
    {
      port        = 443
      description = "Allow HTTPS access"
    }
  ]
  ec2_ingress_rules = [{
    port        = 80
    description = "Allow HTTP access"
    },
    {
      port        = 443
      description = "Allow HTTPS access"
    },
    {
      port        = 22
      description = "Allow SSH access"
  }]

  egress_rules = [{
    port        = 0
    description = "Allow all Egress traffic"
  }]

}
