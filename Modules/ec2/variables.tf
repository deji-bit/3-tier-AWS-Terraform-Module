###############################################
####    Variables used for EC2 resource    ####
###############################################
variable "server_image" {}
variable "key_name" {}
variable "instance_type" {}
variable "instance_count" {}
variable "instance_tag" {}
variable "app_secgrp_name" {}
variable "app_secgrp_tag" {}
variable "vpc_id" {}
variable "http_port" {}
variable "mysql_port" {}
variable "ssh_port" {}
variable "ingress_protocol" {}
variable "vpc_cidr_block" {}
variable "subnet_prv_a" {}
variable "subnet_prv_b" {}
