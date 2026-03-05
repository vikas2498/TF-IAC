variable "vnet_rg_name_weu"{
    description = "Name of the VNet RG in weu"
    type = string
}

variable "location"{
    description = "weu netwrok resource location"
    type = string
}

variable tags {
    description = "tags to be assigned to RG"
    type =  map(string)
    default = {}
}

variable "weu_dev_app_nsg" {
    description = "app nsg name"
    type = string
}

variable "weu_dev_db_nsg" {
    description = "db nsg name"
    type = string
}

variable "weu_dev_pe_nsg" {
    description = "pe nsg name"
    type = string
}

variable "weu_dev_webapp_nsg" {
    description = "pe nsg name"
    type = string
}

variable "weu_dev_sfc_nsg" {
    description = "sfc nsg name"
    type = string
}

variable "dev_app_vnet_weu_name" {
    description = "dev app vnet name"
    type = string
}

variable "weu_dev_vnet_address_space" {
    description = "vnet address space"
    type = list(string)
}

variable "weu_dev_app_subnet" {
    description = "app subnet name"
    type = string
}

variable "weu_dev_db_subnet" {
    description = "db subnet name"
    type = string
}

variable "weu_dev_pe_subnet" {
    description = "pe subnet name"
    type = string
}

variable "weu_dev_sfc_subnet" {
    description = "pe subnet name"
    type = string
}

variable "weu_dev_app_subnet_address" {
     description = "app subnet address space"
     type = list(string)
}


variable "weu_dev_db_subnet_address" {
     description = "db subnet address space"
     type = list(string)
}

variable "weu_dev_pe_subnet_address" {
     description = "pe subnet address space"
     type = list(string)
}

variable "weu_dev_webapp_subnet"{
    description = "webapp subnet name"
    type = string
}

variable "weu_dev-webapp_subnet_address"{
    type = list(string)
    description = "subnet address"
}

variable "weu_dev_sfc_subnet_address"{
    type = list(string)
    description = "subnet address"
}

variable "D01_rg" {
    type = string
    description = "D01 vm rg name"
}

variable "D01_VM_Name" {
    type = string
    description = "D01 VM name"
}

variable "D01_VM_Size" {
    type = string 
    description = "vm size"
}

variable "D02_rg_name" {
    type = string
}
variable "D02_location" {
    type = string
}

variable "D02_vms" {
    type = map(object({
    os_type         = string
    vm_size         = string
    subnet_name     = string
    private_ips     = list(string)
    admin_username  = string
    admin_password  = string
    os_disk_caching = string
    os_storage_account_type = string
    os_disk_sizeGB  = string
    publisher       = "string"
    offer           = "string"
    sku             = "string"
    version         = "string"
    }))
}