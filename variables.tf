variable "name" {
 description = "(required) The name of the DB parameter group. If omitted, Terraform will assign a random, unique name."
}

variable "family" {
 description = "(Required) The family of the DB parameter group."
}

variable "parameter" {
  description = "A list of DB parameters (map) to apply"
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  default     = {}
}