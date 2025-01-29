# Outputs de la VPC
output "vpc_id" {
  description = "El ID de la VPC creada"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "El bloque CIDR asignado a la VPC"
  value       = module.vpc.vpc_cidr_block
}

output "internet_gateway_id" {
  description = "El ID del Internet Gateway asociado a la VPC"
  value       = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  description = "El ID de la tabla de ruteo pública"
  value       = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  description = "El ID de la tabla de ruteo privada"
  value       = module.vpc.private_route_table_id
}

output "db_route_table_id" {
  description = "El ID de la tabla de ruteo para subnets de base de datos"
  value       = module.vpc.db_route_table_id
}

# # Outputs de las Subnets Públicas
# output "public_subnet1_id" {
#   description = "El ID de la primera Subnet pública"
#   value       = module.public_subnet1.subnet_id
# }

# output "public_subnet2_id" {
#   description = "El ID de la segunda Subnet pública"
#   value       = module.public_subnet2.subnet_id
# }

# # Outputs de las Subnets Privadas
# output "private_subnet1_id" {
#   description = "El ID de la primera Subnet privada"
#   value       = module.private_subnet1.subnet_id
# }

# output "private_subnet2_id" {
#   description = "El ID de la segunda Subnet privada"
#   value       = module.private_subnet2.subnet_id
# }

#Outputs de las Subnets de Base de Datos
output "db_subnet1_id" {
  description = "El ID de la primera Subnet de base de datos"
  value       = module.db_subnet1.subnet_id
}

output "db_subnet2_id" {
  description = "El ID de la segunda Subnet de base de datos"
  value       = module.db_subnet2.subnet_id
}

# # Outputs del NAT Gateway
# output "nat_gateway_id" {
#   description = "El ID del NAT Gateway creado"
#   value       = module.nat_gw.nat_gateway_id
# }

# output "nat_gateway_eip" {
#   description = "La IP pública del NAT Gateway"
#   value       = module.nat_gw.nat_gateway_eip
# }

# output "nat_gateway_allocation_id" {
#   description = "El Allocation ID de la Elastic IP asociada al NAT Gateway"
#   value       = module.nat_gw.nat_gateway_allocation_id
# }
