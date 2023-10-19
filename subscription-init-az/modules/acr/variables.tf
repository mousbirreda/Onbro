variable "application_name" {
  type = string
}

variable "env" {
  type = string
  default     = ""
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
  default     = ""
}

############################################

variable "acr_sku" {
  description = "sku type ( Basic / Standard / Premium )"
  default     = "Basic"
}