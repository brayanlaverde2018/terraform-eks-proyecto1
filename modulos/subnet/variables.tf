#############################################################
#                   CONFIGURACION PROYECTO                  #
#############################################################

variable "region" {
  description = "La región donde se creará la subnet"
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
  description = "Lista de tags"
  type        = map(string)
  default     = {}
}

#############################################################
#                    CONFIGURACION SUBRED                   #
#############################################################

variable "vpc_id" {
  description = "ID de la VPC donde se creará la subnet"
  type        = string
}

variable "desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

variable "route_table_id" {
  description = "ID de la tabla de ruteo asociada a la subnet"
  type        = string
}