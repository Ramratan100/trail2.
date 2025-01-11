output "mysql_subnet"{
    value = aws_subnet.private_subnet_database.id
}

output "bastion_subnet"{
    value = aws_subnet.public_subnet_web.id
}

output "vpc_id"{
    value= aws_vpc.database_vpc.id
}

output "database_vpc_id" {
  value = aws_vpc.database_vpc.id
}
output "vpc_peering_id" {
  value = aws_vpc_peering_connection.vpc_peering.id
}
