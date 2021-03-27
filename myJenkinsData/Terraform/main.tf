terraform {
  required_version = "> 0.13"
}

variable "whoami" {
  type    = string
  default = "admin"
}

output "username" {
  value = var.whoami
}
