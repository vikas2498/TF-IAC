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

resource "azurerm_resource_group" "rg" {
  name     = var.vnet_rg_name_weu
  location = var.location

  tags = var.tags
}
