module "vpc" {
    source = "./modulos/vpc"
    region = var.region
    aliascliente = var.aliascliente
    aliasproyecto = var.aliasproyecto
    ambiente = var.ambiente
    tags = var.tags
    cidr_block = var.vpc_cidr_block
    enable_dns_support = var.vpc_enable_dns_support
    enable_dns_hostnames = var.vpc_enable_dns_hostnames
}

module "public_subnet1" {
    source = "./modulos/subnet"
    region = var.region
    aliascliente = var.aliascliente
    aliasproyecto = var.aliasproyecto
    ambiente = var.ambiente
    tags = var.tags
    vpc_id = module.vpc.vpc_id
    desc_subnet = var.sn1_pub_desc_subnet
    cidr_block = var.sn1_pub_cidr_block
    availability_zone = var. sn1_pub_availability_zone
    map_public_ip_on_launch = var.sn1_pub_map_public_ip_on_launch
    route_table_id = module.vpc.public_route_table_id
}

module "public_subnet2" {
    source = "./modulos/subnet"
    region = var.region
    aliascliente = var.aliascliente
    aliasproyecto = var.aliasproyecto
    ambiente = var.ambiente
    tags = var.tags
    vpc_id = module.vpc.vpc_id
    desc_subnet = var.sn2_pub_desc_subnet
    cidr_block = var.sn2_pub_cidr_block
    availability_zone = var. sn2_pub_availability_zone
    map_public_ip_on_launch = var.sn2_pub_map_public_ip_on_launch
    route_table_id = module.vpc.public_route_table_id
}

module "private_subnet1" {
    source = "./modulos/subnet"
    region = var.region
    aliascliente = var.aliascliente
    aliasproyecto = var.aliasproyecto
    ambiente = var.ambiente
    tags = var.tags
    vpc_id = module.vpc.vpc_id
    desc_subnet = var.sn1_priv_desc_subnet
    cidr_block = var.sn1_priv_cidr_block
    availability_zone = var. sn1_priv_availability_zone
    map_public_ip_on_launch = var.sn1_priv_map_public_ip_on_launch
    route_table_id = module.vpc.private_route_table_id
}

module "private_subnet2" {
    source = "./modulos/subnet"
    region = var.region
    aliascliente = var.aliascliente
    aliasproyecto = var.aliasproyecto
    ambiente = var.ambiente
    tags = var.tags
    vpc_id = module.vpc.vpc_id
    desc_subnet = var.sn2_priv_desc_subnet
    cidr_block = var.sn2_priv_cidr_block
    availability_zone = var. sn2_priv_availability_zone
    map_public_ip_on_launch = var.sn2_priv_map_public_ip_on_launch
    route_table_id = module.vpc.private_route_table_id
}

# module "db_subnet1" {
#     source = "./modulos/subnet"
#     region = var.region
#     aliascliente = var.aliascliente
#     aliasproyecto = var.aliasproyecto
#     ambiente = var.ambiente
#     tags = var.tags
#     vpc_id = module.vpc.vpc_id
#     desc_subnet = var.sn1_db_desc_subnet
#     cidr_block = var.sn1_db_cidr_block
#     availability_zone = var. sn1_db_availability_zone
#     map_public_ip_on_launch = var.sn1_db_map_public_ip_on_launch
#     route_table_id = module.vpc.db_route_table_id
# }

# module "db_subnet2" {
#     source = "./modulos/subnet"
#     region = var.region
#     aliascliente = var.aliascliente
#     aliasproyecto = var.aliasproyecto
#     ambiente = var.ambiente
#     tags = var.tags
#     vpc_id = module.vpc.vpc_id
#     desc_subnet = var.sn2_db_desc_subnet
#     cidr_block = var.sn2_db_cidr_block
#     availability_zone = var. sn2_db_availability_zone
#     map_public_ip_on_launch = var.sn2_db_map_public_ip_on_launch
#     route_table_id = module.vpc.db_route_table_id
# }

module "nat_gw" {
    source = "./modulos/nat-gw"
    region = var.region
    aliascliente = var.aliascliente
    aliasproyecto = var.aliasproyecto
    ambiente = var.ambiente
    tags = var.tags
    public_subnet_id = module.public_subnet1.subnet_id
    private_route_table_id = module.vpc.private_route_table_id
}


module "ecs_custom_role" {
  source           = "./modulos/iam_rol"
  role_name        = "Cluster-EKS-Role"
  region           = var.region
  aliascliente     = var.aliascliente
  aliasproyecto    = var.aliasproyecto
  ambiente         = var.ambiente
  tags = var.tags
  assume_role_policy = var.assume_role_policy
  policy_files = var.policy_files
  attach_managed_policy = var.attach_managed_policy
}