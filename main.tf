#resource group for dev network resources

resource "azurerm_resource_group" "rg" {
  name     = var.vnet_rg_name_weu
  location = var.location

  tags = var.tags
}

# app nsg

resource "azurerm_network_security_group" "weu-dev-app-nsg" {
    name = var.weu_dev_app_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

# db nsg

resource "azurerm_network_security_group" "weu-dev-db-nsg" {
    name = var.weu_dev_db_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

# pe nsg

resource "azurerm_network_security_group" "weu-dev-pe-nsg" {
    name = var.weu_dev_pe_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

# webapp nsg

resource "azurerm_network_security_group" "weu-dev-webapp-nsg" {
    name = var.weu_dev_webapp_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

# sfc nsg

resource "azurerm_network_security_group" "weu-dev-sfc-nsg" {
    name = var.weu_dev_sfc_nsg
    location = var.location
    resource_group_name = var.vnet_rg_name_weu
}

# dev vnet

resource "azurerm_virtual_network" "dev-app-vnet-weu" {
 name = var.dev_app_vnet_weu_name
 location = var.location
 resource_group_name = var.vnet_rg_name_weu
 address_space = var.weu_dev_vnet_address_space
}

# app subnet

resource "azurerm_subnet" "app" {
  name                 = var.weu_dev_app_subnet
  resource_group_name  = var.vnet_rg_name_weu
  virtual_network_name = azurerm_virtual_network.dev-app-vnet-weu.name
  address_prefixes     = var.weu_dev_app_subnet_address
}

# db subnet

resource "azurerm_subnet" "db" {
  name                 = var.weu_dev_db_subnet
  resource_group_name  = var.vnet_rg_name_weu
  virtual_network_name = azurerm_virtual_network.dev-app-vnet-weu.name
  address_prefixes     = var.weu_dev_db_subnet_address
}

# pe subnet

resource "azurerm_subnet" "pe" {
  name                 = var.weu_dev_pe_subnet
  resource_group_name  = var.vnet_rg_name_weu
  virtual_network_name = azurerm_virtual_network.dev-app-vnet-weu.name
  address_prefixes     = var.weu_dev_pe_subnet_address
}

# webapp subnet

resource "azurerm_subnet" "webapp" {
  name                 = var.weu_dev_webapp_subnet
  resource_group_name  = var.vnet_rg_name_weu
  virtual_network_name = azurerm_virtual_network.dev-app-vnet-weu.name
  address_prefixes     = var.weu_dev-webapp_subnet_address
}

# sfc subnet

resource "azurerm_subnet" "sfc" {
  name                 = var.weu_dev_sfc_subnet
  resource_group_name  = var.vnet_rg_name_weu
  virtual_network_name = azurerm_virtual_network.dev-app-vnet-weu.name
  address_prefixes     = var.weu_dev_sfc_subnet_address
}

# associate app nsg with app subnet

resource "azurerm_subnet_network_security_group_association" "app-nsg" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.weu-dev-app-nsg.id
}

# associate db nsg with db subnet

resource "azurerm_subnet_network_security_group_association" "db-nsg" {
  subnet_id                 = azurerm_subnet.db.id
  network_security_group_id = azurerm_network_security_group.weu-dev-db-nsg.id
}

# associate pe nsg with pe subnet

resource "azurerm_subnet_network_security_group_association" "pe-nsg" {
  subnet_id                 = azurerm_subnet.pe.id
  network_security_group_id = azurerm_network_security_group.weu-dev-pe-nsg.id
}

# associate webapp nsg with webapp subnet

resource "azurerm_subnet_network_security_group_association" "webapp-nsg" {
  subnet_id                 = azurerm_subnet.webapp.id
  network_security_group_id = azurerm_network_security_group.weu-dev-webapp-nsg.id
}

# associate sfc nsg with webapp sfc subnet

resource "azurerm_subnet_network_security_group_association" "sfc-nsg" {
  subnet_id                 = azurerm_subnet.sfc.id
  network_security_group_id = azurerm_network_security_group.weu-dev-sfc-nsg.id
}

# winodows Virtual Machine
resource "azurerm_resource_group" "D01" {
  name     = var.D01_rg
  location = data.azurerm_resource_group.dev-vnet-rg.location
}

resource "azurerm_network_interface" "D01" {
  name                = "${var.D01_VM_Name}-nic01"
  location            = azurerm_resource_group.D01.location
  resource_group_name = var.D01_rg

  depends_on = [
    azurerm_resource_group.D01
  ]

  ip_configuration {
    name                          = "ipconfig01"
    subnet_id                     = data.azurerm_subnet.dev-app-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "D01" {
  name                = var.D01_VM_Name
  resource_group_name = azurerm_resource_group.D01.name
  location            = azurerm_resource_group.D01.location
  size                = var.D01_VM_Size
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.D01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_resource_group" "D02" {
  name     = var.D02_rg_name
  location = data.azurerm_resource_group.dev-vnet-rg.location
}

resource "azurerm_network_interface" "nic" {
    for_each = var.D02_vms

    name                         = "${each.key}-nic"
    location                     = var.D02_location 
    resource_group_name          = var.D02_rg_name

    depends_on = [
        azurerm_resource_group.D02
    ]

    # primary ip configuation

    ip_configuration {
    name                          = "ipconfig01"
    subnet_id                     = data.azurerm_subnet.dev-app-subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.private_ips[0]
    primary                       = true
  }

  # secondary IP configuration
    
    dynamic ip_configuration {
        for_each = slice(each.value.private_ips, 1, length(each.value.private_ips) )

        content {
            name                            = format("ipconfig%02d", ip_configuration.key + 2)
            subnet_id                       = data.azurerm_subnet.dev-app-subnet.id
            private_ip_address_allocation   = "Static"
            private_ip_address              = ip_configuration.value
            primary                         = false
        }
    }
 
}

resource "azurerm_linux_virtual_machine" "D02" {
    for_each = {
        for k, v in var.D02_vms : k => v if v.os_type == "linux"
    }

    name                = each.key
    resource_group_name = var.D02_rg_name
    location            = var.D02_location
    size                = each.value.vm_size
    admin_username      = each.value.admin_username
    admin_password      = each.value.admin_password
    disable_password_authentication = false

    network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    name                 = "${each.key}_osDisk"
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_storage_account_type
    disk_size_gb         = each.value.os_disk_sizeGB
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}

resource "azurerm_windows_virtual_machine" "D02" {
    for_each = {
        for k, v in var.D02_vms : k => v if v.os_type == "windows"
    }

    name                = each.key
    resource_group_name = var.D02_rg_name
    location            = var.D02_location
    size                = each.value.vm_size
    admin_username      = each.value.admin_username
    admin_password      = each.value.admin_password

    network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    name                 = "${each.key}_osDisk"
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_storage_account_type
    disk_size_gb         = each.value.os_disk_sizeGB
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}

