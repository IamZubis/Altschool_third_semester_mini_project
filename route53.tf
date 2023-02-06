
# Create a hosted zone

resource "aws_route53_zone" "zubis-altschool-hosted_zone" {
  name = var.domain-name
  tags = {
    Environment = "mini_project"
  }
}


# create a route53 AWS record set 

resource "aws_route53_record" "zubis-domain" {
  zone_id = aws_route53_zone.zubis-altschool-hosted_zone.zone_id
  name    = "terraform-test.${var.domain-name}"
  type    = "A"
  alias {
    name                   = aws_lb.zubis-altschool-LB.dns_name
    zone_id                = aws_lb.zubis-altschool-LB.zone_id
    evaluate_target_health = true
  }
}