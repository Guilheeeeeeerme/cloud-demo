# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "azure-minimal-spa-rg" {
  name     = "azure-minimal-spa-terraform-rg"
  location = "eastus2"
}

# resource "azurerm_static_site" "azure-minimal-spa-web" {
#   name                = "azure-minimal-spa-terraform-web"
#   resource_group_name = "azure-minimal-spa-rg"
#   location            = "eastus2"
#   sku_size           = "Free"

#   # tags                = local.common_tags
# }