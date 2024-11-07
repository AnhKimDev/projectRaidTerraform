# Azure CosmosDB
resource "azurerm_cosmosdb_account" "db_account" {
  name                = "projectraid-cosmosdb"
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.azurerm_resource_group_location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "my-database"
  resource_group_name = var.azurerm_resource_group_name
  account_name        = azurerm_cosmosdb_account.db_account.name
  depends_on          = [azurerm_cosmosdb_account.db_account] # Add dependency on CosmosDB account
}

resource "azurerm_api_management_backend" "cosmosdb_backend" {
  name                = "cosmosdb-backend"
  resource_group_name = var.azurerm_resource_group_name
  api_management_name = azurerm_api_management.management.name
  protocol            = "http"
  url                 = "https://${azurerm_cosmosdb_account.db_account.name}.documents.azure.com:443/"
}

output "cosmosdb_endpoint" {
  value = azurerm_cosmosdb_account.db_account.endpoint
}