## Definiton of storage

# create initial bucket
resource "google_storage_bucket" "sbx_backend_bucket" {
  name                     = var.rs_bucket
  force_destroy            = false
  project                  = var.project
  location                 = var.region
  storage_class            = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}