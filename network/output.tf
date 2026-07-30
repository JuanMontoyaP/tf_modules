output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "The ARN of the VPC"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet[*].id
  description = "The IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnet[*].id
  description = "The IDs of the private subnets"
}
