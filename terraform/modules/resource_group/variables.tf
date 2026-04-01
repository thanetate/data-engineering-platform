/*
The module main.tf file should accept inputs instead of hardcoded values. 
*/

variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default     = {}
}