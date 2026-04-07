/*
This is where we actually configure the resource group.
Using the values passed in by the root variables file.
*/

# "this" , is the local identifier for ONLY inside of this folder.
# we use it for the outputs file.
resource "azurerm_resource_group" "this" {
  # what azure expects = the value we are passing in
  name     = var.resource_group_name
  location = var.resource_group_location
}
