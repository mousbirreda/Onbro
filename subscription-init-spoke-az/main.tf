
#data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "spoke" {
  resource_group_name = var.spoke_vnet_resourcegroup_name
  name                = var.spoke_vnet_name
}

data "azurerm_virtual_network" "hub" {
  provider            = "hubwe"
  resource_group_name = var.hub_vnet_resourcegroup_name
  name                = var.hub_vnet_name
}

resource "azurerm_virtual_network_peering" "spoke_hub" {
  name                      = "spoke_hub"
  resource_group_name       = var.spoke_vnet_resourcegroup_name
  virtual_network_name      = var.spoke_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "hub_spoke" {
  provider                  = "hubwe"
  name                      = "hub_spoke"
  resource_group_name       = var.hub_vnet_resourcegroup_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.spoke.id
}


