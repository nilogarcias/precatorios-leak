resource "azurerm_servicebus_namespace" "main" {
  name                = "${replace(var.prefix, "-", "")}bus"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic" # Cheapest SKU for testing
  tags                = var.common_tags
}

resource "azurerm_servicebus_topic" "fdic" {
  name         = "fundos-identificados"
  namespace_id = azurerm_servicebus_namespace.main.id
}
