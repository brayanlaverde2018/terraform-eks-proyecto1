output "security_group_id" {
  description = "ID del Security Group creado"
  value       = aws_security_group.this.id
}

output "security_group_arn" {
  description = "ARN del Security Group creado"
  value       = aws_security_group.this.arn
}
