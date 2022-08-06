output "app_id" {
  description = "The id of the application"
  value       = alicloud_sae_application.webserver.id
}

output "app_name" {
  description = "The name of the application"
  value       = var.app_name
}

output "namespace_id" {
  value       = var.namespace_id
  description = "Namespace ID"
}
