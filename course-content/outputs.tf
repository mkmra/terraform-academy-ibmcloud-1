#####################################################
# IBM Cloud - Terraform Academy Training
# Copyright 2022 IBM
#####################################################

output "watson-studio-dashboard-url" {
  value       = ibm_resource_instance.data-science-experience.dashboard_url
  description = "Watson Studio Dashboard URL"
  sensitive   = false
}

output "machine-learning-dashboard-url" {
  value       = ibm_resource_instance.pm-20.dashboard_url
  description = "Machine Learning Service Dashboard URL"
  sensitive   = false
}

output "blockchain-dashboard-url" {
  value       = ibm_resource_instance.blockchain.dashboard_url
  description = "blockchain Service Dashboard URL"
  sensitive   = false
}

output "iot-service-dashboard-url" {
  value       = ibm_resource_instance.iotf-service.dashboard_url
  description = "IOT Service Dashboard URL"
  sensitive   = false
}