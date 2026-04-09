/*
This is where we keep the values for the variables file.
So that if they need to change we can change out the terraform.tfvars file.
Naming convention, I am going to use an incrementing identifier pattern (a00001)
*/

resource_group_name     = "a00001-resource-group"
resource_group_location = "Central US"

storage_account_name                 = "dpstoragea00001"
storage_account_tier                 = "Standard"
storage_account_replication          = "LRS"
storage_container_name               = "a00001-container"
storage_container_access_type        = "private"
databricks_workspace_name            = "databricks-workspace"
databricks_workspace_sku             = "standard"
databricks_access_connector_name     = "databricks-connector"
databricks_access_connector_identity = "SystemAssigned"
