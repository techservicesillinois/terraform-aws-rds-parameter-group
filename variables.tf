variable "family" {
  description = "Parameter group family (engine and version)"
}

variable "parameter" {
  description = "List containing parameters to include in the parameter group"
  type = list(object({
    apply_method = optional(string, "pending-reboot")
    name         = string
    value        = string
  }))

  # Validate subnet_type (if specified).

  validation {
    condition     = alltrue([for p in var.parameter : contains(["immediate", "pending-reboot"], p.apply_method)])
    error_message = "The 'apply_method' specified in the 'parameter' block is not one of the valid values 'immediate' or 'pending_reboot'."
  }
}

variable "prefix" {
  description = "Prefix for parameter group name"
}

variable "tags" {
  description = "Tags to be applied to resources where supported"
  type        = map(string)
  default     = {}
}
