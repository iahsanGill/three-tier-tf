# Internet Gateway
resource "aws_internet_gateway" "three-tier-igw" {
  tags = {
    Name = "${var.project_name}-igw"
  }
  vpc_id = aws_vpc.three-tier-vpc.id
}
