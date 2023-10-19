#main of TF to deploy HUB subscription on WestEurope 
module "subscription-init-az" {
  source = "git::http://gitlab.oney.fr/INFMDW/terraform/Modules/subscription-init-az.git?ref=INFMDW-159"

  environment_list   = ["PRD"]
  address_space      = ["10.178.0.0/20"]
  subscription_scope = "hub"
  location           = "westeurope"

}

module "subscription-init-hub-az" {
  source = "git::http://gitlab.oney.fr/INFMDW/terraform/Modules/subscription-init-hub-az.git?ref=INFMDW-160"

  location                = module.subscription-init-az.location
  vnet_resourcegroup_name = module.subscription-init-az.vnet_resourcegroup_name
  vnet_name               = module.subscription-init-az.vnet_name
  vpn_gw_sku              = "VpnGw2"
  cidr_vpn_gw             = "10.178.0.0/27"
  cidr_fortinet_external  = "10.178.2.0/26"
  cidr_fortinet_internal  = "10.178.2.192/26"
  cidr_fortinet_ha        = "10.178.2.64/26"
  cidr_fortinet_mngt      = "10.178.2.128/26"
  cidr_front              = "10.178.4.0/24"
}
