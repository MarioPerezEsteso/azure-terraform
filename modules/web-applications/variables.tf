variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "app_service_plan_id" {
  type = string
}

variable "sql_database_name" {
  type = string
}

variable "sql_database_host" {
  type = string
}
