resource "aws_subnet" "DG-EXTERNAL-SUBNET" {
  vpc_id                  = "${aws_vpc.DG-VPC.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "DG-EXTERNAL-SUBNET"
  }
}

resource "aws_route_table_association" "associate-publicnetwork" {
  subnet_id      = "${aws_subnet.DG-EXTERNAL-SUBNET.id}"
  route_table_id = "${aws_route_table.DG-PUBLIC-ROUTETABLE.id}"
}