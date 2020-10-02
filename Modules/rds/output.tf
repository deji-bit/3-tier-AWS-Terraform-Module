#############################################
####    Outputs from Network resource    ####
#############################################

output "mysql_db_status" {
  value = aws_db_instance.kem_db.*.status
}
