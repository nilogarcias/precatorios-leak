locals {
  # === Common tags for all resources ===
  common_tags = {
    Project     = var.prefix
    Environment = var.environment
    Owner       = "PNDevOpsTeam"
    DeployedBy  = "Terraform"
  }

  # === Standard naming convention ===
  resource_suffix = "-res"

  # Local variables for resource group and location
  default_location = var.location

  # === Configurações de rede (se aplicável) ===
  vnet_address_space = "10.0.0.0/16"
  subnet_prefix      = "10.0.1.0/24"

  # Logging configuration for resources
  logging_config = {
    retention_in_days = 7
    audit_enabled     = true
  }
}
