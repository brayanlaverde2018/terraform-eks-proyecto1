output "task_definition_arn" {
  description = "El ARN de la definición de tarea creada"
  value       = aws_ecs_task_definition.task_definition.arn
}

output "task_definition_family" {
  description = "El nombre de familia de la definición de tarea"
  value       = aws_ecs_task_definition.task_definition.family
}
