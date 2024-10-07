# Lien de l'application Service
output "app_service_url" {
  value = azurerm_windows_web_app.app.default_hostname
}

# Nom du compte de stockage
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}