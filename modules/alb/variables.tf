variable "alb_name" {
  description = "The name of the loadbalancer"
  default = "default"
}

variable "environment" {
  description = "The environment name"
}

variable "public_subnet_ids" {
  description = "The list of public subnet ids to place the loadbalancer into."
  type = "list"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "deregistration_delay" {
  description = "The default deregistration delay."
  default = "300"
}

variable "health_check_path" {
  description = "The default health check path"
  default = "/"
}

variable "allow_cidr_block" {
  description = "The specific cidr block that is allowed to access the loadbalancer."
  default = "0.0.0.0/0"
}
