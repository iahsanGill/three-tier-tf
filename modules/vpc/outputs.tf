output "public_subnet_cidr_blocks" {
  value = aws_subnet.public-subnets
}

output "private_subnet_cidr_blocks" {
  value = aws_subnet.private-subnets
}
