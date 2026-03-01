import {
    to = azurerm_subnet.app
    id = "/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-net/providers/Microsoft.Network/virtualNetworks/sub-200-weu-dev-vnet/subnets/sub-200-weu-dev-app-snt"
}

import {
    to = azurerm_subnet.db
    id = "/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-net/providers/Microsoft.Network/virtualNetworks/sub-200-weu-dev-vnet/subnets/sub-200-weu-dev-db-snt"
}

import {
    to = azurerm_subnet.pe
    id = "/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-net/providers/Microsoft.Network/virtualNetworks/sub-200-weu-dev-vnet/subnets/sub-200-weu-dev-pe-snt"
}

import {
    to = azurerm_subnet_network_security_group_association.app-nsg
    id = "/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-net/providers/Microsoft.Network/networkSecurityGroups/sub-200-weu-dev-app-nsg"
}

import {
    to = azurerm_subnet_network_security_group_association.db-nsg
    id = "/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-net/providers/Microsoft.Network/networkSecurityGroups/sub-200-weu-dev-db-nsg"
}

import {
    to = azurerm_subnet_network_security_group_association.pe-nsg
    id = "/subscriptions/33a960b5-98c2-4688-8fd8-3d5e673f9362/resourceGroups/sub-200-weu-dev-rg-net/providers/Microsoft.Network/networkSecurityGroups/sub-200-weu-dev-pe-nsg"
}