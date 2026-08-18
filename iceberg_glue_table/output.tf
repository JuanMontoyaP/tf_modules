output "table_name" {
  value       = aws_glue_catalog_table.this.name
  description = "The name of the Glue table"
}

output "table_arn" {
  value       = aws_glue_catalog_table.this.arn
  description = "The ARN of the Glue table"
}
