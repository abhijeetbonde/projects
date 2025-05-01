terraform {
    backend "azurerm"{
        use_azuread_auth = false
    }
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>4.22.0"
        }
    }
}

provider "azurerm"{
    features {}
}

resource azurerm_resource_group "terra_aks_rg" {
    name = "dev_aks_rg"
    location = "eastus2"
}

resource "azurerm_kubernetes_cluster" "terra_aks_cluster" {
    name = "dev_aks_cluster_01"
    location = "eastus2"
    resource_group_name = azurerm_resource_group.terra_aks_rg.name
    dns_prefix = cluster1
    default_node_pool {
      name = "sysnp"
      node_count = 1
      vm_size = "Standard_D4s_v3"
    }
    identity {
      type = SystemAssigned
    }
    tags = {
      environment = "DEV"
    }
  
}