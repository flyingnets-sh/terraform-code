resource "azurerm_storage_account" "storage_account_test" {
  name                     = "gregstorage0224"
  resource_group_name      = var.azure-rg-1
  location                 = var.loc1
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
      default_action = "Deny"
      #Error: "network_rules.0.ip_rules.0" must start with IPV4 address and/or slash, number of bits (0-30) as prefix. Example: 23.45.1.0/30.
      ip_rules = ["${chomp(data.http.clientip.response_body)}/30"]
      virtual_network_subnet_ids = [azurerm_subnet.poctest_subnet01.id]
  }

  tags = {
    Environment = var.environment_tag
  }
}