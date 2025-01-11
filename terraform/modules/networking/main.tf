# VPC Configuration
resource "aws_vpc" "database_vpc" {
  cidr_block           = var.database_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
 
  tags = {
    Name = "Database-VPC"
  }
}
 
# Internet Gateway
resource "aws_internet_gateway" "database_igw" {
  vpc_id = aws_vpc.database_vpc.id
 
  tags = {
    Name = "Database-IGW"
  }
}
 
# Public Subnet
resource "aws_subnet" "public_subnet_web" {
  vpc_id                  = aws_vpc.database_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true
 
  tags = {
    Name = "Public-Subnet-Web"
  }
}
 
# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.database_vpc.id
 
  tags = {
    Name = "Public-Route-Table"
  }
}
 
# Public Route: Internet Gateway
resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.database_igw.id
}
 
# Associate Public Route Table with Public Subnet
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_web.id
  route_table_id = aws_route_table.public_route_table.id
}
 
# Private Subnet
resource "aws_subnet" "private_subnet_database" {
  vpc_id                  = aws_vpc.database_vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = false
 
  tags = {
    Name = "Private-Subnet-Database"
  }
}
 
# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
 
  tags = {
    Name = "NAT-Gateway-EIP"
  }
}
 
# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_web.id
 
  tags = {
    Name = "NAT-Gateway"
  }
}
 
# Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.database_vpc.id
 
  tags = {
    Name = "Private-Route-Table-Database"
  }
}
 
# Private Route to Internet via NAT Gateway
resource "aws_route" "private_to_internet" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
 
# Associate Private Route Table with Private Subnet
resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet_database.id
  route_table_id = aws_route_table.private_route_table.id
}
 
# VPC Peering Connection
resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = var.master_vpc_id
  peer_vpc_id   = aws_vpc.database_vpc.id
  auto_accept   = true
 
  tags = {
    Name = "Master-Database-VPC-Peering"
  }
}
 
# Route Table for Master VPC to Database VPC
resource "aws_route" "master_to_database" {
  route_table_id         = var.master_route_table_id
  destination_cidr_block = aws_vpc.database_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
 
# Route Table for Database VPC to Master VPC
resource "aws_route" "database_to_master" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = var.master_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
