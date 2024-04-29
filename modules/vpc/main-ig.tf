# Internet Gateway
resource "aws_internet_gateway" "three_tier_igw" {
  tags = {
    Name = "three-tier-igw"
  }
  vpc_id = aws_vpc.three-tier-vpc.id
}
