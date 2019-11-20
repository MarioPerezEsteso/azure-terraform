terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatecommit"
    container_name       = "terraform"
    key                  = "web_applications.terraform.tfstate"
  }
}
