#Providers declaration

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.59.0"
    }
  }
}

terraform {
  backend "azurerm" {
  }
}

################################################################################
# configure the azure provider
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
  environment = "public"
}

# Recuperation object id du user de deploiement
data "azurerm_client_config" "current" {
}
