###   Provision the AWS Application Load Balancers  ###

resource "aws_lb" "appservers-alb" {
  name                       = "appservers-loadbal"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.lb_secgrp.id]
  subnets                    = [var.kem_subnet_1, var.kem_subnet_2]
  ip_address_type            = "ipv4"
  enable_deletion_protection = false

  tags = {
    Environment = "DEV"
  }
}

###  Create the Target Group for the Application Load Balancer  ###

resource "aws_lb_target_group" "appservers_lb_tg" {
  name     = var.alb_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled = true
    path    = var.healthchk-path-tg
    matcher = "200-299"
  }

  tags = {
    Name = var.alb_tg_tag
  }
}

###   Create the Listener for the Target Group   ###

resource "aws_lb_listener" "targetgrp_listnr" {
  load_balancer_arn = aws_lb.appservers-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.appservers_lb_tg.arn
  }
}

resource "aws_security_group" "lb_secgrp" {
  name   = var.alb_secgrp
  vpc_id = var.vpc_id

  tags = {
    Name = var.loadbal_secgrp_tag

  }

  ###  ALL INBOUND

  # WebUI HTTP Traffic port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "traffic allowed from all sources"
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