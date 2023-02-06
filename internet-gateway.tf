resource "aws_internet_gateway" "zubis-altschool-IG" {
  vpc_id = aws_vpc.zubis-altschool-project-vpc.id

  tags = {
    Name = "zubis-altschool-project-IG"
  }
}
