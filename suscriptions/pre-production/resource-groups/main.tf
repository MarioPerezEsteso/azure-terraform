provider "azurerm" {
  version = "~> 1.22.0"
}

resource "azurerm_resource_group" "pre_production" {
  name     = "pre-production"
  location = "${var.azure_resource_group_location}"
}
