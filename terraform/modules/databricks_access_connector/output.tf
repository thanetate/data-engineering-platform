/*
This is where we can define things we want to show,
to the main.tf file. To be used later. 
*/

output "databricks_access_connector_name" {
  value = azurerm_databricks_access_connector.this.name
}

output "databricks_access_connector_location" {
  value = azurerm_databricks_access_connector.this.location
}

output "databtricks_access_connector_identity" {
  value = azurerm_databricks_access_connector.this.identity
}

