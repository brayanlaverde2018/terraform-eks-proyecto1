output "vpc_id" {
  description = "El ID de la VPC"
  value       = aws_vpc.main_vpc.id
}

output "vpc_cidr_block" {
  description = "El bloque CIDR asignado a la VPC"
  value       = aws_vpc.main_vpc.cidr_block
}

output "internet_gateway_id" {
  description = "El ID del Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "s3_gateway_id" {
  description = "El ID del S3 Gateway Endpoint"
  value       = aws_vpc_endpoint.s3_gateway.id
}

output "public_route_table_id" {
  description = "El ID de la tabla de ruteo pública"
  value       = aws_route_table.public_rt.id
}

output "private_route_table_id" {
  description = "El ID de la tabla de ruteo privada"
  value       = aws_route_table.private_rt.id
}

output "db_route_table_id" {
  description = "El ID de la tabla de ruteo para la base de datos"
  value       = aws_route_table.db_rt.id
}
