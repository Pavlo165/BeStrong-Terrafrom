#====================================================
# 🌟 Authors: Valeriy Manuilyk, Pavlo Mochurad, Liubomyr Shpyrka 🌟
#====================================================
# 🌟 Outputs for Azure AKS Configuration 🌟
#====================================================
# 📤 This section provides outputs to access AKS cluster details 
# and its Kubernetes configuration.
# 🚀 These outputs can be used for further automation or integration.
#====================================================

# 🏷️ Output: AKS Cluster Name
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name   # 🏗️ Retrieves the name of the AKS cluster
}

# 📜 Output: Kubernetes Configuration (kubeconfig)
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw   # 📂 Full kubeconfig for accessing the cluster
  sensitive = true                                             # 🔒 Marks the output as sensitive to protect the config
}
