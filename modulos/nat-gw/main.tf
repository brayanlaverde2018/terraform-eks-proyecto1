# Crear una Elastic IP para el NAT Gateway
resource "aws_eip" "nat_eip" {
  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-natIp-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Crear el NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id
  connectivity_type = "public"

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-natgw-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Asociación de rutas NAT Gateway con tabla de rutas
resource "aws_route" "nat_gateway_route" {
  route_table_id         = var.private_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
