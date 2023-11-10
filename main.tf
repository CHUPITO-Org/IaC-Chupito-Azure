# resource group
resource "azurerm_resource_group" "az-capabilities-rg" {
  name     = "az-capabilities-rg"
  location = "eastus2"
}

# vnet
resource "azurerm_virtual_network" "chupito-vnet-1" {
  name                = "az-capabilities-vnet-1"
  location            = "eastus2"
  resource_group_name = "az-capabilities-rg"
  address_space       = ["10.0.0.0/16"]
}

#azure container registry
resource "azurerm_container_registry" "containerregistry_chupito" {
  name                = "containerregistrychupito"
  resource_group_name = "az-capabilities-rg"
  location            = "eastus2"
  admin_enabled       = true
  sku                 = "Standard"

}