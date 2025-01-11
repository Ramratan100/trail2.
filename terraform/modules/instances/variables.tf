variable "bastion_ami" {
  description = "AMI for Bastion host"
  type        = string
}

variable "mysql_ami" {
  description = "AMI for MySQL server"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for Bastion host"
  type        = string
}

variable "mysql_instance_type" {
  description = "Instance type for MySQL server"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "public_subnet_web" {
  description = "Public subnet ID for Bastion host"
  type        = string
}

variable "private_subnet_database" {
  description = "Private subnet ID for MySQL server"
  type        = string
}

variable "vpc_security_group_mysql" {
  type        = list(string)
}

variable "vpc_security_group_bastion" {
  type        = list(string)
}

variable "Bastion_Host_name" {
  default     = "Bastion-Host"
  type        = string
}

variable "MySQL_Instance_name" {
  default     = "MySQL-Instance"
  type        = string
}
