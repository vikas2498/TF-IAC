terraform {
backend "azurerm" {
    key                  = "Non-prod/Dev-Network-remote-file-weu.terraform.tfstate"
    resource_group_name  = "dev-tfstate-rg"
    storage_account_name = "devtfstatestgacc"
    container_name       = "devtfstatestgacc-cont"
  }
}