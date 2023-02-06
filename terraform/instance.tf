#create instances
resource "aws_instance" "web_instance1" {
  ami           = var.ami_detail
  instance_type = var.instance
  security_groups      = [aws_security_group.allow_web.id]
  key_name       =  "instance-key"
  subnet_id = aws_subnet.public_az1.id
  availability_zone = element(data.aws_availability_zones.azs.names, 0)



  tags = {
    Name = "web_instance"
  }
}



resource "aws_instance" "web_instance2" {
  ami           = var.ami_detail
  instance_type = var.instance
  security_groups      = [aws_security_group.allow_web.id]
  key_name       =  "instance-key"
  subnet_id = aws_subnet.public_az1.id
  availability_zone = element(data.aws_availability_zones.azs.names, 0)



  tags = {
    Name = "web_instance"
  }
}

resource "aws_instance" "web_instance3" {
  ami           = var.ami_detail
  instance_type = var.instance
  security_groups      = [aws_security_group.allow_web.id]
  key_name       =  "instance-key"
  subnet_id = aws_subnet.public_az2.id
  availability_zone = element(data.aws_availability_zones.azs.names, 1)



  tags = {
    Name = "web_instance"
  }
}