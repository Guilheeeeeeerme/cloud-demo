# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "minimal_rg" {
  name     = "minimal-terraform-spa-rg"
  location = "eastus2"
  tags = {
    project     = "minimal terraform spa"
    createdBy   = "creed"
    environment = "development"
  }
}

resource "azurerm_static_site" "minimal_web" {
  name                = "minimal-terraform-spa-web"
  resource_group_name = azurerm_resource_group.minimal_rg.name
  location            = azurerm_resource_group.minimal_rg.location
  sku_tier            = "Free"
  sku_size            = "Free"
  tags                = azurerm_resource_group.minimal_rg.tags
}

# resource "azurerm_app_service_source_control" "cloud_demo_repo" {
#   app_id   = azurerm_static_site.minimal_web.id
#   repo_url = "https://github.com/Guilheeeeeeerme/cloud-demo"
#   branch   = "main"
# }

# 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

#   source {
#     branch          = "main"
#     repo_token      = "xxxxxxxxxx" # Your GitHub Repository Token
#     repository_url  = "https://github.com/Guilheeeeeeerme/cloud-demo"
#     output_location = "/location-to-application-outputs"
#   }
