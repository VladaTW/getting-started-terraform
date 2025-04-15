###############################################################################
##################################  DATA  #####################################
###############################################################################

data "aws_availability_zones" "available" {
  state = "available"
  # name = "eu-west-2a"
}

##################################################################################
##################################   RESOURCES   #################################
##################################################################################

# NETWORKING #
resource "aws_vpc" "app" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    # Name = "${var.prefix}-vpc"
    Name = format("%s-%s-vpc", var.prefix, var.region)

  }

}

resource "aws_internet_gateway" "app" {
  vpc_id = aws_vpc.app.id
  tags = {
    Name = format("%s-%s-gateway", var.prefix, var.region)
  }

}

## SUBNETS ##
resource "aws_subnet" "public_subnet1" {
  # count = 2
  cidr_block              = var.vpc_public_subnets_cidr_block[0]
  vpc_id                  = aws_vpc.app.id
  map_public_ip_on_launch = true
  # availability_zone       = data.aws_availability_zone.available.name[0]
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = format("%s-%s-subnet%d", var.prefix, var.region, 1)
  }
}

resource "aws_subnet" "public_subnet2" {
  # count = 2
  cidr_block              = var.vpc_public_subnets_cidr_block[1]
  vpc_id                  = aws_vpc.app.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = format("%s-%s-subnet%d", var.prefix, var.region, 2)
  }
}

# ROUTING #
resource "aws_route_table" "app" {
  vpc_id = aws_vpc.app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app.id
  }
  tags = {
    Name = format("%s-%s-route-table", var.prefix, var.region)
  }
}

resource "aws_route_table_association" "app_subnet1" {
  # subnet_id      = aws_subnet.public_subnet1[0].id
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.app.id
}

# SECURITY GROUPS #
# Nginx security group 
resource "aws_security_group" "nginx_sg" {
  name   = "nginx_sg"
  vpc_id = aws_vpc.app.id

  tags = {
    Name = format("%s-%s-security-group", var.prefix, var.region)
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALB security group
resource "aws_security_group" "alb_sg" {
  name   = "nginx_alb_sg"
  vpc_id = aws_vpc.app.id

  tags = {
    Name = format("%s-%s-alb-security-group", var.prefix, var.region)
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
