#############################################################
#                   CONFIGURACION PROYECTO                  #
#############################################################

variable "region" {
  description = "La región donde se implementará la infraestructura"
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
  description = "Mapa de etiquetas adicionales"
  type        = map(string)
  default     = {}
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
