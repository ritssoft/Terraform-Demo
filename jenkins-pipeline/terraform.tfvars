vm_name = "VM01-Jenkins-Pipeline"
vpc_name = "VPC-Jenkins-Pipeline"
vpc-cidr-block = "10.0.0.0/16"
subnet-cidr-blocks = "10.0.20.0/24"
az = "ap-southeast-2a"
subnet-tags = ["Subnet1-Jenkins-Pipeline"]
env-prefix = "Terraform"
instance_type = "t2.micro"
public_key_location = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCyCDz/iy75e+D3kLux3LlqiyK2AqdHFPfpBFxUyesiB+8Z43Z6bWCPUM82d/uC6/yF52ZyiE8ZLBM3dVMqaMgYX82JtiM16mcGmD7tCc5lAdYyA9ZnVFJfSiiNhHD8hyYDp4aybWWXV5OaD/xaB1X8fvjdiDN12X5W0NvT76u2ehDW55rmecnzcOmOhPOTPOb6UjBzXkdYPU4geSGIpumAM2ximES1YBYVp8WmqcMHhAY7rF9jkhOhflYJH7EPHFzEqsDgGZXy4mI3V9LqMnmeAKxCM/q/ihWa432cA/lVKZxnaDPUhYTxvq6NDJfp5ITRQYRSdLPu3/Vbe/MYNhqB4Wu1F83ATjLwHSjkqms540wj+x8cFb5iiqoMn/RYw5bOBrahQuAD0PNQMTTWypZZNm/HHvR9hO9QKK+r7l5OvK49LU8ZuSZCGPVfdJR1REodvUrbraoF5jL5UlxMMKJ3TNP8hxnE8PsjKFavLt+ubjXWEftm4Giq7os2HkwGMU= ritesh.e.agarwal@DDC1-L-13421CJ"
#public_key_location = "$(ID_RSA)"
#subnet_id = ""
key_name = "Terraform-SSH-Key-Jenkins-Pipeline"