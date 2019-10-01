# Creating VPC from scratch #

resource "aws_vpc" "DG-VPC" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "DG-VPC"
  }
}
resource "aws_internet_gateway" "DG-IGW" {
  vpc_id = "${aws_vpc.DG-VPC.id}"

  tags = {
    Name = "DG-IGW"
  }
}

resource "aws_route_table" "DG-PUBLIC-ROUTETABLE" {
  vpc_id = "${aws_vpc.DG-VPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.DG-IGW.id}"
  }

  tags = {
    Name = "DG-PUBLIC-ROUTETABLE"
  }
}