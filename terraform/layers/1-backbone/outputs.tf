output "rds" {
  value = module.rds
  description = "RDS"
  sensitive= true
}

output "pg_url" {
  value = "postgresql://${module.rds.this.username}:${module.rds.rds_password}@${module.rds.this.endpoint}/postgres"
}

output "aws_kms_recovery" {
  value = aws_kms_alias.recovery
}
output "aws_kms_root" {
  value = aws_kms_alias.root
}
output "aws_kms_worker_auth" {
  value = aws_kms_alias.worker_auth
}

output "aws_eip_controller-1" {
  value = aws_eip.controller-1
}
output "aws_eip_controller-2" {
  value = aws_eip.controller-2
}
output "aws_eip_worker-1" {
  value = aws_eip.worker-1
}
output "aws_eip_worker-2" {
  value = aws_eip.worker-2
}