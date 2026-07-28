variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy for the IAM role"
  type        = string
}

variable "policies" {
  description = "A map of policy names to policy documents"
  type        = map(string)
  default     = {}
}

variable "policy_attachments" {
  description = "A map of policy names to policy ARNs for attachment"
  type        = map(string)
  default     = {}
}
