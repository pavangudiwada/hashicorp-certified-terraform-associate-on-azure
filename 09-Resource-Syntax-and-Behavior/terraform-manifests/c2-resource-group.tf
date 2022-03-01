# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg1" {
  name = "rg-1"
  location = "eastus"  
}