resource "azurerm_storage_account" "log_storage" {
  name                            = "capabilitieslogstorage"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = true
}

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = "logworkspace"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "monitor-logging" {
  name                       = "az-capabilities-monitor-logging"
  target_resource_id         = var.lb_id
  storage_account_id         = azurerm_storage_account.log_storage.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id

  log {
    category = "LoadBalancerAlertEvent"
    enabled  = true
  }

  log {
    category = "LoadBalancerProbeHealthStatus"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
  }

}
