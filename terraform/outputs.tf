/*
This is where we can define things we want to show, to be used later. 
Note, we need to expose these outputs here also, not just from the module outputs file.
*/

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_location" {
  value = module.resource_group.resource_group_location
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_location" {
  value = module.storage_account.storage_account_location
}

output "storage_container_name" {
  value = module.storage_account.storage_container_name
}
