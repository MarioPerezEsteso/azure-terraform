terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatecommit"
    container_name       = "terraform"
    key                  = "resource_groups.terraform.tfstate"
  }
}
