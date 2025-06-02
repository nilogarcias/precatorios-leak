variable "principal_id" {
  description = "ID of the principal (user, group, service principal or system identity management) to assign the role to"
  type        = string
}

variable "scope" {
  description = "Scope of the role assignment, e.g., resource group, subscription, or specific resource"
  type        = string
}

variable "role_definition_name" {
  description = "Name of the role definition to assign, e.g., 'Storage Blob Data Contributor'"
  type        = string
  default     = "Storage Blob Data Contributor"
}

resource "azurerm_role_assignment" "rbac" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}
