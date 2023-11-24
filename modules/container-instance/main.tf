# azure container instance

#TODO: Define variables
resource "azurerm_container_group" "acg" {
  name                = var.acg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  os_type             = "Linux"

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = var.aci_name
    image  = var.image_front
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.port
      protocol = var.protocol
    }
  }
  # TODO: Agregar contenedores de mongo y bff
  # container {
  #   name   = "mongodb"
  #   image  = "mongo:6.0.6"
  #   cpu    = "1"
  #   memory = "1"

  #   ports {
  #     port     = 27017
  #     protocol = "TCP"
  #   }

  #   environment_variables = {
  #     MONGO_INITDB_ROOT_USERNAME = var.db_root_username
  #     MONGO_INITDB_ROOT_PASSWORD = var.db_root_password
  #     MONGO_INITDB_DATABASE      = var.default_db
  #   }
  # }

  # container {
  #   name   = "conference-bff"
  #   image  = "azcapabilitiesacr2.azurecr.io/ms-conference-bff:latest"
  #   cpu    = "1"
  #   memory = "1"

  #   ports {
  #     port     = 5002
  #     protocol = "TCP"
  #   }

  #   environment_variables = {
  #     MONGODB_URI = "mongodb://${var.db_root_username}:${var.db_root_password}@mongodb:27017/${var.default_db}"
  #     DEFAULT_DB  = var.default_db
  #   }
  # }
}
