#Create a Network Access Control list.

resource "aws_network_acl" "zubis-altschool-project-ACL" {
  vpc_id = aws_vpc.zubis-altschool-project-vpc.id
  subnet_ids = [aws_subnet.zubis-altschool-subnet1.id, aws_subnet.zubis-altschool-subnet2.id]
  
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "zubis-net-ACL"
  }
}

#Create a security group for the load balancer

resource "aws_security_group" "zubis-load-balancer-SG-allow_tls" {
  name        = "zubis-load-balancer-SG-allow_tls"
  description = "Security group for the load balancer"
  vpc_id     = aws_vpc.zubis-altschool-project-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#Create a security group for the EC2 instances.

resource "aws_security_group" "zubis-instance-SG-allow_tls" {
  name        = "zubis-instance-SG-allow_tls"
  description = "Allow SSH, HTTP and HTTPS inbound instances"
  vpc_id     = aws_vpc.zubis-altschool-project-vpc.id

  ingress {
    description      = "https from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.zubis-load-balancer-SG-allow_tls.id]
  }
  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.zubis-load-balancer-SG-allow_tls.id]
  }
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
# #testing the fuctionality of the load balancer
#   egress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
  tags = {
    Name = "zubis-Altschool-instance-SG"
  }
}

