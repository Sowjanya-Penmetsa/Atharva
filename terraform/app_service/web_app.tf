provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "storage_rg"
    storage_account_name = "storageaccfortfstate"
    container_name       =  "storage_container"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "web_app_rg" {
  name     = "web_app_rg"
  location = "northcentralus"
  
}

resource "azurerm_app_service_plan" "web_app_service_plan" {  
  name                = "web_app_service_plan"  
  location            = azurerm_resource_group.web_app_rg.location  
  resource_group_name = azurerm_resource_group.web_app_rg.name  
  
  sku {  
    tier = "Standard"  
    size = "S1"  
  }  
}  
  
resource "azurerm_app_service" "web_app_service" {  
  name                = "webappservice2022"  
  location            =  azurerm_resource_group.web_app_rg.location  
  resource_group_name = azurerm_resource_group.web_app_rg.name 
  app_service_plan_id = azurerm_app_service_plan.web_app_service_plan.id  
   
}