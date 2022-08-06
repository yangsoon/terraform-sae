variable "slb_name" {
  description = "The name of the SLB"
  type        = string
}

variable "address_type" {
  description = "The network type of the SLB instance"
  type        = string
  default     = "intranet"
}

variable "load_balancer_spec" {
  description = "The specification of the Server Load Balancer instance"
  type        = string
  default     = "slb.s2.small"
}

variable "vswitch_id" {
  description = "The VSwitch ID to launch in."
  type        = string
}
