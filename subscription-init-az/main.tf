locals {
  //
  region_code_map = tomap({
    "westeurope"  = "WE"
    "northeurope" = "NE"
  })

  code_env = contains(var.environment_list, "PRD") ? "PRD" : "NPRD"

  ############
  rg_prd_network_name = upper("rg_prd_network")

}

/* #Already exists created manually
# Create RG per ENV for storage
module "ressource_group" {
  for_each           = toset(var.environment_list)
  source             = "./modules/ressource_group"
  env                = each.key
  name               = "INFMDW"
  create_default_ds  = true
  location           = var.location
  subscription_scope = var.subscription_scope
}
*/

# Create RG COMMON
module "ressource_group_common" {
  source             = "./modules/ressource_group"
  env                = local.code_env
  name               = "COMMON"
  create_default_ds  = false
  location           = var.location
  subscription_scope = var.subscription_scope
}



# Create RG for Sub for vnet
module "ressource_group_vnet" {
  source            = "./modules/ressource_group"
  name              = "NETWORK"
  env               = local.code_env
  location          = var.location
  create_default_ds = false
}

resource "azurerm_virtual_network" "vn" {
  name                = upper("VN_${local.code_env}_${var.subscription_scope}_${local.region_code_map[var.location]}")
  resource_group_name = module.ressource_group_vnet.name
  address_space       = var.address_space
  location            = var.location
  depends_on = [
    module.ressource_group_vnet
  ]
}