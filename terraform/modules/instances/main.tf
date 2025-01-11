resource "aws_instance" "bastion_host" {
  ami             = var.bastion_ami
  instance_type   = var.bastion_instance_type
  key_name        = var.key_name
  subnet_id       = var.public_subnet_web
  associate_public_ip_address = true
  vpc_security_group_ids      = var.vpc_security_group_bastion
  #[aws_security_group.bastion_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y python3 python3-pip
    sudo pip3 install boto3
  EOF

  tags = {
    Name = var.Bastion_Host_name
  }
}

resource "aws_instance" "mysql_instance" {
  ami             = var.mysql_ami
  instance_type   = var.mysql_instance_type
  key_name        = var.key_name
  subnet_id       = var.private_subnet_database
  vpc_security_group_ids = var.vpc_security_group_mysql
  #[aws_security_group.mysql_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y python3 python3-pip
    sudo pip3 install boto3
  EOF

  tags = {
    Name = var.MySQL_Instance_name
  }
}
