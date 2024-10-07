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

# Server CosmosDB (NoSQL)
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "testCosmosDbAccountMat"
  location            = var.location
  resource_group_name = var.groupname
  offer_type          = "Standard"
  kind                = "MongoDB" 

  capabilities {
    name = "EnableMongo"
  }
}

# Base de données CosmosDB
resource "azurerm_cosmosdb_mongo_database" "mongo_database" {
  name                = "myDatabase"
  resource_group_name = var.groupname
  account_name        = var.location
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