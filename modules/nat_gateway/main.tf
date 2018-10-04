resource "aws_nat_gateway" "nat" {
  count = "${var.subnet_count}"
  subnet_id = "${element(var.subnet_ids, count.index)}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
}

resource "aws_eip" "nat" {
  vpc = true
  count = "${var.subnet_count}"
}
