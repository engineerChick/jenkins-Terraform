variable "name" {
  description = "The name of your vpc"
  default = "Jenkins-Terraform"
}

variable "cidr" {
  description = "The VPC cidr block. Ex. 10.0.0.0/16"
  default = "10.0.0.0/16"
}

variable "environment" {
  description = "The environment name"
  default = "dev"
}

