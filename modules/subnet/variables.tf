variable "name" {
  description = "Name of the subnet"
}

variable "environment" {
  description = "The name of the environement"
}

variable "cidrs" {
  description = "List of cidrs. One per availability zone."
  type = "list"
}

variable "availability_zones" {
  description = "List of availability zones you have selected."
  type = "list"
}

variable "vpc_id" {
  description = "The VPC id you want to place your subnets into."
}
