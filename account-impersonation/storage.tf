
#create a bucket for target_service_account# create initial bucket
resource "google_storage_bucket" "gcp_backend_bucket" {
  name          = var.remote_state_bucket
  
  force_destroy = true
  project       = var.project_id
  location      = var.region
  storage_class = "STANDARD"


  versioning {
    enabled = true
  }
}

