variable "account" {
  description = "Conta Aws"
  type        = string
  default     = ""
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "globaltags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
  default     = {}
}

variable "name" {
  type    = string
  default = "vm"
}

variable "name_s3" {
  type    = string
  default = "files"
}

variable "environment" {
  type = string
}