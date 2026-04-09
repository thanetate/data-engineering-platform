/*
This is where we actually configure the resource group.
Using the values passed in by the root variables file.
*/

# "this" , is the local identifier for ONLY inside of this folder.
# we use it for the outputs file.

resource "azurerm_databricks_access_connector" "this" {
  # what azure expects = the value we are passing in
  name                = var.databricks_access_connector_name
  resource_group_name = var.databricks_access_connector_resource_group_name
  location            = var.databricks_access_connector_location

  identity {
    type = var.databtricks_access_connector_identity
  }
}
