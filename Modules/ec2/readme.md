# USAGE

```
provider "aws" {
  region = var.region
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
  subnet_prv_a    = module.network.subnet_prv_a
  subnet_prv_b    = module.network.subnet_prv_b
}

```

## Command to run

```
terraform init

```