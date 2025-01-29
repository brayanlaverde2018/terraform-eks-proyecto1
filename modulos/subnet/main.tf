# Crear la Subnet
resource "aws_subnet" "main_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-subnet-${var.desc_subnet}-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Asociar la Subnet a la tabla de ruteo proporcionada
resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = var.route_table_id
}

