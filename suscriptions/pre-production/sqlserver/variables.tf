variable "pre_production_sql_server_name" {
  type    = string
  default = "preproductionsqlserver"
}

variable "edition" {
  type    = string
  default = "Basic"
}

variable "collation" {
  type    = string
  default = "Latin1_General_CI_AI"
}

variable "administrator_login" {
  type = string
}

variable "administrator_login_password" {
  type = string
}
