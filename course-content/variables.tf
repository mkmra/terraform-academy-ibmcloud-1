# Resource Group 
variable "rg_name" {
  description = "Resource Groupr Name"
  type        = string
  default     = "VIT-Training-RG"
}

# Student API key
variable "ibmcloud_api_key" {
  description = "Student API key to provision services required for training."
  type        = string
}


# Common
variable "location" {
  description = "Provisioning Region/Location for the instance"
  type        = string
  default     = "us-south"
}

# Watson Studio - https://cloud.ibm.com/catalog/services/watson-studio
variable "ws_name" {
  description = "Watson Studio service instance name"
  type        = string
  default     = "VIT-watson-studio-service"
}

variable "ws_plan" {
  description = "Watson Studio service instance Plan"
  type        = string
  default     = "free-v1" # Other supported plan 'enterprise-v1'.
}

# Machine Learning - https://cloud.ibm.com/catalog/services/machine-learning
variable "ml_name" {
  description = "Machine Learning service instance name"
  type        = string
  default     = "VIT-machine-learning-service"
}

variable "ml_plan" {
  description = "Watson Studio service instance Plan"
  type        = string
  default     = "lite" # Other supported plans 'v2-standard/v2-professional'.
}

# Blockchain Platform - https://cloud.ibm.com/catalog/services/blockchain-platform
variable "bch_name" {
  description = "Blockchain Platform service instance name"
  type        = string
  default     = "VIT-blockchain-service"
}

# IOT Platform - https://cloud.ibm.com/catalog/services/internet-of-things-platform
variable "iot_name" {
  description = "Blockchain Platform service instance name"
  type        = string
  default     = "VIT-iot-service"
}