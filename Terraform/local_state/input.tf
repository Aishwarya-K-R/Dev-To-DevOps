variable "region" {
  description = "AWS region where resources will be created"
}

variable "ami_value" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type_value" {
  description = "EC2 instance type"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
}

