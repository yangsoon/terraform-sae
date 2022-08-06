terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">=1.156.0"
    }
  }
}

# sae namespace
resource "alicloud_sae_namespace" "default" {
  namespace_description = var.namespace_description
  namespace_id          = var.namespace_id
  namespace_name        = var.namespace_name
}

# sae
resource "alicloud_sae_application" "webserver" {
  app_name          = var.app_name
  app_description   = var.app_description
  deploy            = true
  image_url         = var.image_url
  namespace_id      = alicloud_sae_namespace.default.id
  vswitch_id        = var.vswitch_id
  vpc_id            = var.vpc_id
  security_group_id = var.sg_id
  package_type      = var.package_type
  timezone          = "Asia/Beijing"
  replicas          = var.replicas
  cpu               = var.cpu
  memory            = var.memory

  envs              = jsonencode(var.envs)
  custom_host_alias = "[{hostName:'samplehost',ip:'127.0.0.1'},{'hostName':'www.abc.com','ip':'128.0.0.1'}]"
  liveness          = "{'httpGet':{'path':'/','port':80,'scheme':'HTTP'},'initialDelaySeconds':20,'periodSeconds':10,'timeoutSeconds':1}"
  readiness         = "{'httpGet':{'path':'/','port':80,'scheme':'HTTP'},'initialDelaySeconds':20,'periodSeconds':10,'timeoutSeconds':1}"

  post_start                           = "{'exec':{'command':['sh','-c','echo hello > /tmp/hello.txt']}}"
  pre_stop                             = "{'exec':{'command':['sh','-c','echo hello']}}"
  termination_grace_period_seconds     = 50
  auto_enable_application_scaling_rule = true
  min_ready_instances                  = 1
}
