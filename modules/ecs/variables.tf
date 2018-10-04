variable "environment" {
  description = "The name of the environment"
}

variable "cluster" {
  description = "The name of the ECS cluster"
  default = "Jenkins Master"
}

variable "instance_group" {
  description = "The name of the instances that you consider as a group"
  default = "Jenkins Master"
}

variable "vpc_cidr" {
  description = "VPC cidr block."
}

variable "private_subnet_cidrs" {
  description = "List of private cidrs. You need one per availability zone."
  type = "list"
}

variable "availability_zones" {
  description = "List of availability zones you want."
  type = "list"
}

variable "load_balancers" {
  description = "The load balancers to couple to the instances"
  type = "list"
  default = []
}

variable "max_size" {
  description = "Maximum size of the nodes in a cluster"
}

variable "min_size" {
  description = "Minimum size of the nodes in the cluster"
}

variable "desired_capacity" {
  description = "The desired capacity of the cluster"
}

variable "key_name" {
  description = "The SSH key name to be used"
}

variable "instance_type" {
  description = "AWS instance type to use"
}

variable "ecs_aws_ami" {
  description = "The AWS ami id# to use for ECS. Find upto date ones http://cloud-images.ubuntu.com/locator/ec2/"
}

variable "custom_userdata" {
  description = "Instance template commands to be run on boot"
  default = ""
}

variable "ecs_config" {
  description = "Specify ecs configuration or get it from S3. Ex. aws s3 cp s3://your-bucket/ecs.config /etc/ecs/ecs.config"
  default = "echo '' > /etc/ecs/ecs.config"
}

variable "ecs_logging" {
  description = "Add logging option to ECS that the docker containers can use. Could also add fluentd as well."
  default = "[\"json-file\", \"awslogs\"]"
}

variable "cloudwatch_prefix" {
  description = "To avoid cloudwatch collision specify prefix. If you want merged into on log, omit."
  default = ""
}













