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

# azure container registry
module "acr" {
  source              = "./modules/container-registry"
  acr_name            = var.acr_name
  location            = azurerm_resource_group.az-capabilities-rg.location
  resource_group_name = azurerm_resource_group.az-capabilities-rg.name
  admin_enabled       = var.admin_enabled
  sku                 = var.sku
}

module "acg" {
  source              = "./modules/container-instance"
  acg_name            = var.acg_name
  location            = azurerm_resource_group.az-capabilities-rg.location
  resource_group_name = azurerm_resource_group.az-capabilities-rg.name
  ip_address_type     = var.ip_address_type
  os_type             = var.os_type
  acr_login_server    = module.acr.acr_login_server
  acr_admin_username  = module.acr.acr_admin_username
  acr_admin_password  = module.acr.acr_admin_password
  aci_name            = var.aci_name
  image               = "${module.acr.acr_login_server}/fe-chupito:prueba"
  cpu                 = var.cpu
  memory              = var.memory
  port                = var.port
  protocol            = var.protocol
}
