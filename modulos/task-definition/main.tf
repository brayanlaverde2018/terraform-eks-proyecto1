provider "aws" {
  region = var.region
}

# Crear la Task Definition de ECS
resource "aws_ecs_task_definition" "task_definition" {
  family                   = "${var.aliasproyecto}-${var.ambiente}-task"
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      cpu       = var.container_cpu
      memory    = var.container_memory
      essential = true
      portMappings = [
        for port in var.container_ports : {
          containerPort = port
        }
      ]
      environment = [
        for key, value in var.container_environment : {
          name  = key
          value = value
        }
      ]
    }
  ])

  tags = merge(
    var.tags,
    {
      "AliasCliente" : var.aliascliente,
      "Ambiente"     : var.ambiente,
      "Proyecto"     : var.aliasproyecto
    }
  )
}
