# Módulo Terraform para AWS KMS

Este módulo crea una llave KMS y su alias en AWS. Está diseñado para ser reutilizable en múltiples proyectos y ambientes.

## Variables

| Nombre                    | Tipo        | Descripción                                                                                             | Valor por defecto                          |
|---------------------------|-------------|---------------------------------------------------------------------------------------------------------|-------------------------------------------|
| `region`                  | `string`    | La región donde se implementará la infraestructura                                                      | `"us-east-1"`                             |
| `aliasproyecto`           | `string`    | Alias del proyecto                                                                                      | N/A                                       |
| `aliascliente`            | `string`    | Alias cliente para tag                                                                                  | N/A                                       |
| `ambiente`                | `string`    | Tipo de ambiente: `prod`, `dev`, `qa`                                                                    | N/A                                       |
| `tags`                    | `map(string)` | Mapa de etiquetas adicionales                                                                           | `{}`                                      |
| `description`             | `string`    | Descripción de la llave KMS. Si está vacío, se genera automáticamente                                   | `""`                                      |
| `deletion_window_in_days` | `number`    | Número de días antes de que se elimine la llave                                                           | `30`                                      |
| `enable_key_rotation`    | `bool`      | Indica si la rotación automática de la llave está habilitada                                            | `true`                                    |
| `is_enabled`              | `bool`      | Indica si la llave KMS está habilitada al momento de la creación                                         | `true`                                    |
| `custom_key_policy`       | `string`    | Política personalizada para la llave KMS. Si se proporciona, sobrescribe la política por defecto.       | `""`                                      |
| `allowed_principals`      | `list(string)` | Lista de ARNs de entidades de IAM permitidas para acceder a la llave KMS                                  | `["*"]` *(ajustar según sea necesario)*    |

## Outputs

| Nombre      | Descripción                         |
|-------------|-------------------------------------|
| `key_id`    | El ID de la llave KMS                |
| `alias_arn` | El ARN del alias de la llave KMS      |
| `key_arn`   | El ARN de la llave KMS                |
| `alias_name`| El nombre del alias de la llave KMS   |

## Ejemplo de Uso


module "kms" {
  source                  = "./modulos/kms"
  region                  = var.region
  aliascliente            = var.aliascliente
  aliasproyecto           = var.aliasproyecto
  ambiente                = var.ambiente
  tags                    = var.tags
  deletion_window_in_days = 60
  enable_key_rotation    = true
  description            = "Llave KMS para el entorno de producción"
}
