/*
This is where we will call:
    1. Terraform init
    2. Terraform plan
    3. Terraform apply

We need to configure the provider first then we can call the modules. 
*/

# Azure Note - We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# configure the Azure Resource Manager (ARM) provider
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

# create a resource group using modules
module "resource_group" {
  # show the path to the module
  source = "./modules/resource_group"

  # what the module expects = what we are passing in 
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

# create a storage account using modules
module "storage_account" {
  source = "./modules/storage_account"

  # what the module expects = what we are passing in 
  storage_account_name          = var.storage_account_name
  resource_group_name           = module.resource_group.resource_group_name
  storage_account_location      = module.resource_group.resource_group_location
  storage_account_tier          = var.storage_account_tier
  storage_account_replication   = var.storage_account_replication
  storage_container_name        = var.storage_container_name
  storage_container_access_type = var.storage_container_access_type
}

# create an azure databricks workspace using modules
module "databricks_workspace" {
  source = "./modules/databricks_workspace"

  # what the module expects = what we are passing in
  databricks_workspace_name                = var.databricks_workspace_name
  databricks_workspace_resource_group_name = module.resource_group.resource_group_name
  databricks_workspace_location            = module.resource_group.resource_group_location
  databricks_workspace_sku                 = var.databricks_workspace_sku

}

# create an azure databricks access connector using modules
module "databricks_access_connector" {
  source = "./modules/databricks_access_connector"

  # what the module expects = what we are passing in
  databricks_access_connector_name                = var.databricks_access_connector_name
  databricks_access_connector_resource_group_name = module.resource_group.resource_group_name
  databricks_access_connector_location            = module.resource_group.resource_group_location
  databtricks_access_connector_identity           = var.databricks_access_connector_identity
}
