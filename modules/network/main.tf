module "vpc" {
  source = "../vpc"

  cidr = "${var.vpc_cidr}"
  environment = "${var.environment}"
}

module "private_subnets" {
  source = "../subnet"

  name = "private_subnet_${var.environment}"
  enviroment = "${var.environment}"
  vpc_id = "${module.vpc.id}"
  cidrs = "${var.private_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"  
}

module "public_subnets" {
  source = "../subnet"

  name = "private_subnet_${var.environment}"
  enviroment = "${var.environment}"
  vpc_id = "${module.vpc.id}"
  cidrs = "${var.public_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
}

module "nat" {
  source = "../nat_gateway"

  subnet_ids = "${module.public_subnets.ids}"
  subnet_count = "${length(var.public_subnet_cidrs)}"  
}

resource "aws_route" "public_igw" {
  count = "${length(var.public_subnet_cidrs)}"
  route_table_id = "${element(module.public_subnets.route_table_ids, count.index)}"
  gateway_id = "${module.vpc.igw}"
  destination_cidr_block = "${var.destination_cidr_block}"
}

resource "aws_route" "private_nat" {
  count = "${length(var.private_subnet_cidrs)}"
  route_table_id = "${element(module.private_subnets.route_table_ids, count.index)}"
  nat_gateway_id = "${element(module.nat.ids, count.index)}"
  destination_cidr_block = "${var.destination_cidr_block}"
}

# NAT Gateways take a while to create. We need to make sure other dependency resources
# don't start until this is finished. The workaround for it is a null resource outlined
# here: https://github.com/hashicorp/terraform/issues/1178#issuecomment-207369534

resource "null_resource" "dummy_dependency" {
  depends_on = ["module.nat"]
}
