variable "environment" {
  description = "The name of the environment"
}

variable "cluster" {
  description = "The name of the ECS cluster"
  default = "default"
}

variable "prefix" {
  description = "The prefix of the parameters the role should be able to access."
  default = ""
}
