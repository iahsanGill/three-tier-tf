# Create Load balancer - frontend tier
resource "aws_lb" "ec2-lb" {
  name               = "${var.project_name}-ec2-lb"
  internal           = true
  load_balancer_type = "application"

  security_groups = [aws_security_group.ec2-alb-sg.id]
  subnets         = [var.sub_1_id, var.sub_2_id]

  tags = {
    Environment = "${var.project_name}-ec2-lb"
  }
}

# Create Load Balancer Target Group - frontend tier
resource "aws_lb_target_group" "ec2-lb-tg" {
  name     = "${var.project_name}-ec2-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.three-tier-vpc.id

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

# Create Load Balancer listener - frontend tier
resource "aws_lb_listener" "ec2-lb-listener" {
  load_balancer_arn = aws_lb.ec2-lb.arn
  port              = 80
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}
