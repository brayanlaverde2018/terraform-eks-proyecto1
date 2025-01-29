output "rds_instance_endpoint" {
  description = "Endpoint de la instancia de RDS"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_instance_arn" {
  description = "ARN de la instancia de RDS"
  value       = aws_db_instance.rds_instance.arn
}