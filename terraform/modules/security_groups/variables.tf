# variables.tf

variable "vpc_id" {
  description = "The VPC ID to create the security groups in"
  type        = string
}

variable "bastion_subnet_cidr" {
  description = "The CIDR block of the Bastion host subnet"
  type        = string
}

variable "bastion_security_group_name" {
  description = "The name of the Bastion security group"
  type        = string
  default     = "Bastion-Security-Group"
}

variable "mysql_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "mysql_security_group_name" {
  description = "The name of the MySQL security group"
  type        = string
  default     = "MySQL-Security-Group"
}

variable "ingress_ports" {
  description = "A list of ingress ports and corresponding CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    { from_port = 80,  to_port = 80,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 22,  to_port = 22,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  ]
}

variable "mysql_ingress_ports" {
  description = "A list of ingress ports for MySQL security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    { from_port = 3306, to_port = 3306, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = -1, to_port = -1, protocol = "icmp", cidr_blocks = ["10.0.2.0/24"] }
  ]
}

