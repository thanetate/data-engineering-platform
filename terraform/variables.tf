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
