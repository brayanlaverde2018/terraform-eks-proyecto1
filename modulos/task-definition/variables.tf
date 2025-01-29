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

variable "network_mode" {
  description = "Modo de red para la tarea (bridge, host, awsvpc, none)"
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Compatibilidades requeridas (EC2, FARGATE)"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "cpu" {
  description = "CPU total asignado a la definición de tarea"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memoria total asignada a la definición de tarea"
  type        = string
  default     = "512"
}

variable "container_name" {
  description = "Nombre del contenedor en la definición de tarea"
  type        = string
}

variable "container_image" {
  description = "Imagen del contenedor (Docker)"
  type        = string
}

variable "container_cpu" {
  description = "CPU asignado al contenedor"
  type        = number
  default     = 128
}

variable "container_memory" {
  description = "Memoria asignada al contenedor"
  type        = number
  default     = 256
}

variable "container_ports" {
  description = "Lista de puertos expuestos por el contenedor"
  type        = list(number)
  default     = [80]
}

variable "container_environment" {
  description = "Variables de entorno para el contenedor"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Lista de tags"
  type        = map(string)
  default     = {}
}
