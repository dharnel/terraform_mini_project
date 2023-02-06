#create public subnets
resource "aws_subnet" "public_az1" {
  vpc_id     = aws_vpc.my_custom_vpc.id
  cidr_block = var.public_ip_address[0]
  map_public_ip_on_launch = true
  availability_zone = element(data.aws_availability_zones.azs.names, 0)

  tags = {
    Name = "public_Subnet1"
  }
}

resource "aws_subnet" "public_az2" {
  vpc_id     = aws_vpc.my_custom_vpc.id
  cidr_block = var.public_ip_address[1]
  map_public_ip_on_launch = true
  availability_zone = element(data.aws_availability_zones.azs.names, 1)  

  tags = {
    Name = "public_Subnet2"
  }
}