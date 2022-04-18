terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "terraform-s3-rits"
    key = "terraform/state-file-jenkins-pipeline.tfstate"
    region = "ap-southeast-2"
    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
  access_key = "${AWS_ACCESS_KEY_ID}"
  secret_key = "${AWS_SECRET_ACCESS_KEY}"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc-cidr-block

  azs             = [var.az]
  #private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = [var.subnet-cidr-blocks]

  #enable_nat_gateway = true
  #enable_vpn_gateway = true

  tags = {
    Name = "${var.env-prefix}-${var.vpc_name}"
    Terraform = "true"
    Environment = "dev"
  }
}

module "ec2-instance" {
  source = "./Instance"
  vm_name = var.vm_name
  instance_type = var.instance_type 
  az = var.az
  env-prefix = var.env-prefix 
  public_key_location = var.public_key_location 
  subnet_id = module.vpc.public_subnets[0]
  key_name = var.key_name
}
