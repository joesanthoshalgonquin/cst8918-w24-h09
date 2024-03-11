terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.93.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "cst8918_hybrid_h09" {
  name     = "cst8918_hybrid_h09"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "myakscluster" {
  name                = "myakscluster"
  location            = azurerm_resource_group.cst8918_hybrid_h09.location
  resource_group_name = azurerm_resource_group.cst8918_hybrid_h09.name
  dns_prefix          = "myaksclusterdnsprefix"

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"
    min_count           = 1
    max_count           = 3
    enable_auto_scaling = true
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.myakscluster.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.myakscluster.kube_config_raw
  sensitive = true
}
