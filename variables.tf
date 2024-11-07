# File: variables.tf

variable "azurerm_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "azurerm_resource_group_location" {
  type        = string
  description = "The location of the resource group"
}

variable "app_service_plan_name" {
  type        = string
  description = "The name of the app service plan"
}

variable "function_app_name" {
  type        = string
  description = "The name of the function app"
}

variable "cosmosdb_endpoint" {
  type = string
  description = "The Cosmos DB endpoint"
}

variable "dns_zone_name" {
  type = string
  description = "The DNS zone name"
}