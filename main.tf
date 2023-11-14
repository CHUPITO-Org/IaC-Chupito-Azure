# resource group
resource "azurerm_resource_group" "az-capabilities-rg" {
  name     = var.rg_name
  location = var.location
}

# virtual network
module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.az-capabilities-rg.location
  resource_group_name = azurerm_resource_group.az-capabilities-rg.name
}

# # azure container registry
# resource "azurerm_container_registry" "az-capabilities-acr" {
#   name                = "azcapabilitiesacr"
#   resource_group_name = "az-capabilities-rg"
#   location            = "eastus2"
#   admin_enabled       = true
#   sku                 = "Standard"

# }

# # container registry lock
# resource "azurerm_management_lock" "az-capabilities-crl" {
#   name          = "az-capabilities-crl"
#   scope         = azurerm_container_registry.example.id
#   lock_level = "ReadOnly"
# }
