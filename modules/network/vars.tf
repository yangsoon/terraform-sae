variable "create_vpc" {
  description = "Whether to create vpc. If false, you can specify an existing vpc by setting 'vpc_id'."
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = "terraform"
}

variable "vpc_description" {
  description = "The vpc description used to launch a new vpc."
  type        = string
  default     = "A new VPC created by Terraform"
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc."
  type        = string
  default     = "172.16.0.0/12"
}

# Vsiwtch variables
variable "vpc_id" {
  description = "The vpc id used to launch several vswitches. If set, the 'create' will be ignored."
  type        = string
  default     = ""
}

variable "vswitch_cidr" {
  description = "cidr blocks used to launch a new vswitch."
  type        = string
  default     = "172.16.0.0/18"
}

# VSwitch variables
variable "vswitch_description" {
  description = "The vswitch description used to launch several new vswitch."
  type        = string
  default     = "New VSwitch created by Terraform"
}

variable "zone_id" {
  description = "Availability Zone ID"
  type        = string
  default     = "cn-beijing-a"
}

variable "vswitch_name" {
  description = "The vswitch name prefix used to launch several new vswitches."
  default     = "terraform"
}

variable "sg_name" {
  default     = "tf"
  description = "The name of the security group rule"
  type        = string
}

variable "sg_description" {
  default     = "The description of the security group rule"
  description = "The description of the security group rule"
  type        = string
}

variable "sg_port_range" {
  default     = "1/65535"
  description = "The port range of the security group rule"
  type        = string
}

variable "sg_cidr_ip" {
  description = "cidr blocks used to create a new security group rule"
  type        = string
  default     = "0.0.0.0/0"
}
