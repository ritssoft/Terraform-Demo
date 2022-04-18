variable "instance_type" {}
variable "az" {
    description = "Availibility Zone"  
    type = list(string)
}
variable "env-prefix" {}
variable "public_key_location" {}
variable "subnet_id" {}
variable "key_name" {}
variable "vm_name" {}

