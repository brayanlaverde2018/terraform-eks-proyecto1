#############################################################
#                   CONFIGURACIÓN PROYECTO                 #
#############################################################

variable "region" {
  description = "La región donde se creará el Security Group"
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
#                      CONFIGURACIÓN SG                    #
#############################################################

variable "vpc_id" {
  description = "ID de la VPC donde se creará el Security Group"
  type        = string
}

variable "ingress_rules" {
  description = <<EOT
Lista de reglas de entrada para el Security Group. 
Cada regla debe incluir: from_port, to_port, protocol y cidr_blocks.
EOT
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = <<EOT
Lista de reglas de salida para el Security Group. 
Cada regla debe incluir: from_port, to_port, protocol y cidr_blocks.
EOT
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
