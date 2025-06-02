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

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "az_tenant_id" {
  description = "Azure Tenant ID"
  sensitive   = true
}
