
###  Create the VPC for our Network  ###

resource "aws_vpc" "kem_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

###  Create Internet Gateway to be used by the Public Subnets in our VPC  ###

resource "aws_internet_gateway" "kem_igw" {
  vpc_id = aws_vpc.kem_vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

###  Create a Route Table per Public subnet which will use our Internet Gateway  ###

resource "aws_route_table" "kem_pub_rtb" {
  vpc_id = aws_vpc.kem_vpc.id
  count  = var.rtb_count
  route {
    cidr_block = var.pub_rtb_rt_cidrblk
    gateway_id = aws_internet_gateway.kem_igw.id
  }

  tags = {
    Name = "${var.vpc_name}-${var.pub_rtb_tag}-${var.zones[count.index]}"
  }
}


###  Create a Route Table with no route access to the internet per Private subnet  ###

resource "aws_route_table" "kem_priv_rtb" {
  vpc_id = aws_vpc.kem_vpc.id
  count  = var.rtb_count
  
  tags = {
    Name = "${var.vpc_name}-${var.prv_rtb_tag}-${var.zones[count.index]}"
  }
}

###  Create Private Subnets and Public Subnets per AZ for our Application Servers, RDS Database and Application Load Balancers  ###

resource "aws_subnet" "kem_subnet" {
  vpc_id            = aws_vpc.kem_vpc.id
  cidr_block        = var.subnet_cidr_block[count.index]
  availability_zone = "${var.region}${var.zones[count.index]}"
  count             = length(var.subnet_cidr_block)  // 4 Subnets

  tags = {
    Name = "${var.vpc_name}-sub-${var.sub_type[count.index]}-${var.zones[count.index]}"
  }
}

###  Associate our Private Subnets and Public Subnets to the relevant Route Tables  ###

resource "aws_route_table_association" "kem_rtbass_prv" {
  count          = length(aws_route_table.kem_priv_rtb[*].id)
  subnet_id      = local.prv_subnet[count.index]
  route_table_id = element(aws_route_table.kem_priv_rtb[*].id, count.index)
}

resource "aws_route_table_association" "kem_rtbass_pub" {
  count          = length(aws_route_table.kem_pub_rtb[*].id)
  subnet_id      = local.pub_subnet[count.index]
  route_table_id = element(aws_route_table.kem_pub_rtb[*].id, count.index)
}

locals {
  prv_subnet = [aws_subnet.kem_subnet[0].id, aws_subnet.kem_subnet[1].id]
  pub_subnet = [aws_subnet.kem_subnet[2].id, aws_subnet.kem_subnet[3].id]
}
