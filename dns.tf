# Azure DNS
resource "azurerm_dns_zone" "example" {
  name                = "projectraid.com"
  resource_group_name = var.azurerm_resource_group_name
}

resource "azurerm_dns_a_record" "example" {
  name                = "example-record"
  zone_name           = azurerm_dns_zone.example.name
  resource_group_name = var.azurerm_resource_group_name
  ttl                 = 300
  records             = ["192.0.2.1"]
}

output "dns_zone_name" {
  value = azurerm_dns_zone.example.name
}