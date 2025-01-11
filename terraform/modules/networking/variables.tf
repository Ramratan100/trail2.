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

variable "Database_VPC_name" {
  default     = "Database-VPC"
  type        = string
}

variable "Database_IGW_name" {
  default     = "Database-IGW"
  type        = string
}

variable "Public_Subnet_Web_name" {
  default     = "Public-Subnet-Web"
  type        = string
}

variable "Public_Route_Table_name" {
  default     = "Public-Route-Table"
  type        = string
}

variable "Private_Subnet_Database_name" {
  default     = "Private-Subnet-Database"
  type        = string
}

variable "NAT_Gateway_EIP_name" {
  default     = "NAT-Gateway-EIP"
  type        = string
}

variable "NAT_Gateway_name" {
  default     = "NAT-Gateway"
  type        = string
}

variable "Private_Route_Table_Database_name" {
  default     = "Private-Route-Table-Database"
  type        = string
}

variable "Master_Database_VPC_Peering_name" {
  default     = "Master-Database-VPC-Peering"
  type        = string
}
