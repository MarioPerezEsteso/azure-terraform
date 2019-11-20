output "pre_production_sql_server_host" {
  value = azurerm_sql_server.pre_production_sql_server.fully_qualified_domain_name
}

output "pre_production_sql_database_name" {
  value = azurerm_sql_database.pre_production.name
}
