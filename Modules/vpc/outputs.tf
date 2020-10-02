#############################################
####    Outputs from Network resource    ####
#############################################

output "vpc_id" {
  value = aws_vpc.kem_vpc.id
}

output "kem_subnet" {
  value = aws_subnet.kem_subnet.*.id
}

output "kem_subnet_prv_a" {
  value = aws_subnet.kem_subnet[0].id
}
output "kem_subnet_prv_b" {
  value = aws_subnet.kem_subnet[1].id
}

output "kem_subnet_pub_a" {
  value = aws_subnet.kem_subnet[2].id
}

output "kem_subnet_pub_b" {
  value = aws_subnet.kem_subnet[3].id
}
