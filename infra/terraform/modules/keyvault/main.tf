
resource "azurerm_key_vault" "secrets" {
  tenant_id                   = var.az_tenant_id
  name                        = "${var.prefix}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  tags                        = var.common_tags
}
