#====================================================
# 🌟 Authors: Valeriy Manuilyk, Pavlo Mochurad, Liubomyr Shpyrka 🌟
#====================================================
# 🌍 Azure Provider Configuration 🌍
#====================================================
# 🛠️ This block configures the Azure Resource Manager (azurerm) provider.
# 🔑 Make sure the subscription ID corresponds to the correct Azure account.
# ⚡ Features block is left empty, but can be extended for advanced capabilities.
#====================================================

provider "azurerm" {
  features {}  # 🚀 Enables the default features for the azurerm provider
  
  subscription_id = "fdc51540-ce97-42ba-a64d-feb455570f4f"  # 🔑 Azure Subscription ID
}
