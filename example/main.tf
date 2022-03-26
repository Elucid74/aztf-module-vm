provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "<=2.92.0" # latest Azure CLI version i.e. 2.32.0 or above requires azurerm provider 2.92.0 or above
    }
  }
# specify backend when using remote backend  
#  backend "azurerm" {}
}
