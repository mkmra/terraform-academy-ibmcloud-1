variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
}

variable "schematics_workspace_resource_group" {
  description = "The ID of the resource group where you want to provision the workspace."
  type        = string
  default       = "Default"
}
