#########################################
####    Outputs from ALB resource    ####
#########################################
output "loadbal_dns_name" {
  value = aws_lb.appservers-alb.*.dns_name
}

output "alb_sec_group_id" {
  value = aws_security_group.lb_secgrp.*.id
}
