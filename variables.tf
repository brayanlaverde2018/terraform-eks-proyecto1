#############################################################
#                   CONFIGURACION PROYECTO                  #
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
#                      CONFIGURACION VPC                    #
#############################################################

variable "vpc_cidr_block" {
  description = "El rango de CIDR para la VPC (e.g., 10.0.0.0/16)"
  type        = string
}

variable "vpc_enable_dns_support" {
  description = "Habilitar el soporte de DNS en la VPC"
  type        = bool
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  description = "Habilitar los nombres de host DNS en la VPC"
  type        = bool
  default     = true
}

#############################################################
#               CONFIGURACION SUBRED PÚBLICA 1              #
#############################################################

variable "sn1_pub_cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "sn1_pub_desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "sn1_pub_availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "sn1_pub_map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

#############################################################
#               CONFIGURACION SUBRED PÚBLICA 2              #
#############################################################

variable "sn2_pub_cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "sn2_pub_desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "sn2_pub_availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "sn2_pub_map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

#############################################################
#               CONFIGURACION SUBRED PRIVADA 1              #
#############################################################

variable "sn1_priv_cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "sn1_priv_desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "sn1_priv_availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "sn1_priv_map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

#############################################################
#               CONFIGURACION SUBRED PRIVADA 2              #
#############################################################

variable "sn2_priv_cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "sn2_priv_desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "sn2_priv_availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "sn2_priv_map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

#############################################################
#                 CONFIGURACION SUBRED DB 1                 #
#############################################################

variable "sn1_db_cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "sn1_db_desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "sn1_db_availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "sn1_db_map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

#############################################################
#                CONFIGURACION SUBRED DB 2                  #
#############################################################

variable "sn2_db_cidr_block" {
  description = "El rango de CIDR para la Subnet (e.g., 10.0.1.0/24)"
  type        = string
}

variable "sn2_db_desc_subnet" {
  description = "Descripción de la subnet"
  type        = string
}

variable "sn2_db_availability_zone" {
  description = "Zona de disponibilidad donde se creará la subnet"
  type        = string
}

variable "sn2_db_map_public_ip_on_launch" {
  description = "Indica si las instancias en esta subnet recibirán una IP pública automáticamente"
  type        = bool
  default     = false
}

#############################################################
#                     CONFIGURACION ROL                     #
#############################################################


variable "role_name" {
  description = "Nombre del rol"
  type        = string
}

variable "assume_role_policy" {
  description = "Política de confianza para el rol"
  type        = object({
    Version   = string
    Statement = list(any)
  })
}

variable "policy_files" {
  description = "Lista de archivos JSON con políticas personalizadas"
  type        = map(string)
  default     = {}
}

variable "attach_managed_policy" {
  description = "Si se debe adjuntar una política administrada existente"
  type        = bool
  default     = false
}

variable "managed_policy_arn" {
  description = "ARN de la política administrada a adjuntar"
  type        = string
  default     = ""  # Cambiamos de mapa vacío a cadena vacía
}
