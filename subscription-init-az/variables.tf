variable "environment_list" {
  type = list(any)
}

variable "subscription_scope" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = "westeurope"
}


variable "address_space" {
  type = list(any)
}
