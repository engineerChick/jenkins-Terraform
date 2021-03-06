provider "aws" {
  region = "us-east-1"
}

module "ecs" {
  source = "modules/ecs"

  environment = "${var.environment}"
  cluster = "${var.environment}"
  cloudwatch_prefix = "${var.environment}"    # Check the ecs_instances module to see if you need to set this or not.
  vpc_cidr = "${var.vpc_cidr}"
  private_subnet_cidrs = "${var.private_subnet_cidrs}"
  public_subnet_cidrs = "${var.public_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
  max_size = "${var.max_size}"
  min_size = "${var.min_size}"
  desired_capacity = "${var.desired_capacity}"
  key_name = "${aws_key_pair.ecs.key_name}"
  instance_type = "${var.instance_type}"
  ecs_aws_ami = "${var.ecs_aws_ami}"
}

resource "aws_key_pair" "ecs" {
  key_name = "ecs-key-${var.environment}"
  public_key = "${file(mykey.pub)}"
}

variable "vpc_cidr" {}
variable "environment" {}
variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}
variable "instance_type" {}
variable "ecs_aws_ami" {}

variable "private_subnet_cidrs" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}

output "default_alb_target_group" {
    value = "${module.ecs.default_alb_target_group}"
}










