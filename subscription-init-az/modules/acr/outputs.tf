# Resource Group Outputs

output "name" {
  value = azurerm_container_registry.acr.name
}

output "id" {
  value = azurerm_container_registry.acr.id
}

output "admin_password" {
  value = azurerm_container_registry.acr.admin_password
}

output "admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
}