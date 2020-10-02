######################################################################################################
###  This config file will spin up 2 app nodes - one in Subnet-a (kem-Node-1) and one in Subnet-b  ###
###  (kem-Node-2) for high availability. Both nodes will be attched to the same Security Group.    ###
###################################################################################################### 

resource "aws_instance" "app_server" {
  ami                    = var.server_image
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(local.subs, count.index)
  vpc_security_group_ids = [aws_security_group.appserver_secgrp.id]
  count                  = var.instance_count

  tags = {
    Name = element(var.instance_tag, count.index + 1)
  }
}

locals {
  subs = [var.subnet_prv_a, var.subnet_prv_b]
}


### Create the Security Group to attach to our Application Servers  ###

resource "aws_security_group" "appserver_secgrp" {
  name = var.app_secgrp_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.app_secgrp_tag

  }

  ###  ALL INBOUND

  # Application Load balancer port
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.vpc_cidr_block]
    description = "traffic allowed from sources within the network ONLY"
  }
  # MySQL port
  ingress {
    from_port   = var.mysql_port
    to_port     = var.mysql_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.vpc_cidr_block]
    description = "traffic allowed from sources within the network ONLY"
  }

  # SSH port
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ingress_protocol
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
