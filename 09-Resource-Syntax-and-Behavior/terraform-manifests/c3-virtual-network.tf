# Resource-2: Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name = "myvnet-1"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

}

# Resource-3: Create Subnet
resource "azurerm_subnet" "subnet" {
  name = "subnet1"
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes = [ "10.0.2.0/24" ]

}

# Resource-4: Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  name                = "publicip-1"
  location = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Static"
  tags = {
    "environment" = "Test"
  }
}

# Resource-5: Create Network Interface
resource "azurerm_network_interface" "nic" {
  name = "mynic-1"
  location = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}
