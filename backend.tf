terraform {
  backend "azurerm" {
    resource_group_name  = "clustersupportresources"
    storage_account_name = "tfstateaccount4477"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
