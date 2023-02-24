resource "azurerm_virtual_network" "vnet01" {
  name                = "poctest_vnet"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  tags     = local.common_tags
}

resource "azurerm_subnet" "poctest_subnet01" {
  name                 = "poctest_subnet"
  resource_group_name  = var.azure-rg-1
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.0.0/25"]
}