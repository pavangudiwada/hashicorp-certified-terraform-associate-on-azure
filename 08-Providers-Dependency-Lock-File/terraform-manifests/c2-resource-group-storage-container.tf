# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg1" {
  name = "myrg-1"
  location = "eastus"
}

# Resource-2: Random String 
resource "random_string" "myrandom" {
  length = 16
  special = false
  upper = false
}

# Resource-3: Azure Storage Account 
resource "azure_storage_account" "sa" {
  name = "sto${random_string.myrandom.id}"
  resource_group = azurerm_resource_group.myrg1.name 
    location                 = azurerm_resource_group.myrg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}