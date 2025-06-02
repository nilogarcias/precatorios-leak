variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Região Azure"
  type        = string
}

variable "prefix" {
  description = "Prefixo para nomes de recursos"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
