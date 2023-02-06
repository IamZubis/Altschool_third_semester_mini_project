#Create the 3 EC2 instances.

resource "aws_instance" "zubis-altschool-webserver1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id      = aws_subnet.zubis-altschool-subnet1.id
  availability_zone       = "eu-west-3a"
  associate_public_ip_address = true
  key_name = "zubis-vm-keypair"
  security_groups = [aws_security_group.zubis-instance-SG-allow_tls.id]



  tags = {
    Name = "zubis-altschool-webserver1"
  }
}

resource "aws_instance" "zubis-altschool-webserver2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id      = aws_subnet.zubis-altschool-subnet1.id
  availability_zone       = "eu-west-3a"
  associate_public_ip_address = true
  key_name = "zubis-vm-keypair"
  security_groups = [aws_security_group.zubis-instance-SG-allow_tls.id]



  tags = {
    Name = "zubis-altschool-webserver2"
  }
}

resource "aws_instance" "zubis-altschool-webserver3" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id      = aws_subnet.zubis-altschool-subnet2.id
  availability_zone       = "eu-west-3b"
  associate_public_ip_address = true
  key_name = "zubis-vm-keypair"
  security_groups = [aws_security_group.zubis-instance-SG-allow_tls.id]



  tags = {
    Name = "zubis-altschool-webserver3"
  }
}