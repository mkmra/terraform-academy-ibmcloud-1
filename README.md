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

## Requirements

|  **Name**                  | **Version** |
|  --------------------------| -------------|
|  terraform                 | ~> 1.0 |
|  terraform_provider_ibm    | ~> 1.33 |


## Inputs

| name | description | type | required | default | sensitive |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | -------------- | ---------- | ------------------------------------ | ---- |
|  ibmcloud_api_key | Provide student's IBM Cloud APIKEY [Refer IBM Cloud Docs](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui)  |  string |  ✓   |       | ---- |
|  schematics_workspace_resource_group | Resource Group. | string  |  ✓ |     Default         | ---- |