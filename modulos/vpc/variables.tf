#############################################################
#                   CONFIGURACION PROYECTO                  #
#############################################################

variable "region" {
  description = "La región donde se creará la VPC"
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

# Variables adicionales para personalización de nombres y tags
variable "tags" {
  description = "Lista de tags"
  type        = map(string)
  default     = {}
}

#############################################################
#                      CONFIGURACION VPC                    #
#############################################################

variable "cidr_block" {
  description = "El rango de CIDR para la VPC (e.g., 10.0.0.0/16)"
  type        = string
}

variable "enable_dns_support" {
  description = "Habilitar el soporte de DNS en la VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Habilitar los nombres de host DNS en la VPC"
  type        = bool
  default     = true
}
