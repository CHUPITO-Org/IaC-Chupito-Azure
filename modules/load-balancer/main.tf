resource "azurerm_lb" "lb" {
  name                = "az-capabilities-publiclb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "az-capabilities-lb-frontend_ip"
    public_ip_address_id = var.public_ip_address_id
  }

}

resource "azurerm_lb_rule" "lb_rule_front" {
  name                           = "az-capabilities-lb_rule_front"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_address_pool.id]
}

resource "azurerm_lb_rule" "lb_rule_back" {
  name                           = "az-capabilities-lb_rule_bac"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 5002
  backend_port                   = 5002
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_address_pool.id]
}

resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "backend-address"
}

resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_pool_address" {
  name                    = "backend_pool_address"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_address_pool.id
  virtual_network_id      = var.vnet_id
  ip_address              = var.ip_address_backend_lb
}

resource "azurerm_lb_probe" "lb-probe-front" {
  name            = "lb-probe-front"
  loadbalancer_id = azurerm_lb.lb.id
  port            = 80
  protocol        = "Tcp"
}

resource "azurerm_lb_probe" "lb-probe-back" {
  name            = "lb-probe-back"
  loadbalancer_id = azurerm_lb.lb.id
  port            = 5002
  protocol        = "Tcp"
}


output "lb_id" {
  value = azurerm_lb.lb.id
}
