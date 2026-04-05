/*
This is where we can define things we want to show, to be used later. 
Note, we need to expose these outputs here also, not just from the module outputs file.
*/

output "name" {
  value = module.resource_group.name
}

output "location" {
  value = module.resource_group.location
}
