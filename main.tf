# Configure Azure Provider
terraform {
  required_providers {
     azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.71.0"
    } 
  }
  required_version = ">= 1.5"
  cloud {
    organization = "nimbusworld-demo"
    workspaces {
      name = "prephcp"
    }
  }
}

module "bookstore-aws" {
  source  = "app.terraform.io/nimbusworld-demo/bookstore-aws/aws"
  version = "1.0.3"
  bookstore_title = "AWS Bookstore in PROD"
}

module "bookstore-azure" {
  source  = "app.terraform.io/nimbusworld-demo/bookstore-azure/azurerm"
  version = "1.0.2"
  bookstore_title = "Azure bookstore in PROD" 
}