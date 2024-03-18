variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = ["10.0.1.0/24"]
}

variable "instance_type" {
  default = "i3.medium"
}