output "asg_sg_id" {
  value       = aws_security_group.web-asg-sg
  description = "The id of security group of auto-scaling group"
}
