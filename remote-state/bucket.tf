## Definition of storage

# Create initial Google Cloud Storage bucket
resource "google_storage_bucket" "sbx_backend_bucket" {
  # Specify the name of the bucket
  name                     = var.rs_bucket
  # If set to true, allows the bucket to be destroyed even if it contains objects
  force_destroy            = false
  # Define the GCP project ID in which the bucket will be created
  project                  = var.project
  # Specify the geographical location of the bucket
  location                 = var.region
  # Define the storage class of the bucket (STANDARD, NEARLINE, COLDLINE, ARCHIVE)
  storage_class            = "STANDARD"
  # Prevent public access to the bucket's content
  public_access_prevention = "enforced"
  # Enable object versioning to keep multiple variants of an object in the same bucket
  versioning {
    enabled = true
  }
}
