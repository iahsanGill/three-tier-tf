output "asg_sg_id" {
  value       = aws_security_group.ec2-asg-sg.id
  description = "The id of security group of auto-scaling group"
}

output "alb_sg_id" {
  value       = aws_security_group.ec2-alb-sg.id
  description = "The id of security group of application load balancer"
}
