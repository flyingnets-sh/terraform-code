resource "azurerm_virtual_network" "vnet01" {
  name                = "poctest_vnet"
  address_space       = ["10.0.0.0/24"]
  resource_group_name      = var.azure-rg-1
  location                 = var.loc1
  tags = {
    Environment = var.environment_tag
  }
  depends_on = [
    azurerm_resource_group.rg1
  ]
}

resource "azurerm_subnet" "poctest_subnet01" {
  name                 = "poctest_subnet"
  resource_group_name  = var.azure-rg-1
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.0.0/25"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}