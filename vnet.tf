resource "azurerm_virtual_network" "vnet" {
  name                = "aks-dev-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.3.0.0/16"]
}

resource "azurerm_subnet" "apw-subnet" {
  name                 = "myAGSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.3.0.0/22"]
}

resource "azurerm_subnet" "aks-subnet" {
  name                 = "myBackendSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.3.4.0/22"]
}
resource "azurerm_public_ip" "pip" {
  name                = "aks-ingress-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}