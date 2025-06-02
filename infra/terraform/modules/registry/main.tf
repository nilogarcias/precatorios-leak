# modules/registry/main.tf
resource "azurerm_container_registry" "functions" {
  name                = "${replace(var.prefix, "-", "")}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic" # Cost: ~$5/mês
  admin_enabled       = true
  tags                = var.common_tags
}
