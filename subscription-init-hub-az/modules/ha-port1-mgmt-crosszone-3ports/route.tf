resource "azurerm_route_table" "internal" {
  name                = "InternalRouteTable1"
  location            = var.location
  resource_group_name = var.vnet_resourcegroup_name
}

resource "azurerm_route" "default" {
  depends_on             = [azurerm_virtual_machine.passivefgtvm]
  name                   = "default"
  resource_group_name    = var.vnet_resourcegroup_name
  route_table_name       = azurerm_route_table.internal.name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = local.activeport3
}

resource "azurerm_subnet_route_table_association" "internalassociate" {
  depends_on     = [azurerm_route_table.internal]
  subnet_id      = azurerm_subnet.privatesubnet.id
  route_table_id = azurerm_route_table.internal.id
}
