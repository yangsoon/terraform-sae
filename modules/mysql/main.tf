terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.156.0"
    }
  }
}

locals {
  databases = [
    {
      "name" : var.database_name,
      "character_set" : "utf8",
      "description" : "test database"
    },
  ]
}

module "mysql" {
  source                     = "github.com/kubevela-contrib/terraform-alicloud-rds"
  engine                     = "MySQL"
  engine_version             = "8.0"
  instance_type              = "rds.mysql.c1.large"
  instance_storage           = "20"
  instance_name              = var.rds_instance_name
  account_name               = var.rds_account_name
  password                   = var.rds_password
  allocate_public_connection = var.rds_allocate_public_connection
  security_ips               = var.security_ips
  databases                  = length(var.databases) != 0 ? var.databases : local.databases

  privilege  = var.privilege
  vswitch_id = var.vswitch_id
}
