variable "vpc_name" {}
variable "vpc-cidr-block" {}

variable "subnet-cidr-blocks" {
    description = "Input variable cidr block for Subnet"  
    #default = "10.0.3.0/24"  
    type = list(string)
}

variable "az" {
    description = "Availibility Zone"  
    type = list(string)
}

variable "subnet-tags" {
    description = "Subnet Tags"
    type = list(string)
}

variable "env-prefix" {}

