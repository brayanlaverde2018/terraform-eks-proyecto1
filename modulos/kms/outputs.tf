output "key_id" {
  description = "El ID de la llave KMS"
  value       = aws_kms_key.this.id
}

output "alias_arn" {
  description = "El ARN del alias de la llave KMS"
  value       = aws_kms_alias.this.arn
}

output "key_arn" {
  description = "El ARN de la llave KMS"
  value       = aws_kms_key.this.arn
}

output "alias_name" {
  description = "El nombre del alias de la llave KMS"
  value       = aws_kms_alias.this.name
}
