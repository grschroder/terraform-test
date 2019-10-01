
resource "aws_key_pair" "test-key" {
  key_name   = "test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsvoKWcovZOLznfkFvAz8Bc+4zXI3b7K6ulQ95/kaccbPb59kwaJdKTA8M0XIgOyTQyx1vb9o4rxfnl+NQJUGGd5Cp8TvzBBWkqTA/kHTxQNan2W5HzaCcq3N0sABqW7rQDOnW40KCltMLf4+9muZs7COkTDYkIu4xxPIA6Wq0HBbGNpxEbEw2jVUQ7xtkQTOe/rVHURQJMug7Y8DxWk6IaTVWM+aILLOPHjum/vsHb/85+Fn7SSeMhXyAxQygmM/DhJ/YxcYMBBpmzLlX889jkyJCCeVuBfP34P4/76YbUzO3bxE8yBRfm5Px7iBo2z/l9qaD/BNiigtWYMugYbsR dg-test-key"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app-srv" {
  ami           = "${data.aws_ami.ubuntu.id}"
  #instance_type = "t2.medium"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.EXTERNAL-SUBNET.id}"
  key_name = "${aws_key_pair.test-key.id}"
  vpc_security_group_ids = [
      "${aws_security_group.ALLOW-SSH.id}",
      "${aws_security_group.ALLOW-JENKINS.id}"
  ]

  tags = {
    Name = "app-srv"
  }
}