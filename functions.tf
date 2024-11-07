# Azure Functions
resource "azurerm_app_service_plan" "splan" {
  name                = var.app_service_plan_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  kind                = "FunctionApp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

    lifecycle {
    ignore_changes = [
      # List attributes to ignore
      reserved
    ]
  }
}

resource "azurerm_function_app" "projectraid_app" {
  name                = var.function_app_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  app_service_plan_id = azurerm_app_service_plan.splan.id
  version             = "~3"
  storage_account_name = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  os_type = "linux"

  depends_on = [azurerm_storage_account.storage_account]
}

output "function_app_hostname" {
  value = azurerm_function_app.projectraid_app.default_hostname
}