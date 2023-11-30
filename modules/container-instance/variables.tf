# azure container group

variable "acg_name" {
  description = "Name of the container group"
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

# Azure Container Registry credentials
variable "acr_login_server" {
  description = "Value of the login server"
  type        = string
}

variable "acr_admin_username" {
  description = "Value of the admin username"
  type        = string
}

variable "acr_admin_password" {
  description = "Value of the admin password"
  type        = string
}

# Azure Container Instance - Front
variable "aci_name_front" {
  description = "Name of the container instance"
  type        = string
}

variable "cpu" {
  description = "value of cpu"
  type        = number
}

variable "memory" {
  description = "value of memory"
  type        = number
}

variable "port" {
  description = "value of port"
  type        = number
}

variable "protocol" {
  description = "value of protocol"
  type        = string
}


variable "image_front" {
  description = "image of the front"
}

# TODO: Agregar contenedores de backend
# variable "image_back" {
#   description = "image of the backend"
#   default     = "azcapabilitiesacr.azurecr.io/ms-conference-bff:latest"
# }


# Azure Container Instance - Database

variable "aci_name_database" {
  description = "Name of the container instance"
  type        = string
}

variable "db_root_username" {
  description = "value of the root username"
  type        = string
  default     = "username"
}

variable "db_root_password" {
  description = "value of the root password"
  type        = string
  default     = "password"
}

variable "default_db" {
  description = "value of the default db"
  type        = string
  default     = "mongodb"
}

variable "storage_account_name" {
  description = "value of the storage account name"
  type        = string
}

variable "storage_account_key" {
  description = "value of the storage account key"
  type        = string
}

variable "share_name" {
  description = "value of the share name"
  type        = string
}

variable "image_db" {
  description = "value of the db image"
  type        = string
}
