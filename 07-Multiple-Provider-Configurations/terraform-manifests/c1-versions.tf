# Terraform Block
terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

# Provider-1 for EastUS (Default Provider)
provider "azurerm" {
  features{}
}


# Provider-2 for WestUS
provider "azurerm" {
  features{
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }

  alias = "provider2-eastus"
}


# Provider Documentation for Reference
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

