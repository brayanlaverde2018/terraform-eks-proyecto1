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
#                      CONFIGURACION KMS                    #
#############################################################

variable "description" {
  description = "Descripción de la llave KMS. Si está vacío, se genera automáticamente."
  type        = string
  default     = ""
}

variable "deletion_window_in_days" {
  description = "Número de días antes de que se elimine la llave"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Indica si la rotación automática de la llave está habilitada"
  type        = bool
  default     = true
}

variable "is_enabled" {
  description = "Indica si la llave KMS está habilitada"
  type        = bool
  default     = true
}

variable "custom_key_policy" {
  description = "Política personalizada para la llave KMS. Si se proporciona, sobrescribe la política por defecto."
  type        = string
  default     = ""
}
