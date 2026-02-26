terraform {
backend "azurerm" {
    key                  = "Non-prod/Dev-Network-remote-file-weu.terraform.tfstate"
    resource_group_name  = "dev-tfstate-rg"
    storage_account_name = "devtfstatestgacc"
    container_name       = "devtfstatestgacc-cont"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.61.0"
    }
  }
}

provider "azurerm" {
  features{}
}

#resource group for dev network resources

resource "azurerm_resource_group" "rg" {
  name     = var.vnet_rg_name_weu
  location = var.location

  tags = var.tags
}
resource "azurerm_network_security_group" "weu-dev-app-nsg" {
    name = var.weu_dev_app_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

resource "azurerm_network_security_group" "weu-dev-db-nsg" {
    name = var.weu_dev_db_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

resource "azurerm_network_security_group" "weu-dev-pe-nsg" {
    name = var.weu_dev_pe_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

resource "azurerm_network_security_group" "weu-dev-webapp-nsg" {
    name = var.weu_dev_webapp_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

resource "azurerm_virtual_network" "dev-app-vnet-weu" {
 name = var.dev_app_vnet_weu_name
 location = var.location
 resource_group_name = var.vnet_rg_name_weu
 address_space = var.weu_dev_vnet_address_space

 subnet {
    name = var.weu_dev_app_subnet
    address_prefixes = var.weu_dev_app_subnet_address
    security_group = azurerm_network_security_group.weu-dev-app-nsg.id
 }
subnet {
    name = var.weu_dev_db_subnet
    address_prefixes = var.weu_dev_db_subnet_address
    security_group = azurerm_network_security_group.weu-dev-db-nsg.id
 }
 subnet {
    name = var.weu_dev_pe_subnet
    address_prefixes = var.weu_dev_pe_subnet_address
    security_group = azurerm_network_security_group.weu-dev-pe-nsg.id
 }

}

resource "azurerm_subnet" "webapp" {
  name                 = var.weu_dev_webapp_subnet
  resource_group_name  = var.vnet_rg_name_weu
  virtual_network_name = azurerm_virtual_network.dev-app-vnet-weu.name
  address_prefixes     = var.weu_dev-webapp_subnet_address
}

resource "azurerm_subnet_network_security_group_association" "webapp-nsg" {
  subnet_id                 = azurerm_subnet.webapp.id
  network_security_group_id = azurerm_network_security_group.weu-dev-webapp-nsg.id
}