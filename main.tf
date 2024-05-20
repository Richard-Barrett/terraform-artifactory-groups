terraform {
  required_version = ">= 1.5.6"
  required_providers {
    artifactory = {
      source  = "jfrog/artifactory"
      version = "10.7.7"
    }
  }
}

resource "artifactory_group" "this" {
  admin_privileges = var.admin_privileges
  auto_join        = var.auto_join
  description      = "This is the ${var.name} group."
  external_id      = var.external_id
  name             = upper(var.name)
  policy_manager   = var.policy_manager
  realm            = var.realm
  realm_attributes = var.realm_attributes
  reports_manager  = var.reports_manager
  users_names      = var.users_names
  watch_manager    = var.watch_manager
}

resource "artifactory_permission_target" "my_permission_target" {
  name = upper(artifactory_group.this.name)

  repo {
    actions {
      groups {
        name        = upper(artifactory_group.this.name)
        permissions = var.permissions // DEFAULT: ["read", "write"]
      }
    }
    excludes_pattern = [""]
    includes_pattern = ["**"]
    repositories     = var.repositories // DEFAULT: ["ANY"]
  }
}