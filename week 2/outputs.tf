# Lien de l'application Service
output "app_service_url" {
  value = azurerm_windows_web_app.app.default_hostname
}

# Informations de connexion PostgreSQL
output "postgresql_connection_string" {
  value = "Host=${azurerm_postgresql_server.main.fqdn};Database=${azurerm_postgresql_database.main.name};User Id=${azurerm_postgresql_server.main.administrator_login};Password=${azurerm_postgresql_server.main.administrator_login_password};"
  sensitive = true
}

# Nom du compte de stockage
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}