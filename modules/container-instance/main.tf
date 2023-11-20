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
    image  = var.image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.port
      protocol = var.protocol
    }
  }
}
