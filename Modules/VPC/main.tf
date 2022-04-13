resource "aws_vpc" "vpc" {
    cidr_block = var.vpc-cidr-block
    tags = {
        Name = "${var.env-prefix}-${var.vpc_name}"
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


