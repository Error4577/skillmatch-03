resource "aws_route53_record" "error4577" {
  zone_id = data.aws_route53_zone.error4577.zone_id
  name    = data.aws_route53_zone.error4577.name
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}
