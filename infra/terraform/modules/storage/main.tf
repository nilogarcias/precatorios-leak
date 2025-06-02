resource "azurerm_storage_account" "reports" {
  name                     = "${var.prefix}reports"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS" # Local Replication - cheaper than GRS

  blob_properties {
    versioning_enabled = false
    # account_tier       = "Cool"
  }
}

resource "azurerm_storage_container" "html" {
  name                  = "fdic-reports-html"
  storage_account_name  = azurerm_storage_account.reports.name
  container_access_type = "private"
}

# Integration with Azure Functions
resource "azurerm_eventgrid_system_topic" "blob_events" {
  name                   = "${var.prefix}-blob-events"
  resource_group_name    = var.resource_group_name
  location               = "global" # Event Grid é global
  source_arm_resource_id = azurerm_storage_account.reports.id
  topic_type             = "Microsoft.Storage.StorageAccounts"
}

resource "azurerm_eventgrid_system_topic_event_subscription" "function_trigger" {
  name                = "function-trigger"
  system_topic        = azurerm_eventgrid_system_topic.blob_events.name
  resource_group_name = var.resource_group_name

  azure_function_endpoint {
    function_id = "${azurerm_function_app.processor.id}/functions/ProcessReport"
  }
}
