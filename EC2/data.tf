data "aws_vpc" "existing-vpc" {
    id = aws_vpc.vpc.id
  }

resource "aws_subnet" "data-vnet" {
    vpc_id = data.aws_vpc.existing-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-2b"
    tags = {
      "Name" = "Terraform-Subnet2"
    }  
}