# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Optional: Configure backend storage for state (for production use)
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "my-tf-state-rg"
#     storage_account_name = "mystatestorage"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }
# }
