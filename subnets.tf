#Creating the first subnet inside the VPC.
resource "aws_subnet" "zubis-altschool-subnet1" {
  vpc_id     = aws_vpc.zubis-altschool-project-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-3a"

  tags = {
    Name = "zubis-altschool-subnet1"
  }
}

#Creating the second subnet inside the VPC.
resource "aws_subnet" "zubis-altschool-subnet2" {
  vpc_id     = aws_vpc.zubis-altschool-project-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-3b"
  tags = {
    Name = "zubis-altschool-subnet2"
  }
}