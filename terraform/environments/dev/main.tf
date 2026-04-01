/*
This layer calls the modules and passes in the values.
*/

module "resource_group" {
  source = "../../modules/resource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}