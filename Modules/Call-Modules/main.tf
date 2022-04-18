module "ec2-vpc" {
  source = "../VPC"
  vpc_name = var.vpc_name
  vpc-cidr-block = var.vpc-cidr-block
  subnet-cidr-blocks = var.subnet-cidr-blocks
  az = var.az
  subnet-tags = var.subnet-tags
  env-prefix = var.env-prefix  
}

module "ec2-instance" {
  source = "../Instance"
  vm_name = var.vm_name
  instance_type = var.instance_type 
  az = var.az 
  env-prefix = var.env-prefix 
  public_key_location = var.public_key_location 
  subnet_id = module.ec2-vpc.subnet.id
  key_name = var.key_name
}
