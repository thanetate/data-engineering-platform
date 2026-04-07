/*
This is where we can define things we want to show,
to the main.tf file. To be used later. 
*/

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_account_location" {
  value = azurerm_storage_account.this.location
}


