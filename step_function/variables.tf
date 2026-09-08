variable "state_machine_name" {
  description = "The name of the Step Function state machine"
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role for the Step Function state machine"
  type        = string
}

variable "type" {
  description = "The type of the Step Function state machine (e.g., STANDARD or EXPRESS)"
  type        = string
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "EXPRESS"], var.type)
    error_message = "The type must be either 'STANDARD' or 'EXPRESS'."
  }
}

variable "publish" {
  description = "Whether to publish a new version of the Step Function state machine"
  type        = bool
  default     = false
}

variable "definition_file" {
  description = "The path to the definition file containing the Step Function state machine definition"
  type        = string
}

variable "tracing_enabled" {
  description = "Whether to enable X-Ray tracing for the Step Function state machine"
  type        = bool
  default     = false
}

variable "log_retention_in_days" {
  description = "The number of days to retain CloudWatch logs for the Step Function state machine"
  type        = number
  default     = 3
}

variable "include_execution_data" {
  description = "Whether to include execution data in CloudWatch logs for the Step Function state machine"
  type        = bool
  default     = true
}

variable "log_level" {
  description = "The logging level for CloudWatch logs for the Step Function state machine"
  type        = string
  default     = "ALL"

  validation {
    condition     = contains(["ALL", "ERROR", "FATAL", "OFF"], var.log_level)
    error_message = "The log level must be one of 'ALL', 'ERROR', 'FATAL', or 'OFF'."
  }
}
