resource "aws_security_group" "this" {
  name        = "${var.sg_name}-sg"
  description = "Security group for ${var.sg_name}"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.ingress_rules

  security_group_id            = aws_security_group.this.id
  description                  = each.value.description
  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  ip_protocol                  = each.value.ip_protocol
  cidr_ipv4                    = try(each.value.cidr_ipv4, null)
  referenced_security_group_id = try(each.value.referenced_security_group_id, null)
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.egress_rules

  security_group_id            = aws_security_group.this.id
  description                  = each.value.description
  from_port                    = try(each.value.from_port, null)
  to_port                      = try(each.value.to_port, null)
  ip_protocol                  = each.value.ip_protocol
  cidr_ipv4                    = try(each.value.cidr_ipv4, null)
  referenced_security_group_id = try(each.value.referenced_security_group_id, null)
}
