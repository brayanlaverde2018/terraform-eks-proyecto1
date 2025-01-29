# Módulo de Terraform: Security Group

Este módulo crea un Security Group en AWS con reglas de entrada y salida personalizables.

## Variables

### Configuración General
- `region`: Región donde se creará el Security Group.
- `aliasproyecto`: Alias del proyecto.
- `aliascliente`: Alias del cliente para etiquetado.
- `ambiente`: Ambiente del proyecto (prod, dev, qa).
- `tags`: Tags adicionales para los recursos creados.

### Configuración del Security Group
- `vpc_id`: ID de la VPC donde se creará el Security Group.
- `ingress_rules`: Lista de reglas de entrada.
- `egress_rules`: Lista de reglas de salida (por defecto permite todo).

## Outputs
- `security_group_id`: ID del Security Group creado.
- `security_group_arn`: ARN del Security Group creado.

## Uso
```hcl
module "security_group" {
  source                  = "./modulos/subnet"
  region                  = var.region
  aliascliente            = var.aliascliente
  aliasproyecto           = var.aliasproyecto
  ambiente                = var.ambiente
  tags                    = var.tags
  vpc_id       = "vpc-12345678"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
