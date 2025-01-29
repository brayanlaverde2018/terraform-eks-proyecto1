#############################################################
#                   CONFIGURACION PROYECTO                  #
#############################################################

region = "us-east-1"
aliasproyecto = "eks"
aliascliente = "brayan"
ambiente = "qa"
tags = {
  "Propietario" = "Ministerio de Ambiente y Desarrollo Sostenible"
  "ambiente" = "qa"
}

#############################################################
#                      CONFIGURACION VPC                    #
#############################################################

vpc_cidr_block = "10.50.0.0/23"
vpc_enable_dns_support = true
vpc_enable_dns_hostnames = true

#############################################################
#               CONFIGURACION SUBRED PÚBLICA 1              #
#############################################################

sn1_pub_cidr_block = "10.50.0.0/27"
sn1_pub_availability_zone = "us-east-1a"
sn1_pub_map_public_ip_on_launch = true
sn1_pub_desc_subnet = "public1"

#############################################################
#               CONFIGURACION SUBRED PÚBLICA 2              #
#############################################################

sn2_pub_cidr_block = "10.50.0.32/27"
sn2_pub_availability_zone = "us-east-1b"
sn2_pub_map_public_ip_on_launch = true
sn2_pub_desc_subnet = "public2"

#############################################################
#               CONFIGURACION SUBRED PRIVADA 1              #
#############################################################

sn1_priv_cidr_block = "10.50.0.64/27"
sn1_priv_availability_zone = "us-east-1a"
sn1_priv_map_public_ip_on_launch = true
sn1_priv_desc_subnet = "private1"

#############################################################
#               CONFIGURACION SUBRED PRIVADA 2              #
#############################################################

sn2_priv_cidr_block = "10.50.0.96/27"
sn2_priv_availability_zone = "us-east-1b"
sn2_priv_map_public_ip_on_launch = true
sn2_priv_desc_subnet = "private2"

#############################################################
#                  CONFIGURACION SUBRED DB 1                #
#############################################################

sn1_db_cidr_block = "10.50.0.128/27"
sn1_db_availability_zone = "us-east-1a"
sn1_db_map_public_ip_on_launch = true
sn1_db_desc_subnet = "db1"

#############################################################
#                  CONFIGURACION SUBRED DB 2                #
#############################################################

sn2_db_cidr_block = "10.50.0.160/27"
sn2_db_availability_zone = "us-east-1b"
sn2_db_map_public_ip_on_launch = true
sn2_db_desc_subnet = "db2"


#############################################################
#              CONFIGURACION ROL CLUSTER EKS                #
#############################################################

role_name = "ecsRolePrueba"
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
policy_files = {}
attach_managed_policy = true
managed_policy_arn = ""
