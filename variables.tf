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

# Vnet
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}
