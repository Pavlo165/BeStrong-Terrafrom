terraform {
  backend "azurerm" {
    resource_group_name  = "сlustersupportresources"
    storage_account_name = "tfstateaccount447"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
