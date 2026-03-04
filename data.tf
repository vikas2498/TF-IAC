data "azurerm_resource_group" "dev-vnet-rg" {
    name = var.vnet_rg_name_weu
}

data "azurerm_virtual_network" "dev-vnet" {
  name                = var.dev_app_vnet_weu_name
  resource_group_name = data.azurerm_resource_group.dev-vnet-rg.name
}

data "azurerm_subnet" "dev-app-subnet" {
  name                 = var.weu_dev_app_subnet
  virtual_network_name = data.azurerm_virtual_network.dev-vnet.name
  resource_group_name  = data.azurerm_resource_group.dev-vnet-rg.name
}

output "virtual_network_id" {
  value = data.azurerm_virtual_network.dev-vnet.id
}

output "subnet_id" {
  value = data.azurerm_subnet.dev-app-subnet.id
}