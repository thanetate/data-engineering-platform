/*
This is the actual reusable part of the infra code. 
Instead of hardcoding the resource group in environments/dev, 
we can wrap it in a Module to reuse.

location - Required, the region 
name - Required
managed_by - Optional, the Id of the resource that manages this RG
tags - Optional

id - this attribute is exported. 
*/

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location 

  tags = var.tags
}