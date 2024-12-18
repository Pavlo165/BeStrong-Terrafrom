#====================================================
# 🌟 Authors: Valeriy Manuilyk, Pavlo Mochurad, Liubomyr Shpyrka 🌟
#====================================================
# ⚙️ Terraform Configuration for Azure Backend ⚙️
# 📂 This configuration sets up the backend to store Terraform state 
# in an Azure Storage Account. 
# ✅ Ensure that the specified resource group, storage account, 
# and container exist before applying. 
# 🌐 GitHub: https://github.com/Pavlo165/BeStrong-Terrafrom
#====================================================

terraform {
  backend "azurerm" {
    resource_group_name  = "clustersupportresources"
    storage_account_name = "tfstateaccount44778"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
