terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "94a5c35a-b41a-4ffa-a37a-7d5df5344262"
  tenant_id = "18c3b4f7-e526-4f98-939a-19118361cac0" 
     }

data "azurerm_resource_group" "rg" {
  name = "rg_Training"

}

resource "azurerm_storage_account" "example" {
  name                     = "stvihademo"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    user = "viha"
  }
}
