resource "aws_subnet" "EXTERNAL-SUBNET" {
  vpc_id                  = "${aws_vpc.VPC.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "EXTERNAL-SUBNET"
  }
}

resource "aws_route_table_association" "associate-publicnetwork" {
  subnet_id      = "${aws_subnet.EXTERNAL-SUBNET.id}"
  route_table_id = "${aws_route_table.PUBLIC-ROUTETABLE.id}"
}