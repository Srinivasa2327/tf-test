terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.31.0"
 /*      configuration_aliases = [
        azurerm.identity,
        azurerm.connectivity
      ] */
    }
  }
}

provider "azurerm" {
  #subscription_id = "1797cdd8-f92a-4272-ab4f-25d8ab9c0564"
  subscription_id = "5959d188-3a85-4a68-98e0-af236b3c2cac"
  alias           = "identity"
  tenant_id       = "a738da5b-465c-4cbd-a7de-1b64c889d37a"
  use_msi = true
  features {}
}

resource "azurerm_resource_group" "testRG" {
  provider = azurerm.identity
  name     = "rg-test"
  location = "westeurope"
}
