#Elastic ip
resource "aws_eip" "three-tier-nat-eips" {
  count = 1
  tags = {
    Name = "${var.project_name}-nat-${count.index + 1}-eip"
  }
}
