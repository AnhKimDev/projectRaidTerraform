# Azure Blob Storage
resource "azurerm_storage_account" "storage_account" {
  name                     = "storagepraccount"
  resource_group_name      = var.azurerm_resource_group_name
  location                 = var.azurerm_resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "projectraid-container"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
