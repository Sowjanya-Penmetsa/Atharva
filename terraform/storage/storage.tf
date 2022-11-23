terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "storage_rg" {
  name     = "storage_rg33"
  location = "northcentralus"
}

resource "azurerm_storage_account" "storage_acc_for_tfstate" {
  name                     = "storageaccfortfstate33"
  resource_group_name      = azurerm_resource_group.storage_rg.name
  location                 = azurerm_resource_group.storage_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storage_acc_for_tfstate" {
  name                  = "storage-container"
  storage_account_name  = azurerm_storage_account.storage_acc_for_tfstate.name
  container_access_type = "blob"
}
