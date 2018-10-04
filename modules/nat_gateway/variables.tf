variable "subnet_count" {
    description = "The count of subnets which has to be provided since it cannot be computed."
}

variable "subnet_ids" {
  description = "The public subnet ids to place a NAT into "
  type = "list"
}
