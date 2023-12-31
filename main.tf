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
  subnet_name         = "az-capabilities-subnet-acg"
  address_prefixes    = ["10.0.0.0/24"]
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

#storage
module "storage" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.az-capabilities-rg.name
  location            = azurerm_resource_group.az-capabilities-rg.location
}

module "acg" {
  source               = "./modules/container-instance"
  acg_name             = var.acg_name
  location             = azurerm_resource_group.az-capabilities-rg.location
  resource_group_name  = azurerm_resource_group.az-capabilities-rg.name
  acr_login_server     = module.acr.acr_login_server
  acr_admin_username   = module.acr.acr_admin_username
  acr_admin_password   = module.acr.acr_admin_password
  aci_name_front       = var.aci_name_front
  image_front          = "${module.acr.acr_login_server}/ms-conference-ui"
  cpu                  = var.cpu
  memory               = var.memory
  port                 = var.port
  protocol             = var.protocol
  storage_account_name = module.storage.storage_account_name
  storage_account_key  = module.storage.storage_account_key
  share_name           = module.storage.share_name
  aci_name_database    = var.aci_name_database
  image_db             = "${module.acr.acr_login_server}/image-mongo:v1"
  db_root_username     = var.db_root_username
  db_root_password     = var.db_root_password
  default_db           = var.default_db
  aci_name_backend     = var.aci_name_backend
  image_back           = "${module.acr.acr_login_server}/ms-conference-bff"
  network_profile_id   = module.network.network_profile_id
}

# load balancer
module "load_balancer" {
  source                = "./modules/load-balancer"
  resource_group_name   = azurerm_resource_group.az-capabilities-rg.name
  location              = var.location
  vnet_id               = module.network.vnet_id
  ip_address_backend_lb = module.acg.ip_address
  public_ip_address_id  = module.network.public_ip_id
}

#monitoring
module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.az-capabilities-rg.name
  location            = var.location
  lb_id               = module.load_balancer.lb_id
}
