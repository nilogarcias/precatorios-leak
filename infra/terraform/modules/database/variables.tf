variable "resource_group_name" {
  description = "Resource Group name where resources will be created"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names, used to ensure uniqueness"
  type        = string
}

variable "keyvault_id" {
  type        = string
  description = "Azure Key Vault ID where secrets will be stored"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
