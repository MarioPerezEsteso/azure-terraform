terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatecommit"
    container_name       = "terraform"
    key                  = "sql_server.terraform.tfstate"
  }
}
