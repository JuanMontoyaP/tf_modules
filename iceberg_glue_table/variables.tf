variable "table_name" {
  description = "The name of the Glue table"
  type        = string
}

variable "database_name" {
  description = "The name of the Glue database"
  type        = string
}

variable "catalog_id" {
  description = "The ID of the Glue catalog"
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role to be used by the Glue table for compaction and other operations"
  type        = string
}

variable "compaction_strategy" {
  description = "The compaction strategy for the Glue table optimizer (e.g., 'binpack', 'size-based')"
  type        = string
  default     = "binpack"
}

variable "snapshot_retention_period_in_days" {
  description = "The number of days to retain snapshots for the Glue table optimizer"
  type        = number
  default     = 7
}

variable "number_of_snapshots_to_retain" {
  description = "The number of snapshots to retain for the Glue table optimizer"
  type        = number
  default     = 3
}

variable "clean_expired_files" {
  description = "Whether to clean expired files for the Glue table optimizer"
  type        = bool
  default     = true
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket where the Glue table data is stored"
  type        = string
}

variable "s3_bucket_prefix" {
  description = "The prefix in the S3 bucket where the Glue table data is stored"
  type        = string
  default     = "clean/"
}

variable "schema_fields" {
  description = "The schema fields for the Glue table"
  type = list(object({
    id       = number
    name     = string
    required = bool
    type     = string
  }))
}

variable "partition_fields" {
  description = "The partition fields for the Glue table"
  type = list(object({
    name      = string
    source_id = string
    transform = string
  }))
}
