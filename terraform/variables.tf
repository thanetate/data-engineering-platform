/*
Create variables used in main.tf
We set the actual values in terraform.tfvars
*/

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "Resource group location"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name (must be globally unique, 3-24 lowercase letters and numbers)"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier"
}

variable "storage_account_replication" {
  type        = string
  description = "Storage account replication type"
}

variable "storage_container_name" {
  type        = string
  description = "Storage container name for raw Kaggle data"
}

variable "storage_container_access_type" {
  type        = string
  description = "Storage container access type (private, blob, or container)"
}

variable "databricks_workspace_name" {
  type        = string
  description = "Azure databricks workspace name"
}

variable "databricks_workspace_sku" {
  type        = string
  description = "Azure databricks workspace sku"
}

variable "databricks_access_connector_name" {
  type        = string
  description = "Azure databricks access connector name"
}

variable "databricks_access_connector_identity" {
  type        = string
  description = "Azure databricks connector identity"
}


