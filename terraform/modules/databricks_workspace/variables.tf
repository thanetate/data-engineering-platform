/*
Create variables used in the module, we are basically just defining the schema.
*/

variable "databricks_workspace_name" {
  type = string
}

variable "databricks_workspace_resource_group_name" {
  type = string
}

variable "databricks_workspace_location" {
  type = string
}

variable "databricks_workspace_sku" {
  type = string
}
