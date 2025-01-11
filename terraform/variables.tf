variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "database_vpc_cidr" {
  type    = string
}

variable "master_vpc_cidr" {
  #default = "172.31.0.0/16"
  type    = string
}

variable "master_route_table_id" {
  type    = string
}

variable "master_vpc_id" {
  description = "Master VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  type    = string
}

variable "private_subnet_cidr" {
  type    = string
}

variable "az" {
  type    = string
}

variable "bastion_subnet_cidr" {
  type    = string
}

variable "mysql_subnet_cidr" {
  type    = string
}

variable "bastion_ami" {
  type    = string
}

variable "mysql_ami" {
  type    = string
}

variable "bastion_instance_type" {
  type    = string
}

variable "mysql_instance_type" {
  type    = string
}

variable "key_name" {
  type    = string
}
