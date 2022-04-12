resource "aws_vpc" "vpc" {
    cidr_block = var.vpc-cidr-block
    tags = {
        Name = "${var.env-prefix}-VPC"
    }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet-cidr-blocks[0]
  availability_zone = var.az[0]
  tags = {
    "Name" =  "${var.env-prefix}-${var.subnet-tags[0]}"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet-cidr-blocks[1]
  availability_zone = var.az[1]
  tags = {
    "Name" = "${var.env-prefix}-${var.subnet-tags[1]}"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet-cidr-blocks[2]
  availability_zone = var.az[2]
  tags = {
    "Name" = "${var.env-prefix}-${var.subnet-tags[2]}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.env-prefix}-igw"
  }
}

resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "${var.env-prefix}-main-rtb"
  }  
}

# Security groups rules are auto disabling so will use the default rules only.
/* 
resource "aws_default_security_group" "sg01" {
  vpc_id = aws_vpc.vpc.id
  #aws_default_security_group = aws_vpc.vpc.aws_default_security_group
  #name = "${var.env-prefix}-SecurityGroup"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.my-ip]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.internet-ip]
  }


  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.internet-ip]
    prefix_list_ids = []
  }   
}
 */
resource "aws_key_pair" "ssh-key" {
  key_name = "Terraform-SSH-Key"
  public_key = "${file(var.public_key_location)}"  
}

