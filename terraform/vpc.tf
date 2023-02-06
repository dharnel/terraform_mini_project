#create vpc 
resource "aws_vpc" "my_custom_vpc" {
  cidr_block = var.vpc_block
  enable_dns_hostnames = true
  tags = {
    name = "custom_vpc"
  }
}