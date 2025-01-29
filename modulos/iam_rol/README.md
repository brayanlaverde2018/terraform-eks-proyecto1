# Módulo de Terraform: Creación de Roles en AWS

Este módulo permite crear roles IAM en AWS con una política asociada. Es útil para configurar roles personalizados con permisos específicos.

## Requisitos

- **Terraform** >= 1.0.0
- **Proveedor AWS** >= 3.0

## Recursos Implementados

El módulo crea los siguientes recursos:

- Rol IAM (`aws_iam_role`)
- Política IAM (`aws_iam_policy`)
- Asociación opcional entre el rol y la política (`aws_iam_role_policy_attachment`)

## Variables

### Entradas Principales

| Nombre                 | Descripción                                           | Tipo         | Requerido | Valor por defecto |
|-------------------------|-------------------------------------------------------|--------------|-----------|--------------------|
| `role_name`            | Nombre del rol IAM.                                   | `string`     | Sí        | N/A                |
| `assume_role_policy`   | Política de confianza para el rol.                    | `object`     | Sí        | N/A                |
| `policy_document`      | Documento de política asociada al rol.               | `object`     | Sí        | N/A                |
| `attach_default_policy`| Si se debe asociar automáticamente una política creada. | `bool`       | No        | `true`             |
| `tags`                 | Mapa de etiquetas para los recursos creados.         | `map(string)`| No        | `{}`               |
| `aliascliente`         | Alias del cliente para las etiquetas.                | `string`     | Sí        | N/A                |
| `aliasproyecto`        | Alias del proyecto para las etiquetas.               | `string`     | Sí        | N/A                |
| `ambiente`             | Tipo de ambiente (`prod`, `dev`, `qa`).              | `string`     | Sí        | N/A                |

## Outputs

| Nombre       | Descripción                          |
|--------------|--------------------------------------|
| `role_arn`   | ARN del rol IAM creado.             |
| `policy_arn` | ARN de la política asociada creada. |

## Uso

Ejemplo de uso del módulo para crear un rol con una política personalizada:

```hcl
module "custom_role" {
  source           = "./modulos/iam_rol"
  role_name        = "my-custom-role"
  aliascliente     = "mi-cliente"
  aliasproyecto    = "mi-proyecto"
  ambiente         = "dev"

  assume_role_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  }

  policy_files = {
    "custom_policy" = "./modulos/iam-role/policies/my_custom_policy.json"
    "another_policy" = "./modulos/iam-role/policies/another_policy.json"
  }

  attach_managed_policy = true
  managed_policy_arn    = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"

  tags = {
    "Owner"       = "equipo-devops"
    "Environment" = "development"
  }
}
