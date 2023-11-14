# azure container registry

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

# container registry lock (permisos insuficientes)

# resource "azurerm_management_lock" "crl" {
#   name       = var.crl_name
#   scope      = azurerm_container_registry.acr.id
#   lock_level = "CanNotDelete"
# }
