terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "CloudCOE" {
  name = "CloudCOE"
  location = "eastus"
}

resource "azurerm_storage_account" "storagesandeep" {
  name                     = "storagesandeep"
  resource_group_name      = azurerm_resource_group.CloudCOE.name
  location                 = azurerm_resource_group.CloudCOE.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blobsandeep" {
  name                  = "blobsandeep"
  storage_account_name  = azurerm_storage_account.storagesandeep.name
  container_access_type = "private"
}

resource "azurerm_storage_queue" "queuesandeep" {
  name                 = "queuesandeep"
  storage_account_name = azurerm_storage_account.storagesandeep.name
}