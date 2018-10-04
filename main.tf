provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "modules/vpc"

  # cidr is the variable used in vpc module and is set to variable vpc_cidr here
  cidr = "${var.vpc_cidr}"
  environment = "${var.environment}"

}

resource "aws_key_pair" "ecs" {
  key_name = "ecs-key-${var.environment}"
  public_key = "${file("files/mykey.pub")}"
}

variable "vpc_cidr" {}
variable "environment" {}

