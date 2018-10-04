variable "vpc_cidr" {
  description = "VPC cidr block. Ex. 10.0.0.0/16"
}

variable "environment" {
  description = "The name of the environment"
}

variable "destination_cidr_block" {
  description = "Specify all traffic to be routed either through an Internet Gateway to access the internet"
  default = "0.0.0.0/0"
}

variable "private_subnet_cidrs" {
  description = "List of private cidrs. Need one per availability zone."
  type = "list"
}

variable "public_subnet_cidrs" {
  description = "List of public cidrs. Need one per availability zone."
  type = "list"
}

variable "availability_zones" {
  description = "List of availability zones you want to use."
  type = "list"
}

variable "depends_id" {}
