variable "vpc_name" {
  description = "The name of the application"
  type        = string
  default     = "cn-beijing-stage"
}

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "webserver-stage"
}

variable "image_url" {
  description = "The image of the application"
  type        = string
  default     = "nginx:stable"
}

variable "namespace_name" {
  description = "The name of the namespace"
  type        = string
  default     = "cn-beijing-stage"
}

variable "namespace_id" {
  description = "The id of the namespace"
  type        = string
  default     = "cn-beijing:stage"
}
