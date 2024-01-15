# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used

# https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/web/static-site/main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
# skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "minimal-terraform-spa-rg" {
  name     = "minimal-terraform-spa-rg"
  location = "eastus2"
  tags = {
    project     = "minimal terraform spa"
    createdBy   = "creed"
    environment = "development"
  }
}

##### WEB #####
resource "azurerm_static_site" "minimal-terraform-spa-web" {
  name                = "minimal-terraform-spa-web"
  location            = azurerm_resource_group.minimal-terraform-spa-rg.location
  resource_group_name = azurerm_resource_group.minimal-terraform-spa-rg.name
  sku_tier            = "Free"
  sku_size            = "Free"

  tags = azurerm_resource_group.minimal-terraform-spa-rg.tags
}

##### API #####
resource "azurerm_app_service_plan" "minimal-terraform-spa-api-serviceplan" {
  name                = "minimal-terraform-spa-api-serviceplan"
  resource_group_name = azurerm_resource_group.minimal-terraform-spa-rg.name
  location            = azurerm_resource_group.minimal-terraform-spa-rg.location


  sku {
    tier = "Free" # Free, Basic, Standard, Premium
    size = "F1" # https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
  }
}

resource "azurerm_app_service" "minimal-terraform-spa-api" {
  name                = "minimal-terraform-spa-api"
  resource_group_name = azurerm_resource_group.minimal-terraform-spa-rg.name
  location            = azurerm_resource_group.minimal-terraform-spa-rg.location
  app_service_plan_id = azurerm_app_service_plan.minimal-terraform-spa-api-serviceplan.id
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
