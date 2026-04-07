/*
This is where we actually configure the storage account.
Using the values passed in by the root variables file.
*/

# "this" , is the local identifier for ONLY inside of this folder.
# we use it for the outputs file.
resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.storage_account_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

resource "azurerm_storage_container" "this" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.storage_container_access_type
}
