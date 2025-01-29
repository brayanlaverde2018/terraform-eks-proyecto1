# Crear la VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-vpc-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Crear el Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-igw-${var.aliasproyecto}-${var.ambiente}"
    }
  )
  depends_on = [aws_vpc.main_vpc]
}

# Crear Gateway de S3
resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-s3-gateway-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Crear la tabla de ruteo pública (con salida al Internet Gateway)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-public-rt-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Crear la tabla de ruteo privada (sin salida a internet por el momento)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-private-rt-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Crear la tabla de ruteo para la base de datos (solo con rutas locales)
resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-db-rt-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}
