/*
Outputs lets the environment return values.
Example, we will need the resource group name to create a storage account.
Instead of manually harcoding that value we can get that name from the output.  
*/

output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "resource_group_location" {
  value = module.resource_group.location
}