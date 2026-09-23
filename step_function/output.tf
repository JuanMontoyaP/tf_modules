output "sm_arn" {
  description = "The ARN of the Step Function state machine"
  value       = aws_sfn_state_machine.this.arn
}

output "sm_name" {
  description = "The name of the Step Function state machine"
  value       = aws_sfn_state_machine.this.name
}

output "cw_lg_arn" {
  description = "The ARN of the CloudWatch log group for the Step Function state machine"
  value       = aws_cloudwatch_log_group.this.arn
}

output "cw_lg_name" {
  description = "The name of the CloudWatch log group for the Step Function state machine"
  value       = aws_cloudwatch_log_group.this.name
}
