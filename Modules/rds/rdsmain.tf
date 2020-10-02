###  Provision our Aurora-MySQL RDS  ###

resource "aws_db_instance" "kem_db" {
  identifier           = var.db_identifier
  allocated_storage    = var.allocated_storage
  auto_minor_version_upgrade = "true"
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  availability_zone    = var.availability_zone
  db_subnet_group_name = aws_db_subnet_group.db_subgrp.name
  vpc_security_group_ids = [aws_security_group.db_secgrp.id]
  name                 = var.db_name
  username             = var.username
  password             = var.password
  port                 = var.port
  parameter_group_name = "default.mysql8.0"
  backup_retention_period = var.bkup_retention
  skip_final_snapshot  = "true"

  tags  = {
    Name = var.db_tags
   }
}


###   Define the Subnet Group for the RDS   ###

resource "aws_db_subnet_group" "db_subgrp" {
  name       = var.db_subnetgrp_name
  subnet_ids = [var.subnet_prv_a, var.subnet_prv_b]

  tags = {
    Name = var.db_subnetgrp_tags
  }
}

###  Create the Security Group to attach to our RDS  ###

resource "aws_security_group" "db_secgrp" {
  name   = var.db_secgrp_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.db_secgrp_tag
  }

  ###  ALL INBOUND

  # MySQL port
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "traffic allowed from sources within the network ONLY"
  }

  ###  ALL OUTBOUND 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow traffic to all destinations"
  }
}
