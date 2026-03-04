# TF-IAC
#####ERROR####
azurerm_resource_group.D01: Creating...
azurerm_network_interface.D01: Creating...
azurerm_resource_group.D01: Still creating... [10s elapsed]
azurerm_resource_group.D01: Still creating... [20s elapsed]
azurerm_resource_group.D01: Creation complete after 30s [id=/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-D01]
╷
│ Error: creating Network Interface (Subscription: "33a960b5-98c2-4688-8fd8-3d5e673f9362"
│ Resource Group Name: "sub-200-weu-dev-rg-D01"
│ Network Interface Name: "200weuwappd01-nic01"): performing CreateOrUpdate: unexpected status 404 (404 Not Found) with error: ResourceGroupNotFound: Resource group 'sub-200-weu-dev-rg-D01' could not be found.
│ 
│   with azurerm_network_interface.D01,
│   on main.tf line 145, in resource "azurerm_network_interface" "D01":
│  145: resource "azurerm_network_interface" "D01" {
│ 
╵
Releasing state lock. This may take a few moments...
vikassharma@Vikass-MacBook-Air TF-IAC % 

![alt text](image.png)

