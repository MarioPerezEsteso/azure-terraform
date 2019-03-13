terraform {
  backend "azurerm" {
    storage_account_name = "storagetfstate"
    container_name       = "terraform"
    key                  = "sql_server.terraform.tfstate"
  }
}
