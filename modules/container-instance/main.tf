# azure container instance

#TODO: Define variables
resource "azurerm_container_group" "acg" {
  name                = var.acg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  os_type             = "Linux"
  dns_name_label      = "chupito-db"

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = var.aci_name_front
    image  = var.image_front
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.port
      protocol = var.protocol
    }
  }

  container {
    name   = var.aci_name_database
    image  = var.image_db
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = 27017
      protocol = "TCP"
    }

    environment_variables = {
      MONGO_INITDB_ROOT_USERNAME = var.db_root_username
      MONGO_INITDB_ROOT_PASSWORD = var.db_root_password
      MONGODB_DATABASE           = var.default_db
    }

    volume {
      name                 = "conferenceappdata"
      mount_path           = "/data/db-test"
      storage_account_name = var.storage_account_name
      storage_account_key  = var.storage_account_key
      share_name           = var.share_name
    }
  }

  container {
    name   = "conference-bff"
    image  = var.image_back
    cpu    = "1"
    memory = "1"

    ports {
      port     = 5002
      protocol = "TCP"
    }
  }

}
