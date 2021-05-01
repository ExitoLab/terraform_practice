# //////////////////////////////
# VARIABLES
# //////////////////////////////

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The region of the aws account"
}

variable "vpc_cidr" {
  type    = string
  default = "172.16.0.0/16"
}

variable "subnet_cidr_1" {
  type        = string
  description = "Subnet cidr"
  default     = "172.16.0.0/24"
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

variable "private_key_path" {
  description = "Private key"
  type        = string
}

variable "ssh_key_name" {
  description = "ssh key name"
  type        = string
}

variable "public_key" {
  description = "public_key to the ec2 instance"
  type        = string
}