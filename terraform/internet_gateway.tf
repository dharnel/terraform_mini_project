#create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_custom_vpc.id

  tags = {
    Name = "custom_igw"
  }
}