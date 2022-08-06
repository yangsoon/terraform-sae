terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.156.0"
    }
  }
}

provider "alicloud" {
  region = "cn-beijing"
}

module "network" {
  source   = "../../modules/network"
  vpc_name = var.vpc_name
}

module "mysql" {
  source = "../../modules/mysql"

  databases = [
    {
      "name" : "sae-demo",
      "character_set" : "utf8",
      "description" : "sae demo database"
    },
  ]

  rds_instance_name = var.rds_instance_name
  rds_account_name  = var.rds_account_name
  rds_password      = var.rds_password
}


module "webserver" {
  source = "../../modules/webserver"

  sg_id      = module.network.SG_ID
  vpc_id     = module.network.VPC_ID
  vswitch_id = module.network.VSWITCH_ID

  app_name       = var.app_name
  image_url      = var.image_url
  namespace_name = var.namespace_name
  namespace_id   = var.namespace_id

  envs = [{
    name  = "DB_HOST"
    value = module.mysql.DB_HOST
    }, {
    name  = "DB_PORT"
    value = module.mysql.DB_PORT
    }, {
    name  = "DB_PASSWORD"
    value = module.mysql.DB_PASSWORD
    }, {
    name  = "DATABASE_NAME"
    value = module.mysql.DATABASE_NAME
  }]
}



