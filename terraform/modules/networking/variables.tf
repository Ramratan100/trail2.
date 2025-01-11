variable "az" {
  description = "Availability zone"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}


variable "database_vpc_cidr" {
  description = "database cidr"
  type        = string
}

variable "master_vpc_id" {
  description = "master vpc id peering "
  type        = string
}

variable "master_route_table_id" {
  description = "master route id"
  type        = string
}

variable "master_vpc_cidr" {
  description = "master cidr"
  type        = string
}
