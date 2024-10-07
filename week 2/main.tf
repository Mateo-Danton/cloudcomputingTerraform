# Groupe (nom et location)
resource "azurerm_resource_group" "main" {
  name     = var.groupname
  location = var.location
}

# Plan du service
resource "azurerm_service_plan" "service_plan" {
  name                = "testAppServicePlanMat"
  location            = var.location
  resource_group_name = var.groupname
  os_type             = "Windows"

  sku_name = "B1"
}

# Web app
resource "azurerm_windows_web_app" "app" {
  name                = "testWebAppMat"
  location            = var.location
  resource_group_name = var.groupname
  service_plan_id = azurerm_service_plan.service_plan.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "SCM_DO_BUILD_DURING_DEPLOYMENT"      = "true"
    "PYTHON_VERSION"                      = "3.11"
  }

  site_config {

  }

}

# Server PostgreSQL 
resource "azurerm_postgresql_server" "main" {
  name                = var.servername
  location            = var.location
  resource_group_name = var.groupname

  sku_name = "B_Gen5_1"
  version  = "11"

  administrator_login          = var.adminuser
  administrator_login_password = var.adminpassword

  backup_retention_days = 7
  ssl_enforcement_enabled = true

  storage_mb        = 5120
  auto_grow_enabled = true
}

# Base de données PostgreSQL
resource "azurerm_postgresql_database" "main" {
  name                = "testDatabaseMat"
  resource_group_name = var.groupname
  server_name         = var.servername
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

# Storage account
resource "azurerm_storage_account" "storage" {
  name                     = "teststorageaccountmat"
  resource_group_name       = var.groupname
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

# Blob storage (?)
resource "azurerm_storage_container" "storage_container" {
  name                  = "testcontainermat"
  storage_account_name   = azurerm_storage_account.storage.name
  container_access_type  = "private"
}