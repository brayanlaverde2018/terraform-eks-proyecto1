output "nat_gateway_id" {
  description = "ID del NAT Gateway creado"
  value       = aws_nat_gateway.nat_gateway.id
}

output "nat_gateway_eip" {
  description = "IP pública del NAT Gateway"
  value       = aws_eip.nat_eip.public_ip
}

output "nat_gateway_allocation_id" {
  description = "Allocation ID de la Elastic IP asociada al NAT Gateway"
  value       = aws_eip.nat_eip.id
}
