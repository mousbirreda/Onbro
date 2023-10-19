locals {
    resource_group_name = upper("RG_${var.env}_${var.name}")
    storage_account_name= lower("ds${var.env}${var.subscription_scope}infsrv")
}


# Create the COMMON resource group in the required location
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name 
  location = var.location
  tags = {
    "application" = upper(var.name),
    "environment" = upper(var.env)
  }
}

# Create the storage account for 
resource "azurerm_storage_account" "ds" {
  count                    = var.create_default_ds ? 1 : 0
  name                     = local.storage_account_name
  location                 = var.location
  resource_group_name      = local.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"
  tags = {
    "application" = upper(var.name),
    "environment" = upper(var.env)
  } 
  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Create the file share for log app
resource "azurerm_storage_share" "shares" {
    count                    = var.create_default_ds ? 1 : 0 
    storage_account_name     = local.storage_account_name
    name                     = "appservicelog"
    quota                    = 1
    depends_on = [
    azurerm_storage_account.ds
  ]
}

# Create the container for tfstate
resource "azurerm_storage_container" "tfstate" {
    count                    = var.create_default_ds ? 1 : 0 
    storage_account_name     = local.storage_account_name
    name                     = "deploy-tf"
    container_access_type    = "private"
     depends_on = [
    azurerm_storage_account.ds
  ]
}
