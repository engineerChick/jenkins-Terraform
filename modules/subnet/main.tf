resource "aws_subnet" "private" {
  vpc_id = "${var.vpc_id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block = "${element(var.cidrs, count.index)}"
  count = "${length(var.cidrs)}"

  tags {
      Name = "${var.name_private_${element(var.availability_zones, count.index)}}"
      Environment = "${var.environment}"
  }
}

resource "aws_subnet" "public" {
  vpc_id = "${var.vpc_id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block = "${element(var.cidrs, count.index)}"
  count = "${length(var.cidrs)}"

  tags {
      Name = "${var.name_public_${element(var.availability_zones, count.index)}}"
      Environment = "${var.environment}"
  }
}

