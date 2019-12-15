resource "aws_subnet" "main" {
  vpc_id     = "${var.subnet_vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "Main"
  }
}
