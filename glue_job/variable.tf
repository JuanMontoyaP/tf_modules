variable "glue_job_name" {
  type        = string
  description = "The name of the Glue job"
}

variable "glue_job_description" {
  type        = string
  description = "The description of the Glue job"
}

variable "glue_job_role_arn" {
  type        = string
  description = "The ARN of the IAM role for the Glue job"

  validation {
    condition     = can(regex("^arn:aws:iam::[0-9]{12}:role/.+$", var.glue_job_role_arn))
    error_message = "The provided ARN is not a valid IAM role ARN."
  }
}

variable "retry_limit" {
  type        = number
  description = "The maximum number of times to retry the job if it fails"
  default     = 1

  validation {
    condition     = var.retry_limit >= 0
    error_message = "The retry limit must be a non-negative integer."
  }
}

variable "number_of_workers" {
  type        = number
  description = "The number of workers to use for the job"
  default     = 2

  validation {
    condition     = var.number_of_workers > 0
    error_message = "The number of workers must be a positive integer."
  }
}

variable "worker_type" {
  type        = string
  description = "The type of worker to use for the job"
  default     = "G.1X"

  validation {
    condition     = contains(["Standard", "G.1X", "G.2X"], var.worker_type)
    error_message = "The worker type must be one of: Standard, G.1X, G.2X."
  }
}

variable "execution_class" {
  type        = string
  description = "The execution class of the job"
  default     = "FLEX"

  validation {
    condition     = contains(["STANDARD", "FLEX"], upper(var.execution_class))
    error_message = "The execution class must be either STANDARD or FLEX."
  }
}

variable "script_location" {
  type        = string
  description = "The S3 location of the Glue job script"

  validation {
    condition     = can(regex("^s3://.+/.+$", var.script_location))
    error_message = "The script location must be a valid S3 URI (e.g., s3://bucket-name/path/to/script.py)."
  }
}

variable "temp_dir_bucket" {
  type        = string
  description = "The S3 bucket for temporary files used by the Glue job"

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.temp_dir_bucket))
    error_message = "The temp_dir_bucket must be a valid S3 bucket name."
  }
}
