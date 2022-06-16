# 1. Create New Resource Group
resource "ibm_resource_group" "resourceGroup" {
  name     = var.rg_name
}

# 2. Watson Studio - https://cloud.ibm.com/catalog/services/watson-studio
resource "ibm_resource_instance" "data-science-experience" {
  name              = var.ws_name
  service           = "data-science-experience"
  plan              = var.ws_plan
  location          = var.location
  resource_group_id = ibm_resource_group.resourceGroup.id
}

output "watson-studio-dashboard-url" {
  value       = ibm_resource_instance.data-science-experience.dashboard_url
  description = "Watson Studio Dashboard URL"
  sensitive   = false
}

# 3. Machine Learning - https://cloud.ibm.com/catalog/services/machine-learning
resource "ibm_resource_instance" "pm-20" {
  name              = var.ml_name
  service           = "pm-20"
  plan              = var.ml_plan
  location          = var.location
  resource_group_id = ibm_resource_group.resourceGroup.id
}

output "machine-learning-dashboard-url" {
  value       = ibm_resource_instance.pm-20.dashboard_url
  description = "Machine Learning Service Dashboard URL"
  sensitive   = false
}

# 4. Blockchain Platform - https://cloud.ibm.com/catalog/services/blockchain-platform
resource "ibm_resource_instance" "blockchain" {
  name              = var.bch_name
  service           = "blockchain"
  plan              = "standard"
  location          = var.location
  resource_group_id = ibm_resource_group.resourceGroup.id
}

output "blockchain-dashboard-url" {
  value       = ibm_resource_instance.blockchain.dashboard_url
  description = "blockchain Service Dashboard URL"
  sensitive   = false
}

# 5.IOT Platform - https://cloud.ibm.com/catalog/services/internet-of-things-platform
resource "ibm_resource_instance" "iotf-service" {
    name = var.iot_name
    service = "iotf-service"
    plan = "iotf-service-free"
    location = var.location
    resource_group_id = ibm_resource_group.resourceGroup.id
  }

  output "iot-service-dashboard-url" {
  value       = ibm_resource_instance.iotf-service.dashboard_url
  description = "IOT Service Dashboard URL"
  sensitive   = false
}
