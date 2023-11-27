resource "azurerm_storage_account" "storage" {
  name                     = "storagedb"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags = {
    environment = "chupito"
  }
}

resource "azurerm_storage_share" "storage_share" {
  name                 = "fs-db"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50

}
