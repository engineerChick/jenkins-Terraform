environment = "dev"

name = "test"

vpc_cidr = "10.0.0.0/16"

availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

private_subnet_cidrs = ["10.0.61.0/24", "10.0.62.0/24", "10.0.63.0/24"]

public_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]

max_size = 1

min_size = 1

desired_capacity = 1

instance_type = "t2.micro"

ecs_aws_ami = "ami-059eeca93cf09eebd"
