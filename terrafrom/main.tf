#====================================================
# 🌟 Authors: Valeriy Manuilyk, Pavlo Mochurad, Liubomyr Shpyrka 🌟
#====================================================
# 🌟 Terraform Configuration for Azure AKS Setup 🌟
#====================================================
# ⚙️ This script provisions an Azure Resource Group 
# and an Azure Kubernetes Service (AKS) cluster.
# ✅ Ensure variables (e.g., `var.resource_group_name`, `var.location`) 
# are properly set in your `terraform.tfvars` file or directly in variables.
# 📂 GitHub: https://github.com/Pavlo165/BeStrong-Terrafrom
#====================================================

# 📦 Creating a Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name   # 🏷️ Name of the Resource Group
  location = var.location              # 🌍 Azure region where resources will be created
}

# 🚀 Provisioning an Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name                  # 🏷️ Name of the AKS Cluster
  location            = azurerm_resource_group.main.location  # 🌍 Inherited location from Resource Group
  resource_group_name = azurerm_resource_group.main.name      # 📦 Associated Resource Group
  dns_prefix          = "aks-${var.aks_cluster_name}"         # 🌐 DNS prefix for the AKS cluster

  # 🖥️ Node pool configuration
  default_node_pool {
    name       = "default"           # 🏷️ Name of the default node pool
    node_count = var.node_count      # 🔢 Number of nodes in the pool
    vm_size    = var.node_size       # 💻 VM size for the nodes
  }

 # 🛡️ Assigning System-Managed Identity
  identity {
    type = "SystemAssigned"
  }

  # 🏷️ Adding tags for resource organization
  tags = {
    environment = "dev"              # 🛠️ Environment tag (development)
  }
}

resource "azurerm_public_ip" "aks_ingress_ip" {
  name                = "aks-ingress-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
