variable "identifier" {
  description = "Unique name for the RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine, e.g. postgres, mysql"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum autoscaled storage in GB"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "Storage type"
  type        = string
  default     = "gp3"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "mydb"
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "port" {
  description = "Database port"
  type        = number
  default     = 3306
}

variable "subnet_ids" {
  description = "Subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = null
}

variable "maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on destroy"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Whether the DB is publicly accessible"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Whether to enable storage encryption"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = false
}

variable "ingress_rules" {
  description = "Custom ingress rules for the security group"
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
