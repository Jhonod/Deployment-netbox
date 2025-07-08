variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-southeast2"
}

variable "repository_id" {
  type    = string
  default = "box-registry"
}

variable "image_name" {
  type    = string
  default = "net-box"
}