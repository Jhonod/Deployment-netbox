variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region where the service will run"
  type        = string
}

variable "repository_id" {
  description = "Name of the Artifact Registry repository"
  type        = string
}

variable "service_name" {
  description = "Name of the Cloud Run service already deployed"
  type        = string
}