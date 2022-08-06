variable "vpc_name" {
  description = "The name of the application"
  type        = string
  default     = "cn-beijing-prod"
}

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "webserver-prod"
}

variable "image_url" {
  description = "The image of the application"
  type        = string
  default     = "nginx:stable"
}

variable "port" {
  description = "The port of SLB"
  type        = string
  default     = "80"
}

variable "namespace_id" {
  description = "The id of the namespace"
  type        = string
  default     = "cn-beijing:prod"
}

variable "namespace_name" {
  description = "The name of the namespace"
  type        = string
  default     = "cn-beijing-prod"
}
