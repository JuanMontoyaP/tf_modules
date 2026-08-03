variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = map(object({
    description                  = string
    from_port                    = number
    to_port                      = number
    ip_protocol                  = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
  default = {}
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
  type = map(object({
    description                  = string
    from_port                    = optional(number)
    to_port                      = optional(number)
    ip_protocol                  = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
  default = {
    rule1 = {
      description = "Allow all outbound traffic"
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}
