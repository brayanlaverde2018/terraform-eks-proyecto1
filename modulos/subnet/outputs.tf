output "subnet_id" {
  description = "El ID de la Subnet creada"
  value       = aws_subnet.main_subnet.id
}

output "route_table_association_id" {
  description = "El ID de la asociación entre la Subnet y la tabla de ruteo"
  value       = aws_route_table_association.route_table_association.id
}
