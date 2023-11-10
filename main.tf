# resource group
resource "azurerm_resource_group" "az-capabilities-rg" {
  name     = "az-capabilities-rg"
  location = "eastus2"
}

# vnet
resource "azurerm_virtual_network" "az-capabilities-vnet-1" {
  name                = "az-capabilities-vnet-1"
  location            = "eastus2"
  resource_group_name = "az-capabilities-rg"
  address_space       = ["10.0.0.0/16"]
}

#azure container registry
resource "azurerm_container_registry" "az-capabilities-acr" {
  name                = "azcapabilitiesacr"
  resource_group_name = "az-capabilities-rg"
  location            = "eastus2"
  admin_enabled       = true
  sku                 = "Standard"

}
