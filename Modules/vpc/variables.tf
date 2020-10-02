####################################################
####    Variables used for Provider resource    ####
####################################################
variable "region" {}
variable "zones" {}

###################################################
####    Variables used for Network resource    ####
###################################################
variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "sub_type" {}
variable "pub_rtb_rt_cidrblk" {}
variable "rtb_count" {}
variable "pub_rtb_tag" {}
variable "prv_rtb_tag" {}
