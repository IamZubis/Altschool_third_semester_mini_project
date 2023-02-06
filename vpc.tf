resource "aws_vpc" "zubis-altschool-project-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "zubis-altschool-project-vpc"
  }
}