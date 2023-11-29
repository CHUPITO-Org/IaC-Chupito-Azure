# Storage Account
resource "azurerm_storage_account" "storage" {
  name                            = "storagedb"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = true
}

# File share to container volume
resource "azurerm_storage_share" "storage_share" {
  name                 = "fsdb"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_key" {
  value = azurerm_storage_account.storage.primary_access_key
}

output "share_name" {
  value = azurerm_storage_share.storage_share.name
}

