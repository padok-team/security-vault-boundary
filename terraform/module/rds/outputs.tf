output "this" {
  description = "RDS Instance"
  value       = aws_db_instance.this
}

output "security_group" {
  description = "Security group of the RDS Instance"
  value       = aws_security_group.this
}

output "rds_password" {
  value = random_password.this.result
  sensitive = true
}