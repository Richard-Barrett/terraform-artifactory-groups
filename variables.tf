variable "admin_privileges" {
  description = "Whether the group has admin privileges"
  type        = bool
  default   = false
}

variable "auto_join" {
  description = "Whether new users are automatically added to the group"
  type        = bool
  default = true
}

variable "external_id" {
  description = "The external ID of the group"
  type        = string
  default     = "auto"
}

variable "name" {
  description = "The name of the group"
  type        = string
}

variable "permissions" {
  description = "The permissions granted to the group on the repositories"
  type        = list(string)
  default     = ["read", "write"]
}

variable "policy_manager" {
  description = "Whether the group is a policy manager"
  type        = bool
  default     = false
}

variable "realm" {
  description = "The realm of the group"
  type        = string
  default     = "internal"
}

variable "realm_attributes" {
  description = "The realm attributes of the group"
  type        = string
  default     = "auto"
}

variable "repositories" {
  description = "The repositories that the permission target applies to"
  type        = list(string)
  default     = ["ANY"]
}

variable "reports_manager" {
  description = "Whether the group is a reports manager"
  type        = bool
  default     = false
}

variable "users_names" {
  description = "The names of the users in the group"
  type        = list(string)
  default     = []
}

variable "watch_manager" {
  description = "Whether the group is a watch manager"
  type        = bool
  default     = false
}