resource "aws_lb" "ec2-lb" {
  name               = "${var.project_name}-${var.tier}-lb"
  internal           = true
  load_balancer_type = "application"

  security_groups = [aws_security_group.ec2-alb-sg.id]
  subnets         = var.vpc_zone_identifier

  tags = {
    Environment = "${var.project_name}-ec2-lb"
  }
}

resource "aws_lb_target_group" "ec2-lb-tg" {
  name     = "${var.project_name}-${var.tier}-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "ec2-lb-listener" {
  load_balancer_arn = aws_lb.ec2-lb.arn
  port              = var.load_balancer_listener_configuration.port
  protocol          = var.load_balancer_listener_configuration.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2-lb-tg.arn
  }
}


