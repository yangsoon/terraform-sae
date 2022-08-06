variable "rds_instance_name" {
  description = "RDS instance name"
  type        = string
  default     = "poc"
}

variable "rds_account_name" {
  description = "RDS instance user account name"
  type        = string
  default     = "sae"
}

variable "rds_password" {
  description = "RDS instance account password"
  type        = string
}

variable "rds_allocate_public_connection" {
  description = "Whether to allocate public connection for a RDS instance."
  type        = bool
  default     = true
}

variable "security_ips" {
  description = "List of IP addresses allowed to access all databases of an instance"
  type        = list(any)
  default     = ["0.0.0.0/0", ]
}

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "sae-demo"
}

variable "privilege" {
  description = "The privilege of one account access database."
  type        = string
  default     = "ReadWrite"
}

variable "vswitch_id" {
  type        = string
  description = "The vswitch id of the RDS instance. If set, the RDS instance will be created in VPC, or it will be created in classic network."
  default     = ""
}

variable "databases" {
  description = "The database list, each database is a map, the map contains the following attributes: name, character_set, description, like `[{\"name\":\"test\",\"character_set\":\"utf8\",\"description\":\"test database\"},]`. It conflicts with `database_name`."
  type        = list(map(string))
}
