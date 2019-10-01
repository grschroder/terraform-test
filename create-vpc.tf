# Creating VPC from scratch #

resource "aws_vpc" "VPC" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "VPC"
  }
}
resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.VPC.id}"

  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "PUBLIC-ROUTETABLE" {
  vpc_id = "${aws_vpc.VPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }

  tags = {
    Name = "PUBLIC-ROUTETABLE"
  }
}