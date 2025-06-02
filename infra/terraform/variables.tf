variable "location" {
  description = "Azure region"
  default     = "eastus"
}

variable "prefix" {
  description = "Prefix for the resource names"
  default     = "precatleaks"
}

variable "environment" {
  description = "Environment tag (e.g., dev, staging, prod)"
  default     = "dev"
}

variable "az_subscription_id" {
  description = "Azure Subscription ID"
  sensitive   = true
}

variable "az_client_id" {
  description = "Azure Service Principal App ID"
  sensitive   = true
}

variable "az_client_secret" {
  description = "Azure Service Principal Password"
  sensitive   = true
}

variable "az_tenant_id" {
  description = "Azure Tenant ID"
  sensitive   = true
}
