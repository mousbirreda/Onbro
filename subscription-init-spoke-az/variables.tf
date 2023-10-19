variable "spoke_vnet_resourcegroup_name" {
  description = "Nom du resource group (rg) du spoke contenant le vnet"
  type        = string
  default     = "RG_PRD_NETWORK"
}

variable "spoke_vnet_name" {
  description = "Nom du virtual network (vnet) du spoke"
  type        = string
}

variable "hub_vnet_resourcegroup_name" {
  description = "Nom du resource group (rg) du hub contenant le vnet"
  type        = string
  default     = "RG_PRD_NETWORK"
}

variable "hub_vnet_name" {
  description = "Nom du virtual network (vnet) du hub"
  type        = string
  default     = "VN_PRD_HUB_WE"
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "westeurope"
}

