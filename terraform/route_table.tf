#create custom route table
resource "aws_route_table" "public_az1" {
  vpc_id = aws_vpc.my_custom_vpc.id

  route {
    cidr_block = var.general_internet_ip
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_route_table_for_az1"
  }
}

resource "aws_route_table" "public_az2" {
  vpc_id = aws_vpc.my_custom_vpc.id

  route {
    cidr_block = var.general_internet_ip
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_route_table_for_az2"
  }
}


#associate route table with public subnets
resource "aws_route_table_association" "public_for_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public_az1.id
  depends_on = [
    aws_subnet.public_az1
  ]
}

resource "aws_route_table_association" "public_for_az2" {
  subnet_id      = aws_subnet.public_az2.id
  route_table_id = aws_route_table.public_az2.id
  depends_on = [
    aws_subnet.public_az2
  ]
}