terraform {
  backend "azurerm" {
    storage_account_name = "storagetfstate"
    container_name       = "terraform"
    key                  = "resource_groups.terraform.tfstate"
  }
}
