variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "bucket_namespace" {
  description = "The namespace for the S3 bucket"
  type        = string
  default     = "global"
}

variable "enable_force_destroy" {
  description = "Whether to enable force destroy for the S3 bucket"
  type        = bool
  default     = true
}
