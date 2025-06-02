output "keyvault_name" {
  value = azurerm_key_vault.secrets.name
}

output "keyvault_id" {
  value = azurerm_key_vault.secrets.id
}
