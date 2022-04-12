resource "aws_instance" "ec2-instance" {
    ami = data.aws_ami.latest-ubuntu-image.image_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet1.id
    #security_groups = aws_security_group
    #vpc_security_group_ids = [aws_default_security_group.sg01.id]
    availability_zone = var.az[0]
    associate_public_ip_address = "true"
    key_name = aws_key_pair.ssh-key.key_name
    tags = {
        Name = "${var.env-prefix}-VM01-Docker"
    }
   
    user_data = <<EOF
              #!/bin/bash
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
              echo \
                "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
              sudo apt-get update -y && sudo apt-get install -y docker
              sudo systemctl start docker
              sudo usermod -aG ubuntu
              docker run -p 8080:80 nginx              
            EOF 

}

output "public_ip" {
    value = aws_instance.ec2-instance.public_ip
    description = "The Public IP of the Server"
}

#output "security_groups" {
 #   value = aws_default_security_group.sg01
 #}

