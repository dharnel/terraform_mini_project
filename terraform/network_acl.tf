#create network acl
resource "aws_network_acl" "my_network_acl" {
  vpc_id = aws_vpc.my_custom_vpc.id
  subnet_ids = [aws_subnet.public_az1.id, aws_subnet.public_az2.id]

  ingress {
    rule_no      = 100
    action       = "allow"
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_block  = var.general_internet_ip
  }

  egress {
    rule_no      = 100
    action       = "allow"
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_block  = var.general_internet_ip
  }
 
}
