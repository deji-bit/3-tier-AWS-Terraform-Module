# USAGE

```
provider "aws" {
  region = var.region
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
  subnet_prv_a      = module.network.subnet_prv_a
  subnet_prv_b      = module.network.subnet_prv_b
}


```

## Command to run

```
terraform init
terraform apply

```