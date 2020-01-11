resource "aws_acm_certificate" "error4577" {
  domain_name               = data.aws_route53_zone.error4577.name
  subject_alternative_names = []
  validation_method         = "DNS"
}
