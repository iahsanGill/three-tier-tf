resource "aws_security_group" "db-sg" {
  name        = "${var.project_name}-db-sg"
  description = "Security group for RDS instance"

  // Ingress rules
  dynamic "ingress" {
    for_each = local.rds_ingress_rules

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = local.tcp_protocol
      cidr_blocks = var.ingress_cidr_blocks
      description = ingress.value.description
    }
  }

  // Egress rules
  dynamic "egress" {
    for_each = local.egress_rules

    content {
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = local.any_protocol
      cidr_blocks = [local.all_ips]
      description = egress.value.description
    }
  }
}
