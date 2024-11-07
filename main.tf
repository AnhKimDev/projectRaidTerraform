terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.34.0"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
}