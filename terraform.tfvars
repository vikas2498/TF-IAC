vnet_rg_name_weu = "sub-200-weu-dev-rg-net"
location = "West Europe"

tags = {
    Resource = "Resource Group"
    Environment = "Production"
    WBS = "200"
}

weu_dev_app_nsg = "sub-200-weu-dev-app-nsg"

weu_dev_db_nsg = "sub-200-weu-dev-db-nsg"

weu_dev_pe_nsg = "sub-200-weu-dev-pe-nsg"

dev_app_vnet_weu_name = "sub-200-weu-dev-vnet"

weu_dev_vnet_address_space = ["10.0.0.0/16"]

weu_dev_app_subnet = "sub-200-weu-dev-app-snt"

weu_dev_db_subnet = "sub-200-weu-dev-db-snt"

weu_dev_pe_subnet = "sub-200-weu-dev-pe-snt"

weu_dev_app_subnet_address = ["10.0.1.0/24"]

weu_dev_db_subnet_address = ["10.0.2.0/24"]

weu_dev_pe_subnet_address = ["10.0.3.0/24"]