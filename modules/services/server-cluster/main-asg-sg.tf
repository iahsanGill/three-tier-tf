resource "aws_security_group" "ec2-asg-sg" {
  name        = "${var.project_name}-${var.tier}-asg-sg"
  description = "Security Group for ${var.tier} EC2 host"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.ec2_ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = local.tcp_protocol
      cidr_blocks = var.ingress_cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.egress_rules

    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = local.any_protocol
      cidr_blocks = [local.all_ips]
    }
  }
}
