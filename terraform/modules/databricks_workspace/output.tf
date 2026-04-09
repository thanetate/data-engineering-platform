/*
This is where we can define things we want to show,
to the main.tf file. To be used later. 
*/

output "databricks_workspace_name" {
  value = azurerm_databricks_workspace.this.name
}

output "databricks_workspace_location" {
  value = azurerm_databricks_workspace.this.location
}


