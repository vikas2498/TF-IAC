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