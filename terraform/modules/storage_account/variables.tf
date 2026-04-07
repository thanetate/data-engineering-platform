/*
Create variables used in the module, we are basically just defining the schema.
*/

variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_location" {
  type = string
}

variable "storage_account_tier" {
  type = string
}

variable "storage_account_replication" {
  type = string
}
