terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">=1.156.0"
    }
  }
}

resource "alicloud_vpc" "vpc" {
  count       = var.vpc_id != "" ? 0 : var.create_vpc ? 1 : 0
  vpc_name    = var.vpc_name
  cidr_block  = var.vpc_cidr
  description = var.vpc_description
}

resource "alicloud_vswitch" "vswitches" {
  vpc_id       = var.vpc_id != "" ? var.vpc_id : concat(alicloud_vpc.vpc.*.id, [""])[0]
  vswitch_name = var.vswitch_name
  cidr_block   = var.vswitch_cidr
  description  = var.vswitch_description
  zone_id      = var.zone_id
}

resource "alicloud_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = alicloud_vpc.vpc.0.id
}

resource "alicloud_security_group_rule" "sg_rule" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = var.sg_port_range
  priority          = 1
  security_group_id = alicloud_security_group.sg.id
  cidr_ip           = var.sg_cidr_ip
}
