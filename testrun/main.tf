provider "aws" {
  region = var.region
}

module "network" {
  source             = "../Modules/vpc"
  region             = var.region
  zones              = var.zones
  vpc_name           = var.vpc_name
  rtb_count          = var.rtb_count
  pub_rtb_tag        = var.pub_rtb_tag
  prv_rtb_tag        = var.prv_rtb_tag
  pub_rtb_rt_cidrblk = var.pub_rtb_rt_cidrblk
  vpc_cidr_block     = var.vpc_cidr_block
  sub_type           = var.sub_type
  subnet_cidr_block  = var.subnet_cidr_block
 }

module "alb" {
  source             = "../Modules/alb"
  region             = var.region
  alb_tg_name        = var.alb_tg_name
  alb_tg_tag         = var.alb_tg_tag
  alb_secgrp         = var.alb_secgrp
  healthchk-path-tg  = var.healthchk-path-tg
  loadbal_secgrp_tag = var.loadbal_secgrp_tag
  vpc_id             = module.network.vpc_id
  kem_subnet_1       = module.network.kem_subnet_pub_a
  kem_subnet_2       = module.network.kem_subnet_pub_b
}

module "appnodes" {
  source          = "../Modules/ec2"
  server_image    = var.server_image
  instance_type   = var.instance_type
  key_name        = var.key_name
  instance_count  = var.instance_count
  instance_tag    = var.instance_tag
  vpc_id          = module.network.vpc_id
  app_secgrp_name = var.app_secgrp_name
  app_secgrp_tag  = var.app_secgrp_tag
  vpc_cidr_block  = var.vpc_cidr_block
  http_port       = var.http_port
  mysql_port      = var.mysql_port
  ssh_port        = var.ssh_port 
  ingress_protocol = var.ingress_protocol
  subnet_prv_a    = module.network.kem_subnet_prv_a
  subnet_prv_b    = module.network.kem_subnet_prv_b
}

module "dbnode" {
  source            = "../Modules/rds"
  db_identifier     = var.db_identifier
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_vers
  instance_class    = var.db-inst-class
  availability_zone = var.db-az-a
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_passwd
  port              = var.port
  bkup_retention    = var.bkup_retention
  db_tags           = var.db_tags
  db_subnetgrp_name = var.db_subnetgrp_name
  db_subnetgrp_tags = var.db_subnetgrp_tags
  db_secgrp_name    = var.db_secgrp_name
  db_secgrp_tag     = var.db_secgrp_tag
  vpc_cidr_block    = var.vpc_cidr_block
  vpc_id            = module.network.vpc_id
  subnet_prv_a      = module.network.kem_subnet_prv_a
  subnet_prv_b      = module.network.kem_subnet_prv_b
}
