/*
The environments main.tf file should accept inputs instead of hardcoded values. 
*/

variable "resource_group_name" {
  description = "Name of the dev resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags for the dev environment"
  type        = map(string)
  default     = {}
}