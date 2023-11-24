# azure container instance

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

variable "aci_name" {
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

# Mongo DB variables

variable "image_front" {
  description = "image of the front"
}

# TODO: Agregar contenedores de mongo y bff
# variable "image_back" {
#   description = "image of the backend"
#   default     = "azcapabilitiesacr.azurecr.io/ms-conference-bff:latest"
# }

# variable "db_root_username" {
#   description = "value of the root username"
#   type        = string
#   default     = "username"
# }

# variable "db_root_password" {
#   description = "value of the root password"
#   type        = string
#   default     = "password"
# }

# variable "default_db" {
#   description = "value of the default db"
#   type        = string
#   default     = "mongodb"
# }
