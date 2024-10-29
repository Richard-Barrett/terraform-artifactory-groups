<img align="right" width="60" height="60" src="images/terraform.png">

# terraform-artifactory-groups

[![CodeQL IaC](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/iac-codeql.yaml/badge.svg)](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/iac-codeql.yaml)
[![Terraform Validate](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/terraform_validate.yaml/badge.svg)](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/terraform_validate.yaml)
[![TFLint](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/tflint.yaml/badge.svg)](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/tflint.yaml)
[![Trivy Scan](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/trivy.yaml/badge.svg)](https://github.com/Richard-Barrett/terraform-artifactory-groups/actions/workflows/trivy.yaml)

Terraform Module for Making Artifactory Groups and Permission Targets for JFrog Artifactory

This Terraform module manages resources in JFrog Artifactory, specifically groups and permission targets.

Here's a brief overview of what each resource does:

1. `artifactory_group`: This resource creates and manages a group in Artifactory. A group is a collection of users that share the same permissions. The properties of the group, such as its name, description, and admin privileges, can be configured using the defined variables.

2. `artifactory_permission_target`: This resource creates and manages a permission target in Artifactory. A permission target defines the permissions that a group or user has on certain repositories. The permissions and the repositories that the permission target applies to can be configured using the defined variables.

In summary, this module allows you to manage user groups and their permissions in Artifactory in a declarative way using Terraform.

Example CICD with `BitBucket` and `Codefresh`:

![Image](./images/diagram.png)

## Notes

This Terraform module is designed to manage resources in JFrog Artifactory, specifically groups and permission targets.

### Resources

1. `artifactory_group`: This resource is used to create and manage a group in Artifactory. A group is a collection of users that share the same permissions. The properties of the group, such as its name, description, and admin privileges, can be configured using the defined variables.
2. `artifactory_permission_target`: This resource is used to create and manage a permission target in Artifactory. A permission target defines the permissions that a group or user has on certain repositories. The permissions and the repositories that the permission target applies to can be configured using the defined variables.

### Variables

The module uses a number of variables to allow for configuration. These include:

- `name`: The name of the group.
- `description`: The description of the group.
- `admin_privileges`: Whether the group has admin privileges.
- `auto_join`: Whether new users are automatically added to the group.
- `policy_manager`: Whether the group is a policy manager.
- `realm`: The realm of the group.
- `realm_attributes`: The realm attributes of the group.
- `reports_manager`: Whether the group is a reports manager.
- `watch_manager`: Whether the group is a watch manager.
- `repositories`: The repositories that the permission target applies to.
- `permissions`: The permissions granted to the group on the repositories.

## Usage

The following includes some examples on how you can use this module.

### Minimal Usage

Here's a minimal usage example of your Terraform module. This example assumes that you have defined your module in a directory named `artifactory_module`.

```hcl
module "artifactory" {
  source = "./artifactory_module"

  name = "MY_GROUP"
}
```

In this minimal example, we're using the module to create a group named `"MY_GROUP"`. All other parameters will use their default values as defined in the module.

### Basic Usage

Here's a basic usage example of your Terraform module. This example assumes that you have defined your module in a directory named artifactory_module.

```hcl
module "artifactory" {
  source = "git::https://github.com/Richard-Barrett/terraform-artifactory-groups.git?ref=0.8.0"

  name             = "MY_GROUP"
  description      = "This is my group"
  admin_privileges = true
  auto_join        = false
  policy_manager   = false
  realm            = "internal"
  realm_attributes = ""
  reports_manager  = false
  watch_manager    = false
  users_names      = ["user1", "user2"]
  repositories     = ["my-repo"]
  permissions      = ["read", "write"]
}
```

In this example, we're using the module to create a group named "MY_GROUP" with admin privileges. The group includes two users, "user1" and "user2". The group has "read" and "write" permissions on a repository named "my-repo".

### Advanced Usage with All Inputs Plus Options

Here's an advanced usage example of your Terraform module. This example assumes that you have defined your module in a directory named `artifactory_module`.

```hcl
module "artifactory" {
  source = "git::https://github.com/Richard-Barrett/terraform-artifactory-groups.git?ref=0.8.0"

  name             = "MY_GROUP"
  description      = "This is my group"
  admin_privileges = true
  auto_join        = true
  policy_manager   = true
  realm            = "ldap"
  realm_attributes = "ldap-server=ldap://my-ldap-server"
  reports_manager  = true
  watch_manager    = true
  users_names      = ["user1", "user2", "user3", "user4", "user5"]
  repositories     = ["my-repo1", "my-repo2", "my-repo3"]
  permissions      = ["read", "write", "annotate", "delete", "manage", "deploy", "cache", "indexed"]
}
```

In this advanced example, we're using the module to create a group named "MY_GROUP" with admin privileges. The group includes five users. The group has multiple permissions on three repositories. The group is also configured to auto join new users, act as a policy manager, reports manager, and watch manager. The group's realm is set to "ldap" with a specific LDAP server.

### Considerations

1. `Terraform Version`: Ensure you are using a compatible version of Terraform. This module may use features that are only available in certain versions of Terraform.
2. `Artifactory Version`: This module is designed to work with JFrog Artifactory. Make sure you are using a version of Artifactory that supports all the features used in this module.
3. `Permissions`: Ensure that you have the necessary permissions in Artifactory to create and manage groups and permission targets.
4. `Variable Values`: Be careful when setting the values of the variables. Incorrect values can lead to errors or unintended behavior. For example, setting admin_privileges to true will give the group admin privileges, which might not be desirable in all cases.
5. `Case Sensitivity`: The name of the group is always converted to uppercase. Keep this in mind when creating groups.
6. `Idempotency`: Terraform is designed to be idempotent, meaning you can run the same configuration multiple times and get the same result. However, if you manually modify the resources created by Terraform, it can lead to inconsistencies.
7. `State Management`: Terraform keeps track of the resources it manages in a state file. It's important to properly manage this state file to avoid losing track of your resources. Consider using remote state storage for better collaboration and disaster recovery.
8. `Security`: Be careful not to expose sensitive information in your Terraform code or in the console output. Consider using Terraform's sensitive variables feature to protect sensitive data.
9. `Module Updates`: If the module is updated, you will need to run `terraform get -update` to fetch the latest version. Be aware that updates can sometimes introduce breaking changes.

## Overview

This Terraform module manages resources in JFrog Artifactory, specifically groups and permission targets.

### Inputs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_artifactory"></a> [artifactory](#requirement\_artifactory) | 10.7.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_artifactory"></a> [artifactory](#provider\_artifactory) | 10.7.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [artifactory_group.this](https://registry.terraform.io/providers/jfrog/artifactory/10.7.6/docs/resources/group) | resource |
| [artifactory_permission_target.my_permission_target](https://registry.terraform.io/providers/jfrog/artifactory/10.7.6/docs/resources/permission_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_privileges"></a> [admin\_privileges](#input\_admin\_privileges) | Whether the group has admin privileges | `bool` | `false` | no |
| <a name="input_auto_join"></a> [auto\_join](#input\_auto\_join) | Whether new users are automatically added to the group | `bool` | `true` | no |
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | The external ID of the group | `string` | `"auto"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the group | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | The permissions granted to the group on the repositories | `list(string)` | <pre>[<br>  "read",<br>  "write"<br>]</pre> | no |
| <a name="input_policy_manager"></a> [policy\_manager](#input\_policy\_manager) | Whether the group is a policy manager | `bool` | `false` | no |
| <a name="input_realm"></a> [realm](#input\_realm) | The realm of the group | `string` | `"internal"` | no |
| <a name="input_realm_attributes"></a> [realm\_attributes](#input\_realm\_attributes) | The realm attributes of the group | `string` | `"auto"` | no |
| <a name="input_reports_manager"></a> [reports\_manager](#input\_reports\_manager) | Whether the group is a reports manager | `bool` | `false` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | The repositories that the permission target applies to | `list(string)` | <pre>[<br>  "ANY"<br>]</pre> | no |
| <a name="input_users_names"></a> [users\_names](#input\_users\_names) | The names of the users in the group | `list(string)` | `[]` | no |
| <a name="input_watch_manager"></a> [watch\_manager](#input\_watch\_manager) | Whether the group is a watch manager | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
