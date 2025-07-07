variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-southeast2"
}

variable "repository_id" {
  type    = string
  default = "netbox-registry"
}

variable "image_name" {
  type    = string
  default = "netbox"
}