#####################################################
# IBM Cloud - Terraform Academy Training
# Copyright 2022 IBM
#####################################################

module "course_governance" {
  source = "./course-governance"

  ibmcloud_api_key                    = var.ibmcloud_api_key
  schematics_workspace_resource_group = var.schematics_workspace_resource_group
  decomission_timer                   = var.decomission_timer
}