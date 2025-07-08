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

resource "google_cloud_run_service" "net-box" {
  name     = "net-box"
  location = var.region

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}/${var.image_name}:latest"
        ports {
          container_port = 8080
        }
      }
    }
  }
 traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "all_users" {
  location = google_cloud_run_service.netbox.location
  service  = google_cloud_run_service.netbox.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
