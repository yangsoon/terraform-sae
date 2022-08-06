variable "vpc_id" {
  description = "VSwitch Id"
}

variable "vswitch_id" {
  description = "VSwitch Id"
}

variable "sg_id" {
  description = "VSwitch Id"
}

variable "namespace_description" {
  description = "Namespace Description"
  default     = "a namespace"
}

variable "namespace_name" {
  description = "Namespace Name"
  type        = string
}

variable "namespace_id" {
  description = "Namespace ID"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "app_description" {
  default     = "created by Terraform"
  description = "The description of the application"
  type        = string
}

variable "package_type" {
  default     = "Image"
  description = "The package type of the application"
  type        = string
}

variable "cpu" {
  default     = "500"
  description = "The cpu of the application, in unit of millicore"
  type        = string
}

variable "memory" {
  default     = "1024"
  description = "The memory of the application, in unit of MB"
  type        = string
}

variable "image_url" {
  description = "The image url of the application, like `registry.cn-hangzhou.aliyuncs.com/google_containers/nginx-slim:0.9`"
  type        = string
}

variable "replicas" {
  default     = "1"
  description = "The replicas of the application"
  type        = string
}

variable "envs" {
  type = list(object({
    name  = string
    value = string
  }))
  default = [{
    name  = "DEPLOY_ENV"
    value = "SAE"
  }]
}
