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
