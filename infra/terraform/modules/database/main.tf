resource "azurerm_postgresql_flexible_server" "main" {
  name                   = "${var.prefix}-pg-server"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "13"
  administrator_login    = "adminprecatorios"
  administrator_password = random_password.db_password.result
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
  zone                   = "1"
  tags                   = var.common_tags
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_postgresql_flexible_server_database" "main" {
  name      = "${var.prefix}-db"
  server_id = azurerm_postgresql_flexible_server.main.id
  charset   = "UTF8"
  collation = "en_US.UTF8"
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  value        = random_password.db_password.result
  key_vault_id = var.keyvault_id
}
