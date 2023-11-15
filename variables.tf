# Terraform Cloud connection
variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

# Resource Group
variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Azure Container Registry
variable "acr_name" {
  description = "Name of the container registry"
  type        = string
}
variable "admin_enabled" {
  description = "Admin enabled"
  type        = bool
}

variable "sku" {
  description = "Level o sku"
  type        = string
}

# azure container instance

variable "acg_name" {
  description = "Name of the container group"
  type        = string
}

variable "ip_address_type" {
  description = "Type of ip address: private or public"
  type        = string
}

variable "os_type" {
  description = "Type of os_type"
  type        = string
  default     = "Linux"
}

variable "aci_name" {
  description = "Name of the container instance"
  type        = string
}

variable "cpu" {
  description = "value of cpu"
  type        = number
  default     = 1
}

variable "memory" {
  description = "value of memory"
  type        = number
  default     = 1
}

variable "port" {
  description = "value of port"
  type        = number
}

variable "protocol" {
  description = "value of protocol"
  type        = string
  default     = "TCP"
}