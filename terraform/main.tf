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
}

# create a resource group using modules
module "resource_group" {
  # show the path to the module
  source = "./modules/resource_group"

  # what the module expects = what we are passing in 
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}
