# Create a resource group in EastUS region - Uses Default Provider
resource "azurerm_resource_group" "eastus" {
  name = "eastusresource"
  location = "eastus"
}
#Create a resource group in WestUS region - Uses "provider2-westus" provider
resource "azurerm_resource_group" "eastus2" {
  name = "eastusresource2"
  location = "eastus2"
  provider = azurerm.provider2-eastus
}

/*
Additional Note: 
provider = <PROVIDER NAME>.<ALIAS NAME>  # This is a Meta-Argument from Resources Section nothing but a Special Argument
*/
