output "RESOURCE_IDENTIFIER" {
  description = "The identifier of the resource"
  value       = module.mysql.db_instance_id
}

output "DB_ID" {
  value       = module.mysql.db_instance_id
  description = "RDS Instance ID"
}

output "DB_NAME" {
  value       = module.mysql.this_db_instance_name
  description = "RDS Instance Name"
}
output "DB_USER" {
  value       = module.mysql.this_db_database_account
  description = "RDS Instance User"
}
output "DB_PORT" {
  value       = module.mysql.this_db_instance_port
  description = "RDS Instance Port"
}
output "DB_HOST" {
  value       = module.mysql.this_db_instance_connection_string
  description = "RDS Instance Host"
}
output "DB_PASSWORD" {
  value       = var.rds_password
  description = "RDS Instance Password"
}
output "DB_PUBLIC_HOST" {
  value       = module.mysql.db_public_connection_string
  description = "RDS Instance Public Host"
}

output "DATABASE_NAME" {
  value       = module.mysql.this_db_database_name
  description = "RDS Database Name"
}
