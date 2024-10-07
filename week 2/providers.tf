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

   subscription_id = "4e1ef97b-f68e-4a73-9a81-7d4b8c158643"
}