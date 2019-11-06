variable "name" {
  description = "Name of the parameter group"
}

variable "family" {
  description = "The family of the parameter group"
}

variable "parameter" {
  description = "List containing map of parameters to apply"
  type        = list(map(any))
  default     = []
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}
