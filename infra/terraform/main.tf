resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
  az_tenant_id        = var.az_tenant_id
  common_tags         = local.common_tags
}

module "database" {
  source              = "./modules/database"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
  keyvault_id         = module.keyvault.keyvault_id
  common_tags         = local.common_tags
}

module "service_bus" {
  source              = "./modules/service_bus"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
  common_tags         = local.common_tags
}

module "registry" {
  source              = "./modules/registry"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = var.prefix
  common_tags         = local.common_tags
}
