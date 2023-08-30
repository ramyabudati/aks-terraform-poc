terraform {
  backend "azurerm" {
    resource_group_name  = "bacenkd-sa-rg"
    storage_account_name = "balabackendsa"
    container_name       = "dev-statefile"
    key                  = "terraform.tfstate"
  }
}