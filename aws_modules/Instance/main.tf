resource "aws_key_pair" "ssh-key" {
  key_name = var.key_name
  public_key = var.public_key_location
  #public_key = "${file(var.public_key_location)}"  
}

resource "aws_instance" "ec2-instance" {
    ami = data.aws_ami.latest-ubuntu-image.image_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    #subnet_id = aws_subnet.subnet1.id
    #security_groups = aws_security_group
    #vpc_security_group_ids = [aws_default_security_group.sg01.id]
    availability_zone = var.az
    associate_public_ip_address = "true"
    key_name = aws_key_pair.ssh-key.key_name
    tags = {
        Name = "${var.env-prefix}-${var.vm_name}"
    }
}

data "aws_ami" "latest-ubuntu-image" {
  most_recent = true
  owners = ["099720109477"]
  
  filter {
    name = "description"
    values = ["*Ubuntu*20*amd64*"]
  }
}
