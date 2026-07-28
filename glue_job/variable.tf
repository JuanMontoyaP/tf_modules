variable "scripts_bucket" {
  type        = string
  description = "The S3 bucket where the Glue job script is stored"
}

variable "script_key" {
  type        = string
  description = "The S3 key of the Glue job script"

  validation {
    condition     = can(regex("^.+$", var.script_key))
    error_message = "The script key must be a valid S3 key (e.g., path/to/script.py)."
  }
}

variable "source_script" {
  type        = string
  description = "The local path to the Glue job script to be uploaded to S3"

  validation {
    condition     = can(regex("^.+$", var.source_script))
    error_message = "The source script must be a valid local file path (e.g., ./scripts/script.py)."
  }
}

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

variable "command" {
  type = object({
    name           = string
    python_version = string
  })

  default = {
    name           = "glueetl"
    python_version = "3"
  }
}

variable "max_concurrent_runs" {
  type        = number
  description = "The maximum number of concurrent runs for the Glue job"
  default     = 1

  validation {
    condition     = var.max_concurrent_runs > 0
    error_message = "The maximum number of concurrent runs must be a positive integer."
  }
}

variable "default_args" {
  type        = map(string)
  description = "A map of default arguments for the Glue job"
}
