# azure container registry

variable "acr_name" {
  description = "Name of the container registry"
  type        = string
}

variable "location" {
  description = "Azure region where the azure container registry will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# container registry lock

variable "crl_name" {
  description = "Name of the container registry lock"
  type        = string
}

variable "lock_level" {
  description = "Level of the container lock"
  type        = string
}