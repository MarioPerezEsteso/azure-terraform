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

data "terraform_remote_state" "sql_databases" {
  backend = "azurerm"

  config = {
    storage_account_name = "terraformstatecommit"
    container_name       = "terraform"
    key                  = "sql_server.terraform.tfstate"
  }
}

resource "azurerm_app_service_plan" "pre_production" {
  name                = "preproductionserviceplan"
  location            = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_location
  resource_group_name = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_name
  kind                = "app"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

module "pre_webapp_service" {
  source = "../../../modules/web-applications"

  name                = "preproductionwebapplication"
  location            = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_location
  resource_group_name = data.terraform_remote_state.resource_groups.outputs.pre_production_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.pre_production.id

  # Application Settings

  sql_database_name = data.terraform_remote_state.sql_databases.outputs.pre_production_sql_server_host
  sql_database_host = data.terraform_remote_state.sql_databases.outputs.pre_production_sql_database_name
}
