# NatGW
resource "aws_nat_gateway" "three-tier-natgws" {
  count         = 1
  allocation_id = aws_eip.three-tier-nat-eips[count.index].id
  subnet_id     = aws_subnet.public-subnets[count.index].id

  tags = {
    Name = "${var.project_name}-natgw-${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.three-tier-igw]
}
