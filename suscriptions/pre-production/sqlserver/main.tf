provider "azurerm" {
  version = "~> 1.27.0"
}

data "terraform_remote_state" "resource_groups" {
  backend = "azurerm"

  config = {
    storage_account_name = "terraformstatecommit"
    container_name       = "terraform"
    key                  = "resource_groups.terraform.tfstate"
  }
}

resource "azurerm_sql_server" "pre_production_sql_server" {
  name                         = var.pre_production_sql_server_name
  resource_group_name          = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_name
  location                     = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_sql_database" "pre_production" {
  name                = "preproductiondb"
  resource_group_name = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_name
  location            = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_location
  server_name         = azurerm_sql_server.pre_production_sql_server.name
  edition             = var.edition
  collation           = var.collation
}
