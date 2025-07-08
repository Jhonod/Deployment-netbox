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
  name     = var.service_name  # contoh: "netbox"
  location = var.region
}

resource "google_cloud_run_service_iam_member" "all_users" {
  location = data.google_cloud_run_service.netbox.location
  service  = data.google_cloud_run_service.netbox.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
