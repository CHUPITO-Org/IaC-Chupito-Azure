resource "azurerm_storage_account" "storage" {
  name                     = "storagechupito"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_share" "storage_share" {
  name                 = "fschupito"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}
