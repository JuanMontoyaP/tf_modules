output "sg_id" {
  value       = aws_security_group.this.id
  description = "The ID of the security group"
}

output "sg_name" {
  value       = aws_security_group.this.name
  description = "The name of the security group"
}

output "ingress_rule_ids" {
  value       = [for rule in aws_vpc_security_group_ingress_rule.this : rule.id]
  description = "The IDs of the ingress rules"
}

output "egress_rule_ids" {
  value       = [for rule in aws_vpc_security_group_egress_rule.this : rule.id]
  description = "The IDs of the egress rules"
}
