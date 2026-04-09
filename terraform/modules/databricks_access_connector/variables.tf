/*
Create variables used in the module, we are basically just defining the schema.
*/

variable "databricks_access_connector_name" {
  type = string
}

variable "databricks_access_connector_resource_group_name" {
  type = string
}

variable "databricks_access_connector_location" {
  type = string
}

variable "databtricks_access_connector_identity" {
  type = string
}
