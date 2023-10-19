variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "location" {
  type = string
}

variable "subscription_scope" {
  type = string
  default = ""
}

variable "create_default_ds" {
  type = bool
  default = false
}
