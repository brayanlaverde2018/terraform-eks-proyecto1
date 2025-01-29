#############################################################
#                   CONFIGURACION PROYECTO                  #
#############################################################

variable "region" {
  description = "La región donde se creará el NAT Gateway"
  type        = string
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
  description = "Lista de tags adicionales"
  type        = map(string)
  default     = {}
}

#############################################################
#                      CONFIGURACION NAT                    #
#############################################################

# Variable para la Subnet pública
variable "public_subnet_id" {
  description = "ID de la Subnet pública donde se creará el NAT Gateway"
  type        = string
}

# Variable para la tabla de rutas privada
variable "private_route_table_id" {
  description = "ID de la tabla de rutas privada asociada al NAT Gateway"
  type        = string
}
