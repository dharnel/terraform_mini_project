#create hosted zone
resource "aws_route53_zone" "hosted_zone" {
  name = var.domain_name

  tags = {
    "Environment" = "dev"
  }
}

#create record
resource "aws_route53_record" "terraform-test" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name = var.site_domain
  type = "A"

  alias {
    name = aws_lb.custom_lb.dns_name
    zone_id = aws_lb.custom_lb.zone_id
    evaluate_target_health = true
  }
}