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
  default     = "az-capabilities-rg"
}

variable "location" {
  description = "Location"
  type        = string
  default     = "Eastus2"
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "az-capabilities-vnet"
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
  default     = "azcapabilitiesacr"
}
variable "admin_enabled" {
  description = "Admin enabled"
  type        = bool
  default     = true
}

variable "sku" {
  description = "Level o sku"
  type        = string
  default     = "Basic"
}

# azure container instance

variable "acg_name" {
  description = "Name of the container group"
  type        = string
  default     = "az-capabilties-acg"
}

variable "ip_address_type" {
  description = "Type of ip address: private or public"
  type        = string
  default     = "Public"
}

variable "os_type" {
  description = "Type of os_type"
  type        = string
  default     = "Linux"
}

variable "aci_name_front" {
  description = "Name of the container instance"
  type        = string
  default     = "frontend-container"
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
  default     = 80
}

variable "protocol" {
  description = "value of protocol"
  type        = string
  default     = "TCP"
}

variable "aci_name_backend" {
  description = "Name of the container instance"
  type        = string
  default     = "backend-container"

}

variable "aci_name_database" {
  description = "Name of the container instance"
  type        = string
  default     = "database-container"
}

variable "db_root_username" {
  description = "value of the root username"
  type        = string
}

variable "db_root_password" {
  description = "value of the root password"
  type        = string
}

variable "default_db" {
  description = "value of the default db"
  type        = string
}
