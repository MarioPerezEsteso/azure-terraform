output "pre_production_resource_group_name" {
  value = "${azurerm_resource_group.pre_production.name}"
}

output "pre_production_resource_group_location" {
  value = "${azurerm_resource_group.pre_production.location}"
}
