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
resource "azurerm_resource_group" "sample-rg" {
  name     = "minimal-terraform-spa-rg"
  location = "eastus2"
  tags = {
    project     = "minimal terraform spa"
    createdBy   = "creed"
    environment = "development"
  }
}

##### WEB #####
resource "azurerm_static_site" "sample-web" {
  name                = "minimal-terraform-spa-web"
  resource_group_name = azurerm_resource_group.sample-rg.name
  location            = azurerm_resource_group.sample-rg.location
  tags                = azurerm_resource_group.sample-rg.tags
  sku_tier            = "Free"
  sku_size            = "Free"
}

##### API #####
resource "azurerm_app_service_plan" "sample-api-sp" {
  name                = "minimal-terraform-spa-api-serviceplan"
  resource_group_name = azurerm_resource_group.sample-rg.name
  location            = azurerm_resource_group.sample-rg.location
  tags                = azurerm_resource_group.sample-rg.tags


  sku {
    tier = "Free" # Free, Basic, Standard, Premium
    size = "F1"   # https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
  }
}

resource "azurerm_app_service" "sample-api" {
  name                = "minimal-terraform-spa-api"
  resource_group_name = azurerm_resource_group.sample-rg.name
  location            = azurerm_resource_group.sample-rg.location
  tags                = azurerm_resource_group.sample-rg.tags

  app_service_plan_id = azurerm_app_service_plan.sample-api-sp.id
}

output "sample-web-api-key" {
  value = azurerm_static_site.sample-web.api_key
  sensitive = true
}