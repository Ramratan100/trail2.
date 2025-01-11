# security_groups.tf

resource "aws_security_group" "bastion_sg" {
  vpc_id = var.vpc_id

  # Loop through ingress rules defined in variable
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.bastion_security_group_name
  }
}

resource "aws_security_group" "mysql_sg" {
  vpc_id = var.vpc_id

  # Loop through ingress rules defined in variable for MySQL SG
  dynamic "ingress" {
    for_each = var.mysql_ingress_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.mysql_security_group_name
  }
}
