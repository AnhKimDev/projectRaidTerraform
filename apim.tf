resource "azurerm_api_management" "management" {
  name                = "projectraid-apim"
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location
  publisher_name      = "Imaginary ProjectRaid company"
  publisher_email     = "your_email@example.com"
  sku_name            = "Developer_1"
}

resource "azurerm_api_management_api" "apim" {
  name                = "projectraid-api"
  resource_group_name = var.azurerm_resource_group_name
  api_management_name = azurerm_api_management.management.name
  revision            = "1"
  display_name        = "ProjectRaid API"
  path                = "projectraid"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_policy" "example" {
  api_name            = azurerm_api_management_api.apim.name
  api_management_name = azurerm_api_management.management.name
  resource_group_name = var.azurerm_resource_group_name

  xml_content = file("policy.xml")
}

