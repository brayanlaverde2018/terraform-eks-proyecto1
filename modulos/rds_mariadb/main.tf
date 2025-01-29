
# Creación del DB Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.aliascliente}-rds-subnet-${var.aliasproyecto}-${var.ambiente}"
  subnet_ids = var.db_subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-rds-subnet-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}

# Creación de la instancia de RDS
resource "aws_db_instance" "rds_instance" {
  identifier              = "${var.aliascliente}-rds-${var.aliasproyecto}-${var.ambiente}"
  engine                  = var.db_engine
  engine_version          = var.db_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  storage_type            = var.db_storage_type
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = var.db_security_group_ids
  multi_az                = var.multi_az
  publicly_accessible     = false
  kms_key_id              = var.kms_key_id
  storage_encrypted       = true
  performance_insights_enabled = false
    # Omitir la creación de una instantánea final
  skip_final_snapshot = true

  # Utilizar el usuario y contraseña generados en Secrets Manager
  username = var.db_username
  manage_master_user_password   = true
  master_user_secret_kms_key_id = var.kms_key_id

  tags = merge(
    var.tags,
    {
      Name = "${var.aliascliente}-rds-${var.aliasproyecto}-${var.ambiente}"
    }
  )
}
