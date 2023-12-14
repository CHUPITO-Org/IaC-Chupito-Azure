variable "location" {
  description = "Azure region where the azure container registry will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "lb_id" {
  description = "ID of the load balancer"
  type        = string
}
