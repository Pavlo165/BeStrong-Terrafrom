resource "azurerm_dns_zone" "main" {
  name                = "bestronger.pp.ua"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_dns_a_record" "aks_ingress" {
  name                = "www"
  zone_name           = azurerm_dns_zone.main.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 300
  records             = [azurerm_public_ip.aks_ingress_ip.ip_address]
}

resource "azurerm_dns_a_record" "aks_ingress_www" {
  name                = "@"
  zone_name           = azurerm_dns_zone.main.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 300
  records             = [azurerm_public_ip.aks_ingress_ip.ip_address]
}