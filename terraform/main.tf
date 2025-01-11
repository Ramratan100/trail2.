provider "aws" {
  region = var.region
}



module "networking" {
  source                = "./modules/networking"
  az                    = var.az
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  master_vpc_id         = var.master_vpc_id
  database_vpc_cidr     = var.database_vpc_cidr
  master_route_table_id = var.master_route_table_id
  master_vpc_cidr       = var.master_vpc_cidr
}

module "security_groups" {
  source              = "./modules/security_groups"
  bastion_subnet_cidr = var.public_subnet_cidr
  mysql_subnet_cidr   = var.private_subnet_cidr
  vpc_id              = module.networking.vpc_id
}

module "instances" {
  source                     = "./modules/instances"
  bastion_ami                = var.bastion_ami
  mysql_ami                  = var.mysql_ami
  bastion_instance_type      = var.bastion_instance_type
  mysql_instance_type        = var.mysql_instance_type
  key_name                   = var.key_name
  vpc_security_group_bastion = [module.security_groups.bastion_host_sg]
  public_subnet_web          = module.networking.bastion_subnet
  private_subnet_database    = module.networking.mysql_subnet
  vpc_security_group_mysql   = [module.security_groups.mysql_sg]
}
