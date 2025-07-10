provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "registry" {
  location      = var.region
  repository_id = var.repository_id
  description   = "Artifact Registry for NetBox"
  format        = "DOCKER"
}

data "google_cloud_run_service" "netbox" {
  name     = var.image_name  # contoh: "netbox"
  location = var.region
}

