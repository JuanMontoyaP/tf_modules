resource "aws_sfn_state_machine" "this" {
  name     = var.state_machine_name
  role_arn = var.role_arn
  type     = var.type
  publish  = var.publish

  definition = jsonencode(yamldecode(var.definition_file))

  logging_configuration {
    include_execution_data = var.include_execution_data
    level                  = var.log_level
    log_destination        = "${aws_cloudwatch_log_group.this.arn}:*"
  }

  tracing_configuration {
    enabled = var.tracing_enabled
  }

  depends_on = [aws_cloudwatch_log_group.this]
}

resource "aws_cloudwatch_log_group" "this" {
  name                        = "/aws/stepfunctions/${var.state_machine_name}"
  retention_in_days           = var.log_retention_in_days
  deletion_protection_enabled = false
}
