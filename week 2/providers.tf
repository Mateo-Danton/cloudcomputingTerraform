terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 3.0" #choose stable one
        }
    }

    required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}

   subscription_id = var.subscriptionid
}