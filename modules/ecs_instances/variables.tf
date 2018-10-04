variable "environment" {
  description = "The environment name"
}

variable "aws_ami" {
  description = "The AWS ami id to use"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "cluster" {
  description = "The name of the cluster"
}

variable "instance_group" {
  description = "The name of the instances you want grouped"
  default = "default"
}

variable "instance_type" {
  description = "The size of the AWS instance to use."
  default = "t2.micro"
}

# variable "cloudwatch_prefix" {
#   description = "To keep from having all logs merged we use a prefix"
#   default = ""
# }

variable "max_size" {
  description = "The maximum number of nodes in the cluster"
  default = 1
}

variable "min_size" {
  description = "The minimum number of nodes in the cluster"
  default = 1
}

variable "desired_capacity" {
  description = "The desired capacity of the cluster"
  default = 1
}

variable "iam_instance_profile_id" {
  description = "The id of the instance profile to use for the instances"
}

variable "load_balancers" {
  description = "The load balancers to tie to the instances if you are not using an ALB"
  type = "list"
  default = []
}

variable "private_subnet_ids" {
  description = "The list of private subnets to place the instances into."
  type = "list"
}

variable "depends_id" {
  description = "The workaround to make sure we wait for the NAT gateway to complete before provisioning the instances."
}

variable "key_name" {
  description = "SSH key name to be used"
}

variable "custom_userdata" {
  description = "Inject extra commands to make instances compliant on boot for the job."
  default = ""
}

variable "ecs_config" {
  description = "Specify the ecs config or obtain from S3 via command aws s3 cp s3://some-bucket/ecs.config /etc/ecs/ecs.config"
  default = "echo '' > /etc/ecs/ecs.config"
}

variable "ecs_logging" {
  description = "Add logging options to the ECS that the docker containers can use."
  default = "[\"json-file\",\"awslogs\"]"
}
