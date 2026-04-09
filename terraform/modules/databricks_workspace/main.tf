/*
This is where we actually configure the resource group.
Using the values passed in by the root variables file.
*/

# "this" , is the local identifier for ONLY inside of this folder.
# we use it for the outputs file.

resource "azurerm_databricks_workspace" "this" {
  # what azure expects = the value we are passing in
  name                = var.databricks_workspace_name
  resource_group_name = var.databricks_workspace_resource_group_name
  location            = var.databricks_workspace_location
  sku                 = var.databricks_workspace_sku
}
