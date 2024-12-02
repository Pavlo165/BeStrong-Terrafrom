#====================================================
# 🌟 Authors: Valeriy Manuilyk, Pavlo Mochurad, Liubomyr Shpyrka 🌟
#====================================================
# 🌱 Input Variables for Azure Resources Configuration 🌱
#====================================================
# 🖥️ These variables allow you to customize the deployment of resources on Azure.
# 💡 Ensure to modify them based on your project needs.
#====================================================

# 📦 Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"  # 🏷️ Name of the resource group in Azure
  type        = string
  default     = "bestrongcluster"  # 🌍 Default resource group name
}

# 🌍 Location of Resources
variable "location" {
  description = "The Azure region where resources will be created"  # 📍 Region where the resources will be deployed
  type        = string
  default     = "westeu"  # 🌍 Default location
}

# 🧑‍💻 AKS Cluster Name
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"  # 🏞️ Name of the Azure Kubernetes Service (AKS) cluster
  type        = string
  default     = "testcluster"  # 🧑‍💻 Default AKS cluster name
}

# 🖧 Number of Nodes in the AKS Cluster
variable "node_count" {
  description = "The number of nodes in the AKS cluster"  # 🔢 The total number of nodes in the AKS cluster
  type        = number
  default     = 2  # ⚙️ Default number of nodes is set to 2
}

# 💻 Size of the Nodes in AKS Cluster
variable "node_size" {
  description = "The size of the nodes in the AKS cluster"  # 🖥️ Size of the virtual machines (VMs) in the cluster
  type        = string
  default     = "Standard_DS2_v2"  # 💻 Default node size is Standard_DS2_v2
}
