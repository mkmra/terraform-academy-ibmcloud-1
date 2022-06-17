# Example of Terraform IBM Cloud Academy Training

This Terraform example for IBM Cloud illustrates how to use setup the resources for training purpose and that can be de-provisioned after X mnts / Hrs using IBM Cloud Schematics.

## Instructions

1. Login into Enterprise account. 
2. Make sure that you are [assigned the correct permissions](https://cloud.ibm.com/docs/schematics?topic=schematics-access) to create workspaces and deploy resources.
3. Create the Schematics provisioner workspace:
    1. From the IBM Cloud menu select [Schematics](https://cloud.ibm.com/schematics/overview).
       - Click **Create workspace**.   
       - Enter a name for your workspace.   
       - Click **Create** to create your workspace.
    2. On the workspace **Settings** page, enter this URL - https://github.com/Cloud-Schematics/terraform-academy-ibmcloud/tree/dev
     - Select the Terraform version: Terraform 1.0 or higher
     - Click **Save template information**.
     - In the **Input variables** section,  The only one required parameter is:
         - ibmcloud_api_key of the student IBM Cloud acccount
      - Click **Save changes**.
      - The student account governance workspace is completed.
4.  Now apply your Terraform template by clicking **Apply plan**.
5.  As part of this Apply action, the PaaS services that are required for the student training will be provisioned in given students account.
6.  Also Cloud function will be created in the owner's enterprise account which will monitor the student's account resources. This cloud function cron-job will de-provision student account resources after the `X mins`.

## Compatibility

This module is meant for use with Terraform 0.13 or later.

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13 or later.
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Install

### IBM Cloud CLI

Be sure you have installed IBM Cloud plug-in for Satellite
- https://cloud.ibm.com/docs/satellite?topic=satellite-setup-cli

### Terraform

Be sure you have the correct Terraform version ( 0.13 or later), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform provider plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Usage

```
terraform init
```
```
terraform plan
```
```
terraform apply
```
```
terraform destroy
```

## Example Usage

``` hcl
module "course_governance" {
  source                              = "./course-governance"
  ibmcloud_api_key                    = var.ibmcloud_api_key
  schematics_workspace_resource_group = var.schematics_workspace_resource_group
  decomission_timer                   = var.decomission_timer
}
...
```

## Inputs

| name | description | type | required | default | sensitive |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | -------------- | ---------- | ------------------------------------ | ---- |
|  ibmcloud_api_key | Provide student's IBM Cloud APIKEY [Refer IBM Cloud Docs](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui)  |  string |  ✓   |       | ---- |
|  schematics_workspace_resource_group | Resource Group. | string  |  NA |     Default         | ---- |
|  decomission_timer | Time length to de-provision the resource after the creation. | string  |  NA |   4m   | ---- |


## Outputs

|  **Name**                  | **Description**                                    |
|  --------------------------| ---------------------------------------------------|
|  workspace_id              | Schematics worksapce Id                            |
|  job_id                    | Schematics workspace Apply Job Id                  |
|  job_created_timer         | Schematics workspace resource created time         |
|  job_decomission_timer     | schematics workspace resource de-provision time    |
|  cron_expr                 | Cron expression for cloud function trigger alarm (UTC format) |