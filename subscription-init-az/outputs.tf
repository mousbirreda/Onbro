output "location" {
  value = var.location
}

output "vnet_resourcegroup_name" {
  value = module.ressource_group_vnet.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vn.name
}

