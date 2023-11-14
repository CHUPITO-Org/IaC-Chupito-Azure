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

# Container Registry Lock

variable "crl_name" {
  description = "Name of the container registry lock"
  type        = string
}

variable "lock_level" {
  description = "Level of the container lock"
  type        = string
}