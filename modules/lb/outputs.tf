output "endpoint" {
  value = format("http://%s", alicloud_slb_load_balancer.slb.address)
}

output "slb_id" {
  value = alicloud_slb_load_balancer.slb.id
}
