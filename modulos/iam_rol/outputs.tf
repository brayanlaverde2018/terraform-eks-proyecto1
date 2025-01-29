output "role_arn" {
  description = "El ARN del rol creado"
  value       = aws_iam_role.role.arn
}

output "attached_custom_policies" {
  description = "Lista de políticas personalizadas adjuntadas"
  value       = aws_iam_policy.custom_policy
}

output "managed_policy_attachment" {
  description = "Política administrada adjuntada"
  value       = var.managed_policy_arn
}
