output "postgres_connection_string" {
  value     = "Server=${azurerm_postgresql_flexible_server.main.fqdn};Database=${azurerm_postgresql_flexible_server_database.main.name};Port=5432;User Id=${azurerm_postgresql_flexible_server.main.administrator_login};Password=${azurerm_postgresql_flexible_server.main.administrator_password}"
  sensitive = true
}

output "jddb_connection_string" {
  value     = "postgresql://${azurerm_postgresql_flexible_server.main.administrator_login}:${random_password.db_password.result}@${azurerm_postgresql_flexible_server.main.fqdn}:5432/postgres?sslmode=require"
  sensitive = true
}

output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}
