#############################################################
#                   CONFIGURACIÓN PROYECTO                  #
#############################################################

variable "region" {
  description = "La región donde se implementará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "aliasproyecto" {
  description = "Alias del proyecto"
  type        = string
}

variable "aliascliente" {
  description = "Alias cliente para tag"
  type        = string
}

variable "ambiente" {
  description = "Tipo de ambiente: prod, dev, qa"
  type        = string
}

variable "tags" {
  description = "Lista de tags"
  type        = map(string)
}

#############################################################
#                      CONFIGURACION RDS                    #
#############################################################

variable "db_engine" {
  description = "Motor de base de datos, por ejemplo, mariadb"
  type        = string
  default     = "mariadb"
}

variable "db_version" {
  description = "Versión del motor de base de datos"
  type        = string
  default     = "10.5.9"
}

variable "db_instance_class" {
  description = "Tipo de instancia de RDS (ej. db.t3.medium)"
  type        = string
}

variable "db_allocated_storage" {
  description = "Tamaño del almacenamiento de la base de datos en GB"
  type        = number
}

variable "db_storage_type" {
  description = "Tipo de almacenamiento para la base de datos (ej. gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "db_subnet_ids" {
  description = "Lista de IDs de subredes para el grupo de subredes de la base de datos"
  type        = list(string)
}

variable "db_security_group_ids" {
  description = "Lista de IDs de grupos de seguridad"
  type        = list(string)
}

variable "kms_key_id" {
  description = "La llave KMS para encriptar la base de datos"
  type        = string
}

variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  default     = "admin"
}

variable "multi_az" {
  description = "Si la instancia debe ser multi-AZ o no"
  type        = bool
  default     = true
}
