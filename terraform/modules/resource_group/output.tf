/*
This is where we can define things we want to show,
to the main.tf file. To be used later. 
*/

output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "resource_group_location" {
  value = azurerm_resource_group.this.location
}


