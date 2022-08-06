output "VSWITCH_ID" {
  value       = alicloud_vswitch.vswitches.id
  description = "VSwitch ID"
}

output "VPC_ID" {
  value       = alicloud_vpc.vpc.0.id
  description = "VPC ID"
}

output "SG_ID" {
  value       = alicloud_security_group.sg.id
  description = "VPC ID"
}
