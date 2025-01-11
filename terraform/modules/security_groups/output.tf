output "bastion_host_sg"{
value= aws_security_group.bastion_sg.id
}

output "mysql_sg"{

    value = aws_security_group.mysql_sg.id
}