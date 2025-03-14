# Update latest providers as and when in use
terraform{
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~>4.22.0"
      }
    }
}

provider "azurerm" {
    subscription_id = "7f44ed1a-f815-4695-af39-79ee8997ecca"
    features {}
}

resource "azurerm_resource_group" "terra_aks_rg" {
    name = "aks_rg"
    location = "eastus2"
}

resource "azurerm_kubernetes_cluster" "terra_cluster" {
    name = "cluster_1"
    location = "eastus2"
    resource_group_name = azurerm_resource_group.terra_aks_rg.name
    dns_prefix = "cluster1"
    default_node_pool {
        name = "sysnp"
        node_count = 1
        vm_size = "Standard_D2_v2"
    }
    identity {
        type = "SystemAssigned"
    }
    tags = {
        Environment = "DEV"
    }
}

output "client_certificate" {
    value = azurerm_kubernetes_cluster.terra_cluster.kube_config[0].client_certificate
    sensitive = true
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.terra_cluster.kube_config_raw
    sensitive = true
}