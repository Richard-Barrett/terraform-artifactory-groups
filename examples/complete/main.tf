terraform {
  required_version = ">= 1.5.6"
  required_providers {
    artifactory = {
      source = "jfrog/artifactory"
      version = "10.7.6"
    }
  }
}

provider "artifactory" {
  # Configuration options
}

module "artifactory" {
  source = "../.." # Path to the root of the Artifactory module

  name = "admins"
}