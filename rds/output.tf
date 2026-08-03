output "rds_endpoint" {
  value       = aws_db_instance.this.endpoint
  description = "The endpoint of the RDS instance"
}

output "rds_address" {
  value       = aws_db_instance.this.address
  description = "The address of the RDS instance"
}

output "rds_database" {
  value       = aws_db_instance.this.db_name
  description = "The name of the RDS database"
}
