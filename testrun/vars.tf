####################################################
####    Variables used for Provider resource    ####
####################################################
variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "zones" {
  default = ["a","b","a","b"]
}


###################################################
####    Variables used for Network resource    ####
###################################################
variable "vpc_name" {
  default = "is-kem"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.158.18.64/26"
}

variable "subnet_cidr_block" {
  type    = list
  default = ["10.158.18.64/28", "10.158.18.80/28", "10.158.18.96/28", "10.158.18.112/28"]
}

variable "sub_type" {
  default = ["prv", "prv", "pub","pub"]
}

variable "pub_rtb_rt_cidrblk" {
  type = string
  default = "0.0.0.0/0"
}

variable "rtb_count" {
  type = string
  default = "2"
}

variable "pub_rtb_tag" {
  type = string
  default = "pub_rtb"
}

variable "prv_rtb_tag" {
  type = string
  default = "prv_rtb"
}


###############################################
####    Variables used for ALB resource    ####
###############################################

variable "alb_secgrp" {
  type    = string
  default = "app-lb-secgrp"
}

variable "alb_tg_name" {
  type    = string
  default = "kem-alb-targetgrp"
}

variable "alb_tg_tag" {
  type    = string
  default = "kem_target_grp"
}

variable "loadbal_secgrp_tag" {
  type    = string
  default = "kem-apploadbal-sg"
}

variable "healthchk-path-tg" {
  type    = string
  default = "/"
}


###############################################
####    Variables used for EC2 resource    ####
###############################################
variable "server_image" {
  type    = string
  default = "ami-09b89ad3c5769cca2"
}

variable "key_name" {
  type    = string
  default = "kemkey"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = string
  default = "2"
}

variable "instance_tag" {
  type    = list
  default = ["kem-Node-1", "kem-Node-2"]
}

variable "app_secgrp_name" {
  type    = string
  default = "appserver_security_group"

}

variable "app_secgrp_tag" {
  type    = string
  default = "kem-appserver-sg"
}

variable "http_port" {
  type = string
  default = 80
}

variable "mysql_port" {
  type = string
  default = 3306
}
variable "ssh_port" {
  type = string
  default = 22
}

variable "ingress_protocol" {
  type = string
  default = "tcp"
}


###############################################
####    Variables used for RDS resource    ####
###############################################
variable "storage_type" {
  type    = string
  default = "gp2"
}

variable "allocated_storage" {
  type = string
  default = 20
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_vers" {
  type    = string
  default = "8.0"
}

variable "db-az-a" {
  type    = string
  default = "eu-west-2a"
}

variable "db-az-b" {
  type    = string
  default = "eu-west-2b"
}

variable "db_subnetgrp_name" {
  type    = string
  default = "mysql_db_subgrp"
}

variable "db_name" {
  type    = string
  default = "kem_DB_APP"
}

variable "db_username" {
  type    = string
  default = "Dadmin"
}

variable "db_passwd" {
  type    = string
  default = "Dadminadm1n"
}

variable "bkup_retention" {
  type = string
  default = 7
}

variable "port" {
  type    = string
  default = 3306
}

variable "db_secgrp_name" {
  type    = string
  default = "mySQL-db-secgrp"
}

variable "db_secgrp_tag" {
  type    = string
  default = "kem-db-sg"
}

variable "db-inst-class" {
  type    = string
  default = "db.t2.micro" 
}

variable "db_identifier" {
  type    = string
  default = "kem-db"
}

################################################
####    Variables used for resource tags    ####
################################################
variable "kem-vpc-tag" {
  type    = string
  default = "vpc-kem"
}

variable "kem-igw-tag" {
  type    = string
  default = "igw-kem"
}

variable "kem-sub-tag-a" {
  type    = string
  default = "kem-subneta-priv"
}

variable "kem-sub-tag-b" {
  type    = string
  default = "kem-subnetb-priv"
}

variable "kem-sub-tag-c" {
  type    = string
  default = "kem-subnetc-pub"
}

variable "kem-sub-tag-d" {
  type    = string
  default = "kem-subnetd-pub"
}

variable "db_tags" {
  type    = string
  default = "kem_mySQL_db"
}

variable "db_subnetgrp_tags" {
  type    = string
  default = "kem-DB-subnet-group"
}
