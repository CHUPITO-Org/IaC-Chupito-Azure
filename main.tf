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

module "acr" {
  source              = "./modules/container-registry"
  acr_name            = var.acr_name
  location            = azurerm_resource_group.az-capabilities-rg.location
  resource_group_name = azurerm_resource_group.az-capabilities-rg.name
  crl_name            = var.crl_name
  lock_level          = var.lock_level
}