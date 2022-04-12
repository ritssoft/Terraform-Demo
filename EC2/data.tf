data "aws_vpc" "existing-vpc" {
    id = aws_vpc.vpc.id
  }

data "aws_ami" "latest-ubuntu-image" {
  most_recent = true
  owners = ["099720109477"]
  
  filter {
    name = "description"
    values = ["*Ubuntu*20*amd64*"]
  }
}