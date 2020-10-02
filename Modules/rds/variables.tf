############################################################
####    Variables used for Aurora-MySQL RDS resource    ####
############################################################
variable "db_identifier" {}
variable "allocated_storage" {}
variable "storage_type" {}
variable "engine_version" {}
variable "instance_class" {}
variable "availability_zone" {}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "db_tags" {}
variable "db_subnetgrp_name" {}
variable "db_subnetgrp_tags" {}
variable "db_secgrp_name" {}
variable "vpc_cidr_block" {}
variable "vpc_id" {}
variable "subnet_prv_a" {}
variable "subnet_prv_b" {}
variable "db_secgrp_tag" {}
variable "bkup_retention" {}
variable "port" {}
variable "engine" {}
