/*
Outputs lets the module return values.
Example, we will need the resource group name to create a storage account.
Instead of manually harcoding that value we can get that name from the output.  
*/

output "name" {
  description = "The resource group name"
  value       = azurerm_resource_group.this.name
}

output "id" {
  description = "The resource group ID"
  value       = azurerm_resource_group.this.id
}

output "location" {
  description = "The resource group location"
  value       = azurerm_resource_group.this.location
}