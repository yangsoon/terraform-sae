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

module "webserver" {
  source = "../../modules/webserver"

  sg_id      = module.network.SG_ID
  vpc_id     = module.network.VPC_ID
  vswitch_id = module.network.VSWITCH_ID

  app_name       = var.app_name
  image_url      = var.image_url
  namespace_name = var.namespace_name
  namespace_id   = var.namespace_id
}
