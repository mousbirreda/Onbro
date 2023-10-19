variable "TENANT_ID" {
  type = string
}

variable "APPLICATION_NAME" {
  type        = string
  description = "Application Name"
}

variable "ENV" {
  type        = string
  description = "Working Environnement"
  default     = "sbx"
}

variable "location" {
  type    = string
  default = "westeurope"
}

# A REPRENDRE le scope ??????????????????????? Proposition oney-we
variable "scope" {
  type    = string
  default = "hub"
}

locals {
}