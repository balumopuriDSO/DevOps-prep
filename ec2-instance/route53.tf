resource "aws_route53_record" "expense_app" {
    count = length(var.instances)
    name = "${var.instances[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.expense_app[count.index].private_ip]
    zone_id = var.route53_zone_id
}

resource "aws_route53_record" "expense_app_public" {
    name = "${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.expense_app[2].public_ip]
    zone_id = var.route53_zone_id
}
