resource "aws_launch_template" "ec2-launch-template" {
  name_prefix = "${var.project_name}-${var.tier}-lt"

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-${var.tier}-lt-instance"
    }
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    device_index                = 0
    delete_on_termination       = true
    security_groups             = [aws_security_group.ec2-asg-sg.id]
  }

  instance_type = var.instance_type
  image_id      = var.image_id

  user_data = base64encode(templatefile("${path.module}/user-data.sh", {}))
}

resource "aws_autoscaling_group" "ec2-asg" {
  name = "${var.project_name}-${var.tier}-asg"
  launch_template {
    id      = aws_launch_template.ec2-launch-template.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.vpc_zone_identifier

  target_group_arns = [aws_lb_target_group.ec2-lb-tg.arn]
  health_check_type = "ELB"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.tier}-asg-instance"
    propagate_at_launch = true
  }
}


