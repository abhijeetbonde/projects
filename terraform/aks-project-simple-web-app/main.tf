terraform {
    # backend "azurerm"{
    #     use_azuread_auth = false
    # }
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>4.22.0"
        }
    }
}

provider "azurerm"{
    subscription_id = "7ea43c09-0383-4771-a251-e959b652d8a2"
    features {}
}

resource azurerm_resource_group "terra_aks_rg" {
    name = "dev_aks_rg"
    location = "eastus2"
}

resource "azurerm_kubernetes_cluster" "terra_aks_cluster" {
    name = "dev_aks_cluster_01"
    location = "eastus"
    resource_group_name = azurerm_resource_group.terra_aks_rg.name
    dns_prefix = "cluster1"
    default_node_pool {
      name = "sysnp"
      node_count = 1
      vm_size = "Standard_B2s"
    }
    identity {
      type = "SystemAssigned"
    }
    tags = {
      environment = "DEV"
    }
  
}

resource "azurerm_kubernetes_cluster_node_pool" "Custom_nodepool" {
    name                  = "usrnp"
    kubernetes_cluster_id = azurerm_kubernetes_cluster.terra_aks_cluster.id
    vm_size               = "Standard_B2s"
    node_count            = 1

    tags = {
      Environment = "DEV"
    }
  
}