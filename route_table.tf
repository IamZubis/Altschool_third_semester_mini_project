#Create a Route Table for the internet gateway

resource "aws_route_table" "zubis-altschool-RT" {
  vpc_id = aws_vpc.zubis-altschool-project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zubis-altschool-IG.id
  }

  tags = {
    Name = "zubis-altschool-project-RT"
  }
}

#Create a Route Table association of the  subnet1.

resource "aws_route_table_association" "zubis-RT-association1" {
  subnet_id      = aws_subnet.zubis-altschool-subnet1.id
  route_table_id = aws_route_table.zubis-altschool-RT.id
}
#Create a Route Table association of the  subnet2.
resource "aws_route_table_association" "zubis-RT-association2" {
  subnet_id      = aws_subnet.zubis-altschool-subnet2.id
  route_table_id = aws_route_table.zubis-altschool-RT.id
}
