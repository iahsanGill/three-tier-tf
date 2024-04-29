resource "aws_security_group" "ec2-asg-sg" {
  name        = "${var.project_name}-ec2-asg-sg"
  description = "Security Group for EC2 Host"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = local.tcp_protocol
      cidr_blocks = [var.cidr_block]
    }
  }

  dynamic "egress" {
    for_each = local.egress_rules

    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = local.any_protocol
      cidr_blocks = [var.cidr_block]

    }
  }
}
