vnet_rg_name_weu = "sub-200-weu-dev-rg-net"
location = "West Europe"

tags = {
    Resource = "Resource Group"
    Environment = "Development"
    WBS = "200"
}

weu_dev_app_nsg = "sub-200-weu-dev-app-nsg"

weu_dev_db_nsg = "sub-200-weu-dev-db-nsg"

weu_dev_pe_nsg = "sub-200-weu-dev-pe-nsg"

weu_dev_webapp_nsg = "sub-200-weu-dev-webapp-nsg"

weu_dev_sfc_nsg = "sub-200-weu-dev-sfc-nsg"

dev_app_vnet_weu_name = "sub-200-weu-dev-vnet"

weu_dev_vnet_address_space = ["10.0.0.0/16"]

weu_dev_app_subnet = "sub-200-weu-dev-app-snt"

weu_dev_db_subnet = "sub-200-weu-dev-db-snt"

weu_dev_pe_subnet = "sub-200-weu-dev-pe-snt"

weu_dev_webapp_subnet = "sub-200-weu-dev-webapp-snt"

weu_dev_sfc_subnet = "sub-200-weu-sfc-snt"

weu_dev_app_subnet_address = ["10.0.1.0/24"]

weu_dev_db_subnet_address = ["10.0.2.0/24"]

weu_dev_pe_subnet_address = ["10.0.3.0/24"]

weu_dev-webapp_subnet_address = ["10.0.4.0/24"]

weu_dev_sfc_subnet_address = ["10.0.5.0/24"]

D01_rg = "sub-200-weu-dev-rg-D01"

D01_VM_Name = "200weuwappd01"

D01_VM_Size = "Standard_B2s"

D02_rg_name = "sub-200-weu-dev-rg-D02"

D02_location = "West Europe"

D02_vms = {
    200weulappd0201 = {
    os_type         = "linux"
    vm_size         = "Standard_B2s"
    vnet_name       = "sub-200-weu-dev-vnet"
    subnet_name     = "sub-200-weu-dev-app-snt"
    private_ips     = ["10.0.1.5","10.0.1.6","10.0.1.7"]
    admin_username  = "linux_azure_user"
    admin_password  = "password@12345"
    os_disk_caching = "ReadWrite"
    os_storage_account_type = "Standard_LRS"
    os_disk_sizeGB  = "128"
    publisher = "suse"
    offer     = "sles-15-sp5"
    sku       = "gen1"
    version   = "latest"
    }

    200weuwappd0201 = {
    os_type         = "windows"
    vm_size         = "Standard_B2s"
    vnet_name       = "sub-200-weu-dev-vnet"
    subnet_name     = "sub-200-weu-dev-app-snt"
    private_ips     = ["10.0.1.8","10.0.1.9"]
    admin_username  = "windows_azure_user"
    admin_password  = "password@12345"
    os_disk_caching = "ReadWrite"
    os_storage_account_type = "Standard_LRS"
    os_disk_sizeGB  = "128"
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
    }

    200weuwappd0202 = {
    os_type         = "windows"
    vm_size         = "Standard_B2s"
    vnet_name       = "sub-200-weu-dev-vnet"
    subnet_name     = "sub-200-weu-dev-app-snt"
    private_ips     = ["10.0.1.10"]
    admin_username  = "windows_azure_user"
    admin_password  = "password@12345"
    os_disk_caching = "ReadWrite"
    os_storage_account_type = "Standard_LRS"
    os_disk_sizeGB  = "128"
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
    }
}