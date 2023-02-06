# Create the load balancer 

resource "aws_lb" "zubis-altschool-LB" {
  name               = "zubis-altschool-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.zubis-load-balancer-SG-allow_tls.id]
  subnets            = [aws_subnet.zubis-altschool-subnet1.id, aws_subnet.zubis-altschool-subnet2.id ]

  enable_deletion_protection = true
  depends_on         = [aws_instance.zubis-altschool-webserver1, aws_instance.zubis-altschool-webserver2, aws_instance.zubis-altschool-webserver3]

  tags = {
    Environment = "assignment"
  }
}

#Create the target group for the load balancer

resource "aws_lb_target_group" "zubis-altschool-LB-target-group" {
  name     = "zubis-altschool-LB-target-group"
  
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id     = aws_vpc.zubis-altschool-project-vpc.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

#Create the listener

resource "aws_lb_listener" "zubis-altschool-LB-listener" {
  load_balancer_arn = aws_lb.zubis-altschool-LB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.zubis-altschool-LB-target-group.arn
  }
}

# Create the listener rule

resource "aws_lb_listener_rule" "zubis-altschool-LB-listener-rule" {
  listener_arn = aws_lb_listener.zubis-altschool-LB-listener.arn
  priority     = 1
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.zubis-altschool-LB-target-group.arn
  }
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

#Attach the target group to the load balancer

resource "aws_lb_target_group_attachment" "zubis-altschool-TG-attachment1" {
  target_group_arn = aws_lb_target_group.zubis-altschool-LB-target-group.arn
  target_id        = aws_instance.zubis-altschool-webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "zubis-altschool-TG-attachment2" {
  target_group_arn = aws_lb_target_group.zubis-altschool-LB-target-group.arn
  target_id        = aws_instance.zubis-altschool-webserver2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "zubis-altschool-TG-attachment3" {
  target_group_arn = aws_lb_target_group.zubis-altschool-LB-target-group.arn
  target_id        = aws_instance.zubis-altschool-webserver3.id
  port             = 80
}