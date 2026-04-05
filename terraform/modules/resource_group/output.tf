/*
This is where we can define things we want to show,
to the main.tf file. To be used later. 
*/

output "name" {
  value = azurerm_resource_group.this.resource_group_name
}

output "location" {
  value = azurerm_resource_group.this.resource_group_location
}


