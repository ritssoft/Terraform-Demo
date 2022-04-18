variable "vpc_name" {}
variable "vpc-cidr-block" {}

variable "subnet-cidr-blocks" {}
variable "az" {}

variable "subnet-tags" {
    description = "Subnet Tags"
    type = list(string)
}

variable "env-prefix" {}
variable "instance_type" {}
variable "public_key_location" {}
#svariable "subnet_id" {}
variable "key_name" {}
variable "vm_name" {}
