# USAGE

```
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

```

## Command to run

```
terraform init
terraform apply

```