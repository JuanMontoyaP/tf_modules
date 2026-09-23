output "arn" {
  value       = aws_glue_job.this.arn
  description = "The ARN of the Glue job"
}

output "name" {
  value       = aws_glue_job.this.name
  description = "The name of the Glue job"
}
