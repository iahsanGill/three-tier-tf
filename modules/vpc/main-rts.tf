# Create a Route  Table for the Web tier
resource "aws_route_table" "three-tier-web-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id
  tags = {
    Name = "${var.project_name}-web-rt"
  }
  route {
    cidr_block = local.all_ips
    gateway_id = aws_internet_gateway.three-tier-igw.id
  }
}

resource "aws_route_table" "three-tier-app-rt" {
  count = length(aws_nat_gateway.three-tier-natgws)

  vpc_id = aws_vpc.three-tier-vpc.id
  tags = {
    Name = "${var.project_name}-app-rt-${count.index + 1}"
  }

  route {
    cidr_block = local.all_ips
    gateway_id = aws_nat_gateway.three-tier-natgws[count.index].id
  }
}

resource "aws_route_table_association" "public-rt-associations" {
  count = local.public_subnets_count

  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.three-tier-web-rt.id
}

resource "aws_route_table_association" "private-rt-associations" {
  count = local.private_subnets_count

  subnet_id      = aws_subnet.private-subnets[count.index].id
  route_table_id = aws_route_table.three-tier-app-rt.id
}



