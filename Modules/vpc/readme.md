# USAGE

```
provider "aws" {
  profile = "default"
  region = var.region
}

module "network" {
  source             = "../Modules/vpc"
  region             = var.region
  zones              = var.zones
  vpc_name           = var.vpc_name
  pub_rtb_rt_cidrblk = var.pub_rtb_rt_cidrblk
  vpc_cidr_block     = var.vpc_cidr_block
  sub_type           = var.sub_type
  subnet_cidr_block  = var.subnet_cidr_block
}

```

## Command to run

```
terraform init
terraform apply

```