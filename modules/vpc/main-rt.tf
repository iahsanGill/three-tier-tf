# Create a Route  Table for the Web tier
resource "aws_route_table" "three-tier-web-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id
  tags = {
    Name = "three-tier-web-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.three-tier-igw.id
  }
}

# Create a Route Table for the Application tier
resource "aws_route_table" "three-tier-app-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id
  tags = {
    Name = "three-tier-app-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.three-tier-natgw-01.id
  }
}

#Route table associations
resource "aws_route_table_association" "three-tier-rt-as-2" {
  subnet_id      = aws_subnet.three-tier-pub-sub-2.id
  route_table_id = aws_route_table.three-tier-web-rt.id
}

resource "aws_route_table_association" "three-tier-rt-as-3" {
  subnet_id      = aws_subnet.three-tier-pvt-sub-1.id
  route_table_id = aws_route_table.three-tier-app-rt.id
}
resource "aws_route_table_association" "three-tier-rt-as-4" {
  subnet_id      = aws_subnet.three-tier-pvt-sub-2.id
  route_table_id = aws_route_table.three-tier-app-rt.id
}

resource "aws_route_table_association" "three-tier-rt-as-5" {
  subnet_id      = aws_subnet.three-tier-pvt-sub-3.id
  route_table_id = aws_route_table.three-tier-app-rt.id
}
resource "aws_route_table_association" "three-tier-rt-as-6" {
  subnet_id      = aws_subnet.three-tier-pvt-sub-4.id
  route_table_id = aws_route_table.three-tier-app-rt.id
}

# Create an Elastic IP address for the NAT Gateway
resource "aws_eip" "three-tier-nat-eip" {}
