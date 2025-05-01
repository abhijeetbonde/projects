### This project shows usage of random_pet resource under random provider.
### It generates random pet names as unique identifiers
### Example - Creating an S3 bucket needs a uniques name - can use random provider in such cases.

terraform {
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.7.2"
    }
  }
}

provider "random" {}

### Lenght = the lenght (in words) of pet name. Default is 2
# resource "random_pet" "my_pet" {
#     length = 3
#     separator = "-"
# }

### example - random function used in virtual network name

resource random_id "my_id" {
    byte_length = 4
}

resource "azurerm_resource_group" "my-rg" {
    name = "rg-random-test"
    location = "eastus2"
  
}

resource "azurerm_network_security_group" "my-nsg" {
    name = "nsg-1-eastus2"
    location = azurerm_resource_group.my-rg.location
    resource_group_name = azurerm_resource_group.my-rg.name  
}

resource "azurerm_virtual_network" "my-vnet" {
    name = "vnet-${random_id.my_id.hex}"                    #This will name it as "vnet-<random 4 digit hex>"
    location = azurerm_resource_group.my-rg.location
    resource_group_name = azurerm_resource_group.my-rg.name
    address_space = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]

    subnet {
        name = "subnet-1"
        address_prefixes = ["10.0.1.0/24"]
    }

    subnet {
        name = "subnet-2"
        address_prefixes = ["10.0.2.0/24"]
    }
    tags = {
        environment = "dev"
    }
  
}