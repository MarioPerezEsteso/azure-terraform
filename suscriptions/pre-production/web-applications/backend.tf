terraform {
  backend "azurerm" {
    storage_account_name = "storagetfstate"
    container_name       = "terraform"
    key                  = "web_applications.terraform.tfstate"
  }
}
