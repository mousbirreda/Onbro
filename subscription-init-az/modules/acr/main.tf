################################################################################
# Create ACR if not exist / Need an ACR


locals {
  resource_group_name = var.resource_group_name !="" ? var.resource_group_name : upper("RG_${var.env}_${var.application_name}")
  acr_name= lower("acroney${var.env}${replace(var.application_name, "_", "")}")
}

resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  resource_group_name = local.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = true

  tags = merge( {
    application = var.application_name
  } , var.env != "" ? 
  {
    environment = var.env
  } : {}
  )

}
