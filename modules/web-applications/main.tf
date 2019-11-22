resource "azurerm_app_service" "webapp_service" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = var.app_service_plan_id
  https_only          = true

  app_settings = {
    DB_DATABASE = var.sql_database_name
    DB_HOST     = var.sql_database_host
    MY_ENV      = "pre"
    ANOTHER     = "another"
    OTRA        = "YUNAMAS"
    COMMIT      = "2020"
    CONF        = "2019"
    CHARLA      = "terraform"
  }

  site_config {
    always_on     = true
    http2_enabled = true
  }
}
