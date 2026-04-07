/*
This is where we keep the values for the variables file.
So that if they need to change we can change out the terraform.tfvars file.
*/

resource_group_name     = "data-engineering-platform-resourcegroup"
resource_group_location = "Central US"

storage_account_name        = "depstorage001"
storage_account_tier        = "Standard"
storage_account_replication = "LRS"
