terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.42.0"
    }
  }
}

provider "ibm" {
}

module "course_governance" {
  source = "./course-governance"

  ibmcloud_api_key                    = var.ibmcloud_api_key
  schematics_workspace_resource_group = var.schematics_workspace_resource_group

}
