#Elastic ip
resource "aws_eip" "three-tier-nat-eips" {
  count = var.num_nat_gateways
  tags = {
    Name = "${var.project_name}-nat-${count.index + 1}-eip"
  }
}
