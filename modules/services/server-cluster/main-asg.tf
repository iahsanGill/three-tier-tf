######### Create an EC2 Auto Scaling Group ############
resource "aws_autoscaling_group" "ec2-asg" {
  name                 = "${var.project_name}-ec2-asg"
  launch_configuration = aws_launch_configuration.ec2-lconfig.id
  vpc_zone_identifier  = [var.sub_1_id, var.sub_2_id]

  target_group_arns = [aws_lb_target_group.ec2-lb-tg.arn]
  health_check_type = "ELB"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = 2
}

###### Create a launch configuration for the EC2 instances #####
resource "aws_launch_configuration" "ec2-lconfig" {
  name_prefix     = "${var.project_name}-ec2-lconfig"
  image_id        = var.image_id
  instance_type   = var.instance_type
  key_name        = "${var.project_name}-ec2-asg-kp"
  security_groups = [aws_security_group.ec2-asg-sg.id]
  user_data       = templatefile("${path.module}/userdata.sh")

  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
    ignore_changes        = all
  }
}
