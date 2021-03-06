resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr}"

  tags {
      Name = "${var.name}"
      Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "vpc" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
      Environment = "${var.environment}"
  }
}

