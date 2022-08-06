terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">=1.156.0"
    }
  }
}

resource "alicloud_slb_load_balancer" "slb" {
  load_balancer_name = var.slb_name
  address_type       = var.address_type
  load_balancer_spec = var.load_balancer_spec
  vswitch_id         = var.vswitch_id
}
