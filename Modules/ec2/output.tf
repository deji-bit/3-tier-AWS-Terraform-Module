#########################################
####    Outputs from EC2 resource    ####
#########################################
output "appserver_sec_group_id" {
  value = aws_security_group.appserver_secgrp.*.id
}

output "app_server_ip" {
  value = aws_instance.app_server.*.private_ip
}


output "app_server_id" {
  value = aws_instance.app_server.*.id
}
